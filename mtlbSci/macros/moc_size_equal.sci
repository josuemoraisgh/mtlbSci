function isEqual=moc_size_equal(A,B)
// checks if A and B have the same size
// Calling Sequence
// isEqual=moc_size_equal(A,B)
//  Parameters
// isEqual:	A and B have the same size
// A:vector or matrix
// B:vector or matrix
// Description
// moc_size_equal checks if A and B have the same size
//
// Authors
// H. Nahrstaedt - 2014
isEqual=size(A)==size(B);


endfunction
