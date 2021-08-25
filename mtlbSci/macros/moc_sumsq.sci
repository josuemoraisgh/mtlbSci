function [o]=moc_sumsq(x,DIM)
// calculates the sum of squares.
// Calling Sequence
// [y] = moc_sumsq(x [,  DIM])
//  Parameters
// DIM:	dimension
// 	N STD of  N-th dimension 
//	default or []: first DIMENSION, with more than 1 element
//
// y:	estimated standard deviation
// Description
//
//Sum of squares of elements along dimension DIM.  If DIM is omitted,
//     it defaults to the first non-singleton dimension.
//
//
// Authors
// H. Nahrstaedt - 2014


 [nargout,nargin]=argn(0);
if nargin<2,
	DIM = []; 
end;
if isempty(DIM), 
        DIM = find(size(x)>1,1);
        if isempty(DIM), DIM=1; end;
end;

if (isreal(x)) then
  o=sum(x.^2,DIM);
else
 o=sum (x .* conj (x), DIM)
end

endfunction
