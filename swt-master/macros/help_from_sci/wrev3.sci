function Y=wrev3(x,M)
// 3D matrix fliping
// Calling Sequence
// Y=wrev3(x,M)
// Parameters
// x : double 3D matrix
// M : 1 for row-wise (X), 2 for column-wise (Y), 3 for slice-wise (Z), , 4 for both row and column (XY), 5 for both row and slice (XZ), 6 for both column and slice (YZ) and 7 for three directions (XYZ).
// Y : fliping result
// Description
// wrev3 is a fliping utility function on time domain.
// Examples
// a=rand(3,3,3);
// Y=wrev3(a,2);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wrev
// wrev2
// wrot3
