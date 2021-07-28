function [p, s, mu] = moc_polyfit (x, y, n)
// Return the coefficients of a polynomial
// Calling Sequence
// p= polyfit (x, y, n)
// [p, s] = polyfit (x, y, n)
// [p, s, mu] = polyfit (x, y, n)
// Parameters
//  n: degree (scalar) or logical vector
//  p: The polynomial coefficients are returned in a row vector.
//  s: The optional output s is a structure
//  s.R : Triangular factor R from the QR decomposition.
//  s.X: The Vandermonde matrix used to compute the polynomial coefficients.
//  s.C:  The unscaled covariance matrix, formally equal to the inverse of x'*x, but computed in a way minimizing roundoff error  propagation.
//  s.df: The degrees of freedom.
//  s.normr: The norm of the residuals.
//  s.yf:  The values of the polynomial for each value of x.
// Description
// Return the coefficients of a polynomial p(x) of degree
// n that minimizes the least-squares-error of the fit to the points
// [x, y].  If n is a logical vector, it is used
// as a mask to selectively force the corresponding polynomial
// coefficients to be used or ignored.
//
//
// The second output may be used by moc_polyval to calculate the
// statistical error limits of the predicted values.  In particular, the
// standard deviation of pcoefficients is given by  sqrt (diag (s.C)/s.df)*s.normr.
//
// When the third output, mu, is present the
// coefficients, p, are associated with a polynomial in
// xhat = (x-mu(1))/mu(2).
// Where mu(1) = mean (x), and mu(2) = stdev (x).
// This linear transformation of x improves the numerical
// stability of the fit.
// See also
// moc_polyval
// Authors
// Kurt Hornik - 1994
// Holger Nahrstaedt  2014

// Author: KH <Kurt.Hornik@wu-wien.ac.at>
// Created: 13 December 1994
// Adapted-By: jwe
// Modified on 20120204 by P. Dupuis; added the ability to specify a
// polynomial mask instead of a polynomial degree.

// Copyright (C) 1996-2013 John W. Eaton
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


    if (nargin < 3 | nargin > 4)
    error("[p, s, mu] = moc_polyfit (x, y, n)");
    end

    if (nargout > 2)
    // Normalized the x values.
    mu = [mean(x), stdev(x)];
    x = (x - mu(1)) / mu(2);
    end

    if (~ moc_size_equal (x, y))
      error ("polyfit: X and Y must be vectors of the same size");
    end

    if (moc_islogical (n))
      polymask = n;
      // n is the polynomial degree as given the polymask size; m is the
      // effective number of used coefficients.
      n = length (polymask) - 1; m = sum (polymask) - 1;
    else
      if (~ (isscalar (n) & n >= 0 & ~isinf (n) & n == fix (n)))
        error ("polyfit: N must be a non-negative integer");
      end
      polymask = moc_logical (ones (1, n+1)); m = n;
    end

    y_is_row_vector = (moc_rows (y) == 1);

    // Reshape x & y into column vectors.
    l = length (x);
    x = x(:);
    y = y(:);

    // Construct the Vandermonde matrix.
    v = makematrix_vandermonde (x, n+1);
    v=v(:,$:-1:1);
    // Solve by QR decomposition.
    //[q, r, k] = qr (v(:, polymask), 0);
    [q, r, k, E] = qr (v(:, polymask), 0);
    k=(1:k)*E; // [q,r,k] as for octave
    p = r \ (q' * y);
    p(k) = p;

    if (n ~= m)
      q = p; p = zeros (n+1, 1);
      p(polymask) = q;
    end

    if (nargout > 1)
    yf = v*p;

    if (y_is_row_vector)
      s.yf = yf.';
    else
        s.yf = yf;
    end
      s.X = v;

      // r.'*r is positive definite if X(:, polymask) is of full rank.
      // Invert it by cholinv to avoid taking the square root of squared
      // quantities. If cholinv fails, then X(:, polymask) is rank
      // deficient and not invertible.
      try
        C = moc_cholinv (r.'*r);
        C=C(k, k);
      catch
        C = %nan*ones (m+1, m+1);
      end

      if (n ~= m)
      // fill matrices if required
        s.X(:, ~polymask) = 0;
        s.R = zeros (n+1, n+1); s.R(polymask, polymask) = r;
        s.C = zeros (n+1, n+1); s.C(polymask, polymask) = C;
      else
        s.R = r;
        s.C = C;
      end
      s.df = l - m - 1;
      s.normr = norm (yf - y);
    end

    // Return a row vector.
    p = p.';

endfunction


    // %!shared x
    // %! x = [-2, -1, 0, 1, 2];
    // %!assert (polyfit (x, x.^2+x+1, 2), [1, 1, 1], sqrt (eps))
    // %!assert (polyfit (x, x.^2+x+1, 3), [0, 1, 1, 1], sqrt (eps))
    // %!fail ("polyfit (x, x.^2+x+1)")
    // %!fail ("polyfit (x, x.^2+x+1, [])")
    //
    // // Test difficult case where scaling is really needed. This example
    // // demonstrates the rather poor result which occurs when the dependent
    // // variable is not normalized properly.
    // // Also check the usage of 2nd & 3rd output arguments.
    // %!test
    // %! x = [ -1196.4, -1195.2, -1194, -1192.8, -1191.6, -1190.4, -1189.2, -1188, ...
    // %!       -1186.8, -1185.6, -1184.4, -1183.2, -1182];
    // %! y = [ 315571.7086, 315575.9618, 315579.4195, 315582.6206, 315585.4966, ...
    // %!       315588.3172, 315590.9326, 315593.5934, 315596.0455, 315598.4201, ...
    // %!       315600.7143, 315602.9508, 315605.1765 ];
    // %! [p1, s1] = polyfit (x, y, 10);
    // %! [p2, s2, mu] = polyfit (x, y, 10);
    // %! assert (s2.normr < s1.normr);
    //
    // %!test
    // %! x = 1:4;
    // %! p0 = [1i, 0, 2i, 4];
    // %! y0 = polyval (p0, x);
    // %! p = polyfit (x, y0, numel (p0) - 1);
    // %! assert (p, p0, 1000*eps);
    //
    // %!test
    // %! x = 1000 + (-5:5);
    // %! xn = (x - mean (x)) / stdev (x);
    // %! pn = ones (1,5);
    // %! y = polyval (pn, xn);
    // %! [p, s, mu] = moc_polyfit (x, y, length (pn) - 1);
    // %! [p2, s2] = moc_polyfit (x, y, length (pn) - 1);
    // %! assert (p, pn, s.normr);
    // %! assert (s.yf, y, s.normr);
    // %! assert (mu, [mean(x), std(x)]);
    // %! assert (s.normr/s2.normr < sqrt (eps));
    //
    // %!test
    // %! x = [1, 2, 3; 4, 5, 6];
    // %! y = [0, 0, 1; 1, 0, 0];
    // %! p = polyfit (x, y, 5);
    // %! expected = [0, 1, -14, 65, -112, 60] / 12;
    // %! assert (p, expected, sqrt (eps));
    //
    // %!error <vectors of the same size> polyfit ([1, 2; 3, 4], [1, 2, 3, 4], 2)
