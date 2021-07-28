function isbool=moc_islogical(A)
//checks if A is boolean
// Calling Sequence
// isbool=moc_islogical(A)
//  Parameters
// isbool:	true for boolean variables
// A:vector or matrix
// Description
// moc_islogical checks if A is boolean
//
// Authors
// H. Nahrstaedt - 2014
isbool = type(A)==4;

endfunction
