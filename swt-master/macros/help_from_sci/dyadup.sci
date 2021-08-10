function Y=dyadup(x,[EVEN_ODD])
// dyadic upsampling
// Calling Sequence
// Y=dyadup(x,[EVEN_ODD])
// Y=dyadup(M,[EVEN_ODD],[type])
// Y=dyadup(M,[type],[EVEN_ODD])
// Parameters
// x : double vector
// M : double matrix
// EVEN_ODD : even or odd integer
// type : upsampling manner, 'r' for row, 'c' for column, and 'm' for row and column simutaneously.
// Y : upsampling result
// Description
// dyadup is an utility function for dyadic upsampling. if EVEN_ODD is even, zeors will be put between input entries and output length will be two times input length minus one. Otherwise, additional two zeros will be put at the head and tail of output so the output length will be two times input length plus one. Default is odd. Optional argumet type is especially for matrix input upsampling.
// Examples
// a=rand(1,100);
// Y=dyadup(a);
// b=rand(25,25);
// Y=dyadup(b,'r',0);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dyaddown
