function y = moc_postpad (x, l, c, dim)
// append the scalar
// Calling Sequence
// y = moc_postpad (x, l,c)
// y = moc_postpad (x, l,c,dim)
// Description
// append the scalar value c to the vector x
// until it is of length l.  If the third argument is not
// supplied, a value of 0 is used.
//
// If length (x > l), elements from the end of
// x are removed until a vector of length l is obtained.
//
// If x is a matrix, elements are prepended or removed from each row.
//
// If the optional dim argument is given, then operate along this dimension.
//See also
// moc_prepad
// Authors
//  John W. Eaton
// Tony Richardson arichard@stark.cc.oh.us
//  H. Nahrstaedt - 2010

// Copyright (C) 1994, 1995, 1996, 1997, 1998, 2000, 2002, 2004, 2005,
//               2006, 2007, 2008, 2009 John W. Eaton
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
// @deftypefn {Function File} {} postpad (@var{x}, @var{l}, @var{c})
// @deftypefnx {Function File} {} postpad (@var{x}, @var{l}, @var{c}, @var{dim})
// @seealso{prepad, resize}
// @end deftypefn

// Author: Tony Richardson <arichard@stark.cc.oh.us>
// Created: June 1994

   [nargout,nargin]=argn(0);
  if (nargin < 2 | nargin > 4)
    error(" ");
  end

  if (nargin < 3 | isempty (c))
    c = 0;
  else
    if (~sum(length(c))==1)
      error ("moc_postpad: third argument must be empty or a scalar");
    end
  end

  nd = ndims (x);
  sz = size (x);
  if (nargin < 4)
    // Find the first non-singleton dimension
    dim  = 1;
    while (dim < nd + 1 & sz (dim) == 1)
      dim = dim + 1;
    end
    if (dim > nd)
      dim = 1;
    end
  else
    if (~(sum(length(dim))==1 & dim == round (dim)) & dim > 0 & 	dim < (nd + 1))
      error ("postpad: dim must be an integer and valid dimension");
    end
  end

  if (~ sum(length(l))==1 | l < 0)
    error ("second argument must be a positive scaler");
  end

  if (dim > nd)
    sz(nd+1:dim) = 1;
  end

  d = sz (dim);

  if (d >= l)
    idx = list();
    for i = 1:nd
      idx(i) = 1:sz(i);
    end
    idx(dim) = 1:l;
    //y = x(idx{:});
    y = x(idx(1),idx(2));
  else
    sz (dim) = l - d;
    funcprot(0);
    y = cat (dim, x, c * mtlb_ones (sz));
    funcprot(1);
  end

endfunction


// %!error postpad ();
// %!error postpad (1);
// %!error postpad (1,2,3,4,5);
// %!error postpad ([1,2], 2, 2,3);
// 
// %!assert (postpad ([1,2], 4), [1,2,0,0]);
// %!assert (postpad ([1;2], 4), [1;2;0;0]);
// 
// %!assert (postpad ([1,2], 4, 2), [1,2,2,2]);
// %!assert (postpad ([1;2], 4, 2), [1;2;2;2]);
// 
// %!assert (postpad ([1,2], 2, 2, 1), [1,2;2,2]);
