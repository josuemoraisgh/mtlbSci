function [varargout] = moc_deal (varargin)
// Copy the input parameters into the corresponding output parameters.
// Calling Sequence
// [r1, r2, ..., rn] = moc_deal (a)
// [r1, r2, ..., rn] = moc_deal (a1, a2, ..., an)
// Description
// Copy the input parameters into the corresponding output parameters.
// If only one input parameter is supplied, its value is copied to each
// of the outputs.
// Examples
// [a, b, c] = deal (x, y, z);
// [a, b, c] = deal (x);
// Authors
//  Ariel Tankus
//  Paul Kienzle and Etienne Grossman
// H. Nahrstaedt - 2014


// Copyright (C) 1998-2013 Ariel Tankus
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
// @deftypefn  {Function File} {[@var{r1}, @var{r2}, @dots{}, @var{rn}] =} deal (@var{a})
// @deftypefnx {Function File} {[@var{r1}, @var{r2}, @dots{}, @var{rn}] =} deal (@var{a1}, @var{a2}, @dots{}, @var{an})
//
// Copy the input parameters into the corresponding output parameters.
// If only one input parameter is supplied, its value is copied to each
// of the outputs.
//
// For example,
//
// @example
// [a, b, c] = deal (x, y, z);
// @end example
//
// @noindent
// is equivalent to
//
// @example
// @group
// a = x;
// b = y;
// c = z;
// @end group
// @end example
//
// @noindent
// and
//
// @example
// [a, b, c] = deal (x);
// @end example
//
// @noindent
// is equivalent to
//
// @example
// a = b = c = x;
// @end example
// @end deftypefn

// Author: Ariel Tankus
// Author: Paul Kienzle and Etienne Grossman
// Created: 13.11.98
// Adapted-by: jwe

[nargout,nargin]=argn(0);
  if (nargin == 0)
    error ("to less input Arguments");
  elseif (length(varargin) == nargout)
    for i=1:length(varargin)
      varargout(i) = varargin(i);
    end;
   elseif (nargin==1)
    for i=1:nargout
      varargout(i) = varargin(1);
    end;
  else
    error ("deal: nargin > 1 and nargin != nargout");
  end

endfunction


//test
// [a,b] = deal (1,2);
// assert (a, 1);
// assert (b, 2);
//test
// [a,b] = deal (1);
// assert (a, 1);
// assert (b, 1);

