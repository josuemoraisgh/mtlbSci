function y = moc_range (x, dim)
// Range of values
// Calling Sequence
// y = moc_range(x)
// y = moc_range(x,dim)
// Description
//  If xis a vector, return the range, i.e., the difference
// between the maximum and the minimum, of the input data.
//
// If x is a matrix, do the above for each column of x.
//
// If the optional argument dim is supplied, work along dimension
// Examples
// rv = grand(1000,5,'nor',0,1);
// near6 = moc_range(rv)
// near6 = 
//    7.8095835    5.8340675    6.2329766    5.9988651    6.86021
// Authors
// KH Kurt.Hornik@wu-wien.ac.at
// H. Nahrstaedt



// Copyright (C) 1995, 1996, 1997, 1998, 2000, 2002, 2004, 2005, 2006,
//               2007 Kurt Hornik
// Copyright (C) 2009 Jaroslav Hajek
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

  if (nargin == 1)
    y = mtlb_max (x) - mtlb_min (x);
  elseif (nargin == 2)
    y = mtlb_max (x, [], dim) - mtlb_min (x, [], dim);
  else
    error ("y = moc_range (x, dim)");
  end

endfunction
