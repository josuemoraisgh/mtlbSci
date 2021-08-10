function M=wcodemat(X,[MAX],[mode],[abso])
// Matrix Coding
// Calling Sequence
// M=wcodemat(X,[MAX],[mode],[abso])
// Parameters
// X : input double matrix
// MAX : maximun integer
// mode: row-wise ('r' or 'row'), column-wise ('c' or 'col') or matrix coding ('m' or 'mat')
// abso : non-zero for absolute value coding, zero for original value coding
// M : coded integer matrix with value ranging from 1 to MAX.
// Description
// wcodemat is an utility of coding for displaying matrix. With coding scheme to specific colormap, the content matrix could be in pseudo-color.
// Examples
// x=rand(100,100);
// m=wcodemat(x,64);
// cmap=jetcolormap(64);
// y=ind2rgb(m,cmap); // function provided by SIP toolbox
// imshow(y); // funtion provided by SIP or SIVP toolbox
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// None
