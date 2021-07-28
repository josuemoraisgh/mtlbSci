function isnumeric=moc_isnumeric(A)
//checks if A is numeric datatype
// Calling Sequence
// isnumeric=moc_isnumeric(A)
//  Parameters
// isnumeric:	true for numeric variables
// A:vector or matrix
// Description
// moc_isnumeric checks if A is a numeric datatype
//
// Authors
// H. Nahrstaedt - 2014
isnumeric = or(type(A)==[1 5 8 17]);

endfunction
