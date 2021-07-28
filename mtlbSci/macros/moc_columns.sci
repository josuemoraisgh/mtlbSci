function nr=moc_columns(A)
// gives the number of columns from A
// Calling Sequence
// nr_of_columns=moc_columns(A)
//  Parameters
// nr_of_columns:	number of rows
// A:vector or matrix
// Description
// moc_columns gives the number of columns from A
// See also
// moc_rows
// Authors
// H. Nahrstaedt - 2014
s=size(A);
nr=s(2);

endfunction
