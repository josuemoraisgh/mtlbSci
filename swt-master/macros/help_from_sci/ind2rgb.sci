function rgb = ind2rgb(ind,cmap)
// convert indexed image to true color image
// Calling Sequence
// rgb = ind2rgb(ind,cmap)
// Parameters
// rgb: MxNx3 true color image in the 0-1 range
// ind: MxN indexed image, integer matrix
// cmap: color map
// Description
// ind2rgb utility function converts an indexed image to true color image for pseudo color visualization.
// Examples
// x=[1:512];
// a=sin(2*%pi*x/64);
// b=kron(a,a');
// b=(b-min(b))/max(b-min(b));
// b=int32(b*511+1);
// cmap=jetcolormap(512);
// c=ind2rgb(b,cmap);
// imshow(c);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wcodemat
