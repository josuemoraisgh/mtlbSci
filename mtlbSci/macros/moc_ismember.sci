function [tf, a_idx] = moc_ismember (a, s, rows_opt) 
//Checks which elements of one matrix are member of an other matrix
//Calling Sequence
//tf = moc_ismember (A, S) 
//[tf,S_idx] = moc_ismember (A, S) 
//[tf,S_idx] = moc_ismember (A, S,'rows')
// 
// Description
// Return a matrix tf with the same shape as A which has a 1 if 
// A(i,j) is in S and 0 if it is not.  If a second output argument 
// is requested, the index into S of each of the matching elements is
// also returned. 
// 
//  With the optional third argument "rows", and matrices 
// A and S with the same number of columns, compare rows in
// A with the rows in S.
//
// Examples
// a = [3, 10, 1];
// s = [0:9];
// [tf, s_idx] = moc_ismember (a, s)
//
// a = [1:3; 5:7; 4:6];
// s = [0:2; 1:3; 2:4; 3:5; 4:6];
// [tf, s_idx] = moc_ismember(a, s, 'rows')
// Authors
//  Paul Kienzle pkienzle@users.sf.net
//  Søren Hauberg hauberg@gmail.com
//  Ben Abbott bpabbott@mac.com
//  jwe
//  H. Nahrstaedt - 2011 - 2013

// Copyright (C) 2000, 2005, 2006, 2007, 2008, 2009 Paul Kienzle
//
// This file is part of Octave.
//
// Octave is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or (at
// your option) any later version.
//
// Octave is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Octave; see the file COPYING.  If not, see
// <http://www.gnu.org/licenses/>.



[nargout,nargin]=argn(0);

  if (nargin == 2 | nargin == 3) 
    if (iscell (a) | iscell (s))
        error ("moc_ismember: a and must not be cells!"); 
      
    else
      if (nargin == 3) 
        // The 'rows' argument is handled in a fairly ugly way. A better
        // solution would be to vectorize this loop over 'r' below.
        if ( (rows_opt== "rows") & min(size (a))>1 & min(size (s))>1 & size (a,2) == size (s,2)) 
          rs = size (s,1);
          ra = size (a,1);
          a_idx = zeros (ra, 1);
          for r = 1:ra
           tmp = ones (rs, 1) * a(r,:);
            f = find (and (tmp' == s',1), 1);
            if (  ~isempty (f))
              a_idx(r) = f;
            end
          end
          tf =  (a_idx)~=0;
        elseif ( (rows_opt== "rows"))
          error ("moc_ismember: with rows both sets must be matrices with an equal number of columns"); 
        else
          error ("moc_ismember: invalid input"); 
        end
      else
        // Input checking 
        if (~type(a)==type(s)) 
          error ("moc_ismember: both input arguments must be the same type");
        elseif ( ~type (a)==10 &  ~or(type(a)==[1 5 8]) )
          error ("moc_ismember: input arguments must be arrays, cell arrays, or strings"); 
        elseif (type (a)==10 & type(s)==10)
          a = ascii (a);
          s = ascii (s);
        end
        // Convert matrices to vectors.
        if (and (size (a) > 1))
          a = a(:);
        end
        if (and (size (s) > 1))
          s = s(:);
        end
        // Do the actual work.
        if (isempty (a) | isempty (s))
          tf = zeros (size (a,1),size(a,2))~=0;
          a_idx = zeros (size (a,1),size(a,2)); 
        elseif (length (s) == 1) 
          tf = (a == s);
          a_idx = double (tf);
        elseif (length (a) == 1) 
          f = find (a == s, 1); 
          tf = ~isempty (f);
          a_idx = f; 
          if (isempty (a_idx))
            a_idx = 0;
          end
        else
          // Magic:  the following code determines for each a, the index i 
          // such that s(i)<= a < s(i+1).  It does this by sorting the a 
          // into s and remembering the source index where each element came 
          // from.  Since all the a's originally came after all the s's, if 
          // the source index is less than the length of s, then the element 
          // came from s.  We can then do a cumulative sum on the indices to 
          // figure out which element of s each a comes after. 
          // E.g., s=[2 4 6], a=[1 2 3 4 5 6 7] 
          //    unsorted [s a]  = [ 2 4 6 1 2 3 4 5 6 7 ] 
          //    sorted [s a]    = [ 1 2 2 3 4 4 5 6 6 7 ] 
          //    source index p  = [ 4 1 5 6 2 7 8 3 9 10 ] 
          //    boolean p<=l(s) = [ 0 1 0 0 1 0 0 1 0 0 ] 
          //    cumsum(p<=l(s)) = [ 0 1 1 1 2 2 2 3 3 3 ] 
          // Note that this leaves a(1) coming after s(0) which doesn't 
          // exist.  So arbitrarily, we will dump all elements less than 
          // s(1) into the interval after s(1).  We do this by dropping s(1) 
          // from the sort!  E.g., s=[2 4 6], a=[1 2 3 4 5 6 7] 
          //    unsorted [s(2:3) a] =[4 6 1 2 3 4 5 6 7 ] 
          //    sorted [s(2:3) a] = [ 1 2 3 4 4 5 6 6 7 ] 
          //    source index p    = [ 3 4 5 1 6 7 2 8 9 ] 
          //    boolean p<=l(s)-1 = [ 0 0 0 1 0 0 1 0 0 ] 
          //    cumsum(p<=l(s)-1) = [ 0 0 0 1 1 1 2 2 2 ] 
          // Now we can use Octave's lvalue indexing to "invert" the sort, 
          // and assign all these indices back to the appropriate a and s, 
          // giving s_idx = [ -- 1 2], a_idx = [ 0 0 0 1 1 2 2 ].  Add 1 to 
          // a_idx, and we know which interval s(i) contains a.  It is 
          // easy to now check membership by comparing s(a_idx) == a.  This 
          // magic works because s starts out sorted, and because sort 
          // preserves the relative order of identical elements. 
          lt = max(size(s)); 
          [s, sidx] = mtlb_sort (s); 
          tmp=s(2:lt);
          [v, p] = mtlb_sort ([tmp(:); a(:)]); 
          idx(p) = cumsum (p <= lt-1) + 1; 
          idx = idx(lt:$); 
          tf = (a == matrix (s(idx), size (a))); 
          a_idx = zeros (size (tf,1),size(tf,2)); 
          a_idx(tf) = sidx(idx(tf));
        end
        // Resize result to the original size of 'a' 
        size_a = size (a);
        tf = matrix (tf, size_a); 
        a_idx = matrix (a_idx, size_a);
      end
    end
  else
    error ("wrong usage");
  end

