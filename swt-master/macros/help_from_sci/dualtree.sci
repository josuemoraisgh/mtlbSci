function [c,l]=dualtree(x,J,Faf,af)
// 1D dualtree complex wavelet transform
// Calling Sequence
// [c,l]=dualtree(x,J,Faf,af)
// Parameters
// x : input vector
// J : decomposition level
// Faf: first stage analysis filter
// af : further stage analysis filter
// c : complex decomposition coefficient, real part for one tree and imainery part for another tree
// l : coefficient length array
// Description
// dualtree is an utility function for 1D dualtree complex wavelet transform. Refer to Professor Ivan Selesnick's webpage at Brooklyn Polytech, NY.
// Examples
// [Faf,Fsf]=FSfarras('f');
// [af,sf]=dualfilt1('f');
// x=rand(1,256);
// [c,l]=dualtree(x,3,Faf,af);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// FSfarras
// dualfilt1
// idualtree
// wavedec
