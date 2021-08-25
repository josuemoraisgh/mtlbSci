function retval = moc_null (A, tol)
//  Return an orthonormal basis of the null space of A.
// Calling Sequence
// retval = moc_null (A)
// retval = moc_null (A, tol)
// Description
// The dimension of the null space is taken as the number of singular
//     values of A not greater than TOL.  If the argument TOL is missing,
//     it is computed as
//          max (size (A)) * max (svd (A)) * eps

  eps=2.2204e-16;

  if (isempty (A))
    retval = [];
  else
    [U, S, V] = svd (A);

    [rows, cols] = size (A);

    [S_nr, S_nc] = size (S);

    if (S_nr == 1 | S_nc == 1)
      s = S(1);
    else
      s = diag (S);
    end

    if (argn(2) == 1)
        tol = mtlb_max(size(A)) * s(1) * eps;
    elseif (argn(2) ~= 2),
      error("fehler!");
    end

    srank = sum (s > tol);

    if (srank < cols)
      retval = V (:, srank+1:cols);     
      retval(abs (retval) < eps) = 0;
    else
      retval = zeros (cols, 0);
    end
  end

endfunction


// %!test
// %! A = 0;
// %! assert(null(A), 1);
// 
// %!test
// %! A = 1;
// %! assert(null(A), zeros(1,0))
// 
// %!test
// %! A = [1 0; 0 1];
// %! assert(null(A), zeros(2,0));
// 
// %!test
// %! A = [1 0; 1 0];
// %! assert(null(A), [0 1]')
// 
// %!test
// %! A = [1 1; 0 0];
// %! assert(null(A), [-1/sqrt(2) 1/sqrt(2)]', eps)
// 
// %!test
// %! tol = 1e-4;
// %! A = [1 0; 0 tol-eps];
// %! assert(null(A,tol), [0 1]')
// 
// %!test
// %! tol = 1e-4;
// %! A = [1 0; 0 tol+eps];
// %! assert(null(A,tol), zeros(2,0));
// 
// %!error null()
