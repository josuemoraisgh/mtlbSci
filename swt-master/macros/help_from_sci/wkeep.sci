function Y=wkeep(x,[L],[type])
// signal extraction
// Calling Sequence
// Y=wkeep(x,[L],[type])
// Y=wkeep(x,[L],[FIRST])
// Y=wkeep(M,[S],[indexVector])
// Parameters
// x : double vector
// M : double matrix
// L : length integer
// type: extraction manner, 'l' for left, 'r' for right, and 'c' for center
// FIRST: index integer from which extraction starts.
// S : size integer vector containing row size and column size wanted
// indexVector : row and column index integer vector from which extraction starts.
// Y : extraction result
// Description
// wkeep is an utility function for both vector and matrix extraction. For vector extraction, extractions will be aligned to the right, left or center based on optional argument type. So does matrix extraction.
// Examples
// X=(1:8)'*(1:8);
// Y=wkeep(X,[4 4]);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wextend
