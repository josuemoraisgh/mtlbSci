function x0=icplxdual2D(c1,c2,s,Fsf,sf)
// Complex 2-D Dual-tree Wavelet Inverse Transform
// Calling Sequence
// x0=icplxdual2D(c1,c2,s,Fsf,sf)
// Parameters
// c1 : complex decomposition coefficient, real part for one tree and imainery part for another tree
// c2 : complex decomposition coefficient, real part for one tree and imainery part for another tree
// s : decomposition size matrix
// Fsf: first stage synthesis filter
// sf : further stage synthesis filter
// x0 : reconstructed matrix
// Description
// icplxdual2D is an utility function of inverse complex 2D dualtree wavelet transform. Refer to Professor Ivan Selesnick's webpage at Brooklyn Polytech, NY.
// Examples
// [Faf,Fsf]=FSfarras('f');
// [af,sf]=dualfilt1('f');
// x=rand(256,256);
// [c1,c2,s]=cplxdual2D(x,3,Faf,af);
// x0=icplxdual2D(c1,c2,s,Fsf,sf);
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
// cplxdual2D
// waverec2
