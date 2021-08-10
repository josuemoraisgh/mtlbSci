function Y=qmf(x,[EVEN_ODD])
// quadrature mirror
// Calling Sequence
// Y=qmf(x,[EVEN_ODD])
// Parameters
// x: double vector
// EVEN_ODD: even or odd integer
// Y: quadrature mirror
// Description
// qmf is a quadrature mirror utility function on time domain. If EVEN_ODD is an even integer, output would be reversed version of input with even index entries sign changed. Otherwise, odd index entries will be changed. Default is even.
// Examples
// a=rand(1,3);
// Y=qmf(a);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wrev
