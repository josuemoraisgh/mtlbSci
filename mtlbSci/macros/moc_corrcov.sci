function [R,sigma] =  moc_corrcov(C)
// Compute correlation matrix from covariance matrix.
//  Calling Sequence
//  R = moc_corrcov(C)
//  Parameters
//  C: covariance matrix, must be square,  symmetric, and positive semi-definite
//  R: correlation matrix, which corresponds to the
//   covariance matrix C, by standardizing each row and column of C using the
//   square roots of the variances (diagonal elements) of C.
//   See also
//   moc_cov
// Authors
// H. Nahrstaedt - 2010

 [nargout,nargin]=argn(0);
// Check 
if nargin < 1
        error('Need at least one parameter!');
end

[m,n] = size(C);
sigma = sqrt(diag(C)); // sqrt first to avoid under/overflow
R = C ./ (sigma*sigma');

// Fix up possible round-off problems, while preserving NaN: put exact 1 on the
// diagonal, and limit off-diag to [-1,1]
t = find(abs(R) > 1); 
R(t) = R(t) ./abs(R(t));
R(1:m+1:$) = sign(diag(R));

endfunction
