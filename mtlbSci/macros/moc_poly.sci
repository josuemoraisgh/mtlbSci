function y = moc_poly (x)
// poly function from octave
//Calling Sequence
// y = moc_poly (a)
//Description
// If ais a square N by N matrix, moc_poly (a)
// is the row vector of the coefficients of det (z * eye (N,N) - a),
// the characteristic polynomial of a.  As an example we can use
// this to find the eigenvalues of aas the roots of moc_poly (a).
//
// In real-life examples you should, however, use the spec function
// for computing eigenvalues.
//
// If x is a vector, poly (x) is a vector of coefficients
// of the polynomial whose roots are the elements of x.  That is,
// of c is a polynomial, then the elements of
//d = roots (poly (c))} are contained in c.
// The vectors c and d are, however, not equal due to sorting
// and numerical errors.
// Examples
// roots(moc_poly(eye(3,3)))
// Authors
// Kurt Hornik 1993
// Holger Nahrstaedt - 2014

// Author: KH <Kurt.Hornik@wu-wien.ac.at>
// Created: 24 December 1993
// Adapted-By: jwe

// Copyright (C) 1994, 1995, 1996, 1997, 1999, 2000, 2005, 2006, 2007,
//               2008, 2009 John W. Eaton
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


        if (nargin ~= 1)
          error ("y = moc_poly (x)");
        end

        m = min (size (x));
        n = max (size (x));
        if (m == 0)
          y = 1;
          return;
        elseif (m == 1)
          v = x;
        elseif (m == n)
          v = spec (x);
        else
          error ("y = moc_poly (x)");
        end

        y = zeros (1, n+1);
        y(1) = 1;
        for j = 1:n;
          y(2:(j+1)) = y(2:(j+1)) - v(j) .* y(1:j);
        end

        if (and (and (imag (x) == 0)))
          y = real (y);
        end

endfunction

        // %!assert(all (all (poly ([1, 2, 3]) == [1, -6, 11, -6])));
        //
        // %!assert(all (all (abs (poly ([1, 2; 3, 4]) - [1, -5, -2]) < sqrt (eps))));
        //
        // %!error poly ([1, 2, 3; 4, 5, 6]);
        //
        // %!assert(poly ([]),1);
