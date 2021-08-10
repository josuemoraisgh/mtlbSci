function Y=wextend(onedim,extMode,x,L,[type])
// signal extension
// Calling Sequence
// Y=wextend(onedim,extMode,x,L,[type])
// Y=wextend(twodim,extMode,M,sizeVector,[typeStringVector])
// Y=wextend(twodim,extMode,M,sizeVector,[typeString])
// Y=wextend(twodim,extMode,M,L)
// Y=wextend(row_col,extMode,M,L,[type])
// Parameters
// x : double vector
// M : double matrix
// L : length integer
// type : extraction manner, 'l' for left, 'r' for right, and 'b' for both left and right
// sizeVector : integer vector containing row and column size to extend
// typeString : string for extension, 'bb', 'll', 'rr', 'bl', 'lb', 'br', 'rb', 'lr', 'rl'.
// typeStringVector : string vector for extension, ['b' 'b'], ['l' 'l'], ['r' 'r'], ['b' 'l'], ['l' 'b'], ['b' 'r'], ['r' 'b'], ['r' 'l'], ['l' 'r'].
// extMode : extension method, 'symh'('sym'), 'symw', 'asymh', 'asymw', 'zpd', 'zpd', 'per', 'ppd'.
// row_col : adding row or adding column, 'ar' or 'addrow' for row, 'ac' or 'addcol' for column.
// onedim : one dimension indication, 1, '1', '1d' and '1D'
// twodim : two dimension indication, 2, '2', '2d' and '2D'
// Y : extension result
// Description
// wextend is an utility function for signal extension.
// Examples
// a=rand(1,100);
// Y=wextend(1,'symh',a,5,'b');
// b=rand(25,25);
// Y=wextend(2,'symh',b,[3,5],'lb');
// Y=wextend('ar','symh',b,3,'r');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wkeep
