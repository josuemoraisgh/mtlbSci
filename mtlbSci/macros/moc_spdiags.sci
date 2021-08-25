function [A, c] = moc_spdiags (v, c, m, n)
// A generalization of the function 'diag'
// Calling Sequence
// [A, c] = moc_spdiags (v, c, m, n)
// Description
//      A generalization of the function 'diag'.  Called with a single
//      input argument, the non-zero diagonals C of A are extracted.  With
//      two arguments the diagonals to extract are given by the vector C.
// 
//      The other two forms of 'spdiags' modify the input matrix by
//      replacing the diagonals.  They use the columns of V to replace the
//      columns represented by the vector C.  If the sparse matrix A is
//      defined then the diagonals of this matrix are replaced.  Otherwise
//      a matrix of M by N is created with the diagonals given by V.
// 
//      Negative values of C represent diagonals below the main diagonal,
//      and positive values of C diagonals above the main diagonal.
//
// Examples
// moc_spdiags (matrix (1:12, 4, 3), [-1 0 1], 5, 4)
//Authors
//Paul Kienzle

// 
// @end deftypefn
 [nargout,nargin]=argn(0);
  if (nargin == 1 | nargin == 2)
    // extract nonzero diagonals of v into A,c
    [nr, nc] = size (v);
    [i, j] = find (v);
    v=find(v);v=v(:);
    if (nargin == 1)
      // c contains the active diagonals
      c = unique (j-i);
    end
    // FIXME: we can do this without a loop if we are clever
    offset = max (min (c, nc-nr), 0);
    A = zeros (min (nr, nc), length (c));
    for k = 1:length (c)
      idx = find (j-i == c(k));
      A(j(idx)-offset(k),k) = v(idx);
    end
  elseif (nargin == 3)
    // Replace specific diagonals c of m with v,c
    [nr, nc] = size (m);
    B = moc_spdiags (m, c);
    A = m - moc_spdiags (B, c, nr, nc) + moc_spdiags (v, c, nr, nc);
  else
    // Create new matrix of size mxn using v,c
    [j, i] = find (v);
    vv=find(v);vv=vv(:);
    v=v(:);v=v(vv);
    offset = max (min (c(:), n-m), 0);
    j = j(:) + offset(i(:));
    c=c(:);
    i = j(:)-c(i(:));
    idx = i > 0 & i <= m & j > 0 & j <= n;
    A = sparse ([i(idx), j(idx)], v(idx), [m, n]);
  end

endfunction


// %!test
// %assert(spdiags(zeros(1,0),1,1,1),0)
// 
// %!test
// %assert(spdiags(zeros(0,1),1,1,1),0)