endfunction


//!assert (ismember ({''}, {'abc', 'def'}), false);
//!assert (ismember ('abc', {'abc', 'def'}), true);
//!assert (isempty (ismember ([], [1, 2])), true);
//!assert (isempty (ismember ({}, {'a', 'b'})), true);
//!assert (ismember ('', {'abc', 'def'}), false);
//!fail ('ismember ([], {1, 2})');
//!fail ('ismember ({[]}, {1, 2})');
//!fail ('ismember ({}, {1, 2})');
//!fail ('ismember ({1}, {''1'', ''2''})');
//!fail ('ismember (1, ''abc'')');
//!fail ('ismember ({''1''}, {''1'', ''2''},''rows'')');
//!fail ('ismember ([1 2 3], [5 4 3 1], ''rows'')');
//!assert (ismember ({'foo', 'bar'}, {'foobar'}), logical ([0, 0]));
//!assert (ismember ({'foo'}, {'foobar'}), false);
//!assert (ismember ({'bar'}, {'foobar'}), false);
//!assert (ismember ({'bar'}, {'foobar', 'bar'}), true);
//!assert (ismember ({'foo', 'bar'}, {'foobar', 'bar'}), logical ([0, 1]));
//!assert (ismember ({'xfb', 'f', 'b'}, {'fb', 'b'}), logical ([0, 0, 1]));
//!assert (ismember ("1", "0123456789."), true);

//!test
//! [result, a_idx] = ismember ([1, 2], []);
//! assert (result, logical ([0, 0]))
//! assert (a_idx, [0, 0]);

//!test
//! [result, a_idx] = ismember ([], [1, 2]);
//! assert (result, logical ([]))
//! assert (a_idx, []);

//!test
//! [result, a_idx] = ismember ({'a', 'b'}, '');
//! assert (result, logical ([0, 0]))
//! assert (a_idx, [0, 0]);

//!test
//! [result, a_idx] = ismember ({'a', 'b'}, {});
//! assert (result, logical ([0, 0]))
//! assert (a_idx, [0, 0]);

//!test
//! [result, a_idx] = ismember ('', {'a', 'b'});
//! assert (result, false)
//! assert (a_idx, 0);

//!test
//! [result, a_idx] = ismember ({}, {'a', 'b'});
//! assert (result, logical ([]))
//! assert (a_idx, []);

//!test
//! [result, a_idx] = ismember([1 2 3 4 5], [3]);
//! assert (all (result == logical ([0 0 1 0 0])) && all (a_idx == [0 0 1 0 0]));

//!test
//! [result, a_idx] = ismember([1 6], [1 2 3 4 5 1 6 1]);
//! assert (all (result == logical ([1 1])) && all (a_idx == [8 7]));

//!test
//! [result, a_idx] = ismember ([3,10,1], [0,1,2,3,4,5,6,7,8,9]);
//! assert (all (result == logical ([1, 0, 1])) && all (a_idx == [4, 0, 2]));

//!test
//! [result, a_idx] = ismember ("1.1", "0123456789.1");
//! assert (all (result == logical ([1, 1, 1])) && all (a_idx == [12, 11, 12]));

//!test
//! [result, a_idx] = ismember([1:3; 5:7; 4:6], [0:2; 1:3; 2:4; 3:5; 4:6], 'rows');
//! assert (all (result == logical ([1; 0; 1])) && all (a_idx == [2; 0; 5]));

//!test
//! [result, a_idx] = ismember([1.1,1.2,1.3; 2.1,2.2,2.3; 10,11,12], [1.1,1.2,1.3; 10,11,12; 2.12,2.22,2.32], 'rows');
//! assert (all (result == logical ([1; 0; 1])) && all (a_idx == [1; 0; 2]));

