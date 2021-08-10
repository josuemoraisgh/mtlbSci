function x0=idualtree2D(c,s,Fsf,sf)
// Real 2D dualtree wavelet inverse transform
// Calling Sequence
// x0=idualtree2D(c,s,Fsf,sf)
// Parameters
// c : complex decomposition coefficient, real part for one tree and imainery part for another tree
// s : decomposition size matrix
// Fsf: first stage synthesis filter
// sf : further stage synthesis filter
// x0 : reconstructed matrix
// Description
// idualtree2D is an utility function of inverse real 2D dualtree wavelet transform. Refer to Professor Ivan Selesnick's webpage at Brooklyn Polytech, NY.
// Examples
// [Faf,Fsf]=FSfarras('f');
// [af,sf]=dualfilt1('f');
// x=rand(256,256);
// [c,s]=dualtree2D(x,3,Faf,af);
// x0=idualtree2D(c,s,Fsf,sf);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// FSfarras
// dualfilt1
// dualtree
// idualtree
// dualtree2D
// waverec2
