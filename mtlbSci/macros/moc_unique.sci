function  [y, i, j] = moc_unique (x,param)
// Return the unique elements of x, sorted in ascending order.
// Calling Sequence
//  moc_unique (x)
//  moc_unique (x, "rows")
//  moc_unique (..., "first")
//  umoc_nique (..., "last")
// [y, i, j] = moc_unique (...)
// Description
// If x is a row vector, return a row vector, but if x
// is a column vector or a matrix return a column vector.
//
// If the optional argument "rows" is supplied, return the unique
// rows of x, sorted in ascending order.
//
// If requested, return index vectors i and j such that
// x(i)==y and y(j)==x.
//
// Additionally, one of "first" or "last" may be given as
// an argument.  If "last" is specified, return the highest
// possible indices in i, otherwise, if "first" is
// specified, return the lowest.  The default is "last".
// See also
// moc_ismember
// Authors
// Copyright (C) 2008, 2009 Jaroslav Hajek
// Copyright (C) 2000, 2001, 2005, 2006, 2007 Paul Kienzle
// H. Nahrstaedt 2010,2011

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
if (nargin < 1)
    error ("One Argument is needed!");
  end
if nargin==1
  optfirst = 0;
  optrows = 0;
else
      optfirst =  (param=="first");
      optlast = param=="last"
      optrows = param=="rows" & size (x, 2) > 1;

end
  if (optrows)
    n = size (x, 1);
    dim = 1;
  else
    n = size (x,'*');
    dim = (size (x, 1) == 1) + 1;
  end

  y = x;
  if (n < 1)
    i = [];
    j = [];
    return;
  elseif (n < 2)
    i = 1; 
    j = 1;
    return;
  end

  if (optrows)
    [y, i] =  gsort(y,'r','i');
    match = and (y(1:n-1,:) == y(2:n,:), 2);
    idx = find (match);
    y(idx,:) = [];
  else
    if (size (y, 1) ~= 1)
      y = y(:);
    end
    //[y, i] = mtlb_sort (y);
    [y, i] = gsort (y,'g','i')
    match = (y(1:n-1) == y(2:n));
    idx = find (match);
    y(idx) = [];
  end

  if (nargout >= 3)
    j = i;
    if (dim == 1)
      j(i) = cumsum ([1; ~match]);
    else
      j(i) = cumsum ([1, ~match]);
    end
  end

  if (optfirst)
    i(idx+1) = [];
  else
    i(idx) = [];
  end
endfunction

//assert(unique([1 1 2; 1 2 1; 1 1 2]),[1;2])
//assert(unique([1 1 2; 1 0 1; 1 1 2],'rows'),[1 0 1; 1 1 2])
//assert(unique([]),[])
//assert(unique([1]),[1])
//assert(unique([1 2]),[1 2])
//assert(unique([1;2]),[1;2])
//assert(unique([1,NaN,Inf,NaN,Inf]),[1,Inf,NaN,NaN])
//assert(unique({'Foo','Bar','Foo'}),{'Bar','Foo'})
//assert(unique({'Foo','Bar','FooBar'}'),{'Bar','Foo','FooBar'}')

//test
// [a,i,j] = unique([1,1,2,3,3,3,4]);
// assert(a,[1,2,3,4])
// assert(i,[2,3,6,7])
// assert(j,[1,1,2,3,3,3,4])
//
//test
// [a,i,j] = unique([1,1,2,3,3,3,4]','first');
// assert(a,[1,2,3,4]')
// assert(i,[1,3,4,7]')
// assert(j,[1,1,2,3,3,3,4]')
//
//test
// [a,i,j] = unique({'z'; 'z'; 'z'});
// assert(a,{'z'})
// assert(i,[3]')
// assert(j,[1,1,1]')
//
//test
// A=[1,2,3;1,2,3];
// [a,i,j] = unique(A,'rows');
// assert(a,[1,2,3])
// assert(A(i,:),a)
// assert(a(j,:),A)

