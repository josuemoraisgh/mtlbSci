 function [invmat] = moc_cholinv(mat)
//Use the Cholesky factorization to compute the inverse of the symmetric positive definite matrix a.
// Calling Sequence
// [invmat] = cholinv(mat)
// Describtion
// Use the Cholesky factorization to compute the inverse of the symmetric positive definite matrix a.

// R = chol(mat);
// Rtrans = R';
//
// n = length(mat);

// ident = eye(n,n);
//
// for i=1:n
//
//      invmat(:,i) = R\(Rtrans\ident(:,i));
//
// end

mat = chol(mat);

invmat = mat\eye((mat));

invmat = invmat * invmat';
endfunction
