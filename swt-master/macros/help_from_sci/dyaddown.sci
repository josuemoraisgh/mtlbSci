function Y=dyaddown(x,[EVEN_ODD])
// dyadic downsampling
// Calling Sequence
// Y=dyaddown(x,[EVEN_ODD])
// Y=dyaddown(M,[EVEN_ODD],[type])
// Y=dyaddown(M,[type],[EVEN_ODD])
// Parameters
// x : double vector
// M : double matrix
// EVEN_ODD : even or odd integer
// type : downsampling manner, 'r' for row, 'c' for column, and 'm' for row and column simutaneously.
// Y : downsampling result
// Description
// dyaddown is an utility function for dyadic downsampling. if EVEN_ODD is even, even index entries of input will be kept. Otherwise, odd index entries will be kept. Default is even. Optional argumet type is especially for matrix input downsampling.
// Examples
// a=rand(1,100);
// Y=dyaddown(a);
// b=rand(25,25);
// Y=dyaddown(b,'r',0);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dyadup
