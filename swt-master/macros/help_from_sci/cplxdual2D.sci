function [c1,c2,s]=cplxdual2D(x,J,Faf,af)
// Complex 2D dualtree wavelet transform
// Calling Sequence
// [c1,c2,s]=cplxdual2D(x,J,Faf,af)
// Parameters
// x : input matrix
// J : decomposition level
// Faf : first stage analysis filter
// af : further stage analysis filter
// c1 : complex decomposition coefficient, real part for one tree and imainery part for another tree
// c2: complex decomposition coefficient, real part for one tree and imainery part for another tree
// s : coefficient size matrix
// Description
// cplxdual2D is an utility function of complex 2D dualtree wavelet transform. Refer to Professor Ivan Selesnick's webpage at Brooklyn Polytech, NY.
// Examples
// [Faf,Fsf]=FSfarras('f');
// [af,sf]=dualfilt1('f');
// x=rand(256,256);
// [c1,c2,s]=cplxdual2D(x,3,Faf,af);
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
// idualtree2D
// icplxdual2D
// wavedec2
