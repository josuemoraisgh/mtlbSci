function y = moc_circshift (x, n)
// Circularly shift the values of the array x
// Calling Sequence
//   y = moc_circshift (x, n)
// Description
// Circularly shift the values of the array x.  n must be
// a vector of integers no longer than the number of dimensions in
// x.  The values of n can be either positive or negative,
// which determines the direction in which the values or x are
// shifted.  If an element of n is zero, then the corresponding
// dimension of x will not be shifted. 
// Examples
// x = [1, 2, 3; 4, 5, 6; 7, 8, 9];
// moc_circshift (x, 1)
//  ans  =
// 
//    7.    8.    9.  
//    1.    2.    3.  
//    4.    5.    6.
//   moc_circshift (x, -2)
//    ans  =
// 
//    7.    8.    9.  
//    1.    2.    3.  
//    4.    5.    6.  
//    
//moc_circshift (x, [0,1])
// ans  =
// 
//   3.    1.    2.  
//    6.    4.    5.  
//    9.    7.    8.  
//  Authors
// Copyright (C) 2004-2011 David Bateman
// H. Nahrstaedt - 2012

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

// -*- texinfo -*-
// @deftypefn {Function File} {@var{y} =} circshift (@var{x}, @var{n})
// Circularly shift the values of the array @var{x}.  @var{n} must be
// a vector of integers no longer than the number of dimensions in
// @var{x}.  The values of @var{n} can be either positive or negative,
// which determines the direction in which the values or @var{x} are
// shifted.  If an element of @var{n} is zero, then the corresponding
// dimension of @var{x} will not be shifted.  For example:
//
// @example
// @group
// x = [1, 2, 3; 4, 5, 6; 7, 8, 9];
// circshift (x, 1)
// @result{}  7, 8, 9
//     1, 2, 3
//     4, 5, 6
// circshift (x, -2)
// @result{}  7, 8, 9
//     1, 2, 3
//     4, 5, 6
// circshift (x, [0,1])
// @result{}  3, 1, 2
//     6, 4, 5
//     9, 7, 8
// @end group
// @end example
// @seealso {permute, ipermute, shiftdim}
// @end deftypefn
  [nargout,nargin]=argn(0);
  if (nargin == 2)
    if (isempty (x))
      y = x;
    else
      nd = ndims (x);
      sz = size (x);

      if (~ isvector (n) & length (n) > nd)
        error ("circshift: N must be a vector, no longer than the number of dimension in X");
      end

      if (or (n ~= floor (n)))
        error ("circshift: all values of N must be integers");
      end

      idx = cell ();
      for i = 1:length (n);
        nn = n(i);
        if (nn < 0)
          while (sz(i) <= -nn)
            nn = nn + sz(i);
          end
          idx(i).entries = [(1-nn):sz(i), 1:-nn];
        else
          while (sz(i) <= nn)
            nn = nn - sz(i);
          end
          idx(i).entries = [(sz(i)-nn+1):sz(i), 1:(sz(i)-nn)];
        end
      end
      for i = (length(n) + 1) : nd
        idx(i).entries  = 1:sz(i);
      end
      if typeof(x)=="list" then
	y=x;
	index=idx(1).entries(:);
	for i=1:length(x)
	  y(i)=x(index(i));
        end;
      else
	select nd
	case 1 then y=x(idx(1).entries(:));
	case 2 then y=x(idx(1).entries(:),idx(2).entries(:));
	case 3 then y=x(idx(1).entries(:),idx(2).entries(:),idx(3).entries(:));

	end;
      end;
    end
  else
    error (" ");
  end
endfunction

// %!shared x
// %! x = [1, 2, 3; 4, 5, 6; 7, 8, 9];
// 
// %!assert (circshift (x, 1), [7, 8, 9; 1, 2, 3; 4, 5, 6])
// %!assert (circshift (x, -2), [7, 8, 9; 1, 2, 3; 4, 5, 6])
// %!assert (circshift (x, [0, 1]), [3, 1, 2; 6, 4, 5; 9, 7, 8]);
// %!assert (circshift ([],1), [])
// 
// %!assert (full (circshift (eye (3), 1)), circshift (full (eye (3)), 1))
// %!assert (full (circshift (eye (3), 1)), [0,0,1;1,0,0;0,1,0])
