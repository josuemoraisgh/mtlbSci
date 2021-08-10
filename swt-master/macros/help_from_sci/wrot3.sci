function Y=wrot3(x,M,N)
// 3D matrix rotation
// Calling Sequence
// Y=wrot3(x,M,N)
// Parameters
// x : double 3D matrix
// M: M is for rotation direction: 0 is for null rotation (row, col, slice), 1 for (column,row,slice), 2 for (row, slice, column), 3 for (slice, row, column), 4 for (column, slice, row), 5 for (slice, column, row).
// N: forward or reverse, 0 for forward, 1 for reverse.
// Y: fliping result
// Description
// wrot3 is a 3D matrix rotation utility function on time domain. wrot3(X,M,0) is for rotation on the direction indicated by M and could be converted back by wrot3(wrot3(X,M,0),M,1).
// Examples
// a=rand(3,3,3);
// Y=wrot3(a,2,0);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wrev3
