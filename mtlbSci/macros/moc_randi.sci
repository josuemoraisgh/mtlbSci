function ri = moc_randi (bounds, varargin)
// Return random integers in a given range
// Calling Sequence
// ri = moc_randi(imax)
// ri = moc_randi(imax,n)
// ri = moc_randi(imax,m,n,...)
// ri = moc_randi([imin,imax],...)
// Description
// Additional arguments determine the shape of the return matrix.  When no
// arguments are specified a single random integer is returned.  If one
// argument n is specified then a square matrix (n x n) is
// returned.  Two or more arguments will return a multi-dimensional
// matrix (m x n x ...).
//
// The integer range may optionally be described by a two element matrix
// with a lower and upper bound in which case the returned integers will be
// on the interval [imin, imax].
// Examples
// // The following example returns 150 integers in the range 1-10.
//ri = randi (10, 150, 1)
// Authors
// Rik Wehbring
// H. Nahrstaedt  - 2014

// Copyright (C) 2010-2013 Rik Wehbring
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
// @deftypefn  {Function File} {} randi (@var{imax})
// @deftypefnx {Function File} {} randi (@var{imax}, @var{n})
// @deftypefnx {Function File} {} randi (@var{imax}, @var{m}, @var{n}, @dots{})
// @deftypefnx {Function File} {} randi ([@var{imin} @var{imax}], @dots{})
// @deftypefnx {Function File} {} randi (@dots{}, "@var{class}")
// Return random integers in the range 1:@var{imax}.
//
// Additional arguments determine the shape of the return matrix.  When no
// arguments are specified a single random integer is returned.  If one
// argument @var{n} is specified then a square matrix @w{(@var{n} x @var{n})} is
// returned.  Two or more arguments will return a multi-dimensional
// matrix @w{(@var{m} x @var{n} x @dots{})}.
//
// The integer range may optionally be described by a two element matrix
// with a lower and upper bound in which case the returned integers will be
// on the interval @w{[@var{imin}, @var{imax}]}.
//
// The optional argument @var{class} will return a matrix of the requested
// type.  The default is @qcode{"double"}.
//
// The following example returns 150 integers in the range 1-10.
//
// @example
// ri = randi (10, 150, 1)
// @end example
//
// Implementation Note: @code{randi} relies internally on @code{rand} which
// uses class @qcode{"double"} to represent numbers.  This limits the maximum
// integer (@var{imax}) and range (@var{imax} - @var{imin}) to the value
// returned by the @code{bitmax} function.  For IEEE floating point numbers
// this value is @w{@math{2^{53} - 1}}.
//
// @seealso{rand}
// @end deftypefn

// Author: Rik Wehbring
// 
[nargout,nargin]=argn(0);
  if (nargin < 1)
    error ("Wrong number of input variables!");
  end

  if (~ (or(type (bounds)==[1 4 8]) & isreal (bounds)))
    error ("randi: IMIN and IMAX must be real numeric bounds");
  end

  if (isscalar (bounds))
    imin = 1;
    imax = fix (bounds);
    if (imax < 1)
      error ("randi: require IMAX >= 1");
    end
  else
    imin = fix (bounds(1));
    imax = fix (bounds(2));
    if (imax < imin)
      error ("randi: require IMIN <= IMAX");
    end
  end

  if (nargin > 1 & type (varargin($))==10)
    rclass = varargin($);
    varargin($) = [];
  else
    rclass = "double";
  end

//   if (strcmp (rclass, "int"))
//     if (imax > intmax (rclass))
//       error ("randi: require IMAX < intmax (CLASS)");
//     end
//   elseif (strcmp (rclass, "single"))
//     if (imax > bitmax (rclass))
//       error ("randi: require IMAX < bitmax (CLASS)");
//     end
//   end
//   // Limit set by use of class double in rand()
//   if (imax > bitmax)
//     error ("randi: maximum integer IMAX must be smaller than bitmax ()");
//   end
//   if ((imax - imin) > bitmax)
//     error ("randi: maximum integer range must be smaller than bitmax ()");
//   end

if length(varargin)==1
  ri = imin + floor ( (imax-imin+1)*rand (varargin(1)) );
elseif length(varargin)==2
ri = imin + floor ( (imax-imin+1)*rand (varargin(1),varargin(2)) );
elseif length(varargin)==3
ri = imin + floor ( (imax-imin+1)*rand (varargin(1),varargin(2),varargin(3)) );
else
 error("Wrong number of input arguments");
end

  if (~ (rclass=="double" | rclass=="float"))
    itype=4;
    ri = iconvert (ri, itype);
  end

endfunction


//test
// ri = randi (10, 1000, 1);
// assert (ri, fix (ri));
// assert (min (ri), 1);
// assert (max (ri), 10);
// assert (rows (ri), 1000);
// assert (columns (ri), 1);
// assert (class (ri), "double");
//test
// ri = randi ([-5, 10], 1000, 1, "int8");
// assert (ri, fix (ri));
// assert (min (ri), int8 (-5));
// assert (max (ri), int8 (10));
// assert (class (ri), "int8");
//
//assert (size (randi (10, 3,1,2)), [3, 1, 2])

// Test input validation
//error (randi ())
//error (randi ("test"))
//error (randi (10+2i))
//error (randi (0))
//error (randi ([10, 1]))
//error (randi (256, "uint8"))
//error (randi (2^25, "single"))
//error (randi (bitmax () + 1))
//error (randi ([-1, bitmax()]))

