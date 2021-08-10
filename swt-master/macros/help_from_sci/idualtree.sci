function x=idualtree(c,l,Fsf,sf)
// 1D inverse dualtree complex wavelet transform
// Calling Sequence
// x=idualtree(c,l,Fsf,sf)
// Parameters
// c : complex decomposition coefficient
// l : coefficient length array
// Fsf: first stage synthesis filter
// sf : further stage synthesis filter
// x : reconstruction
// Description
// idualtree is an utility function for 1D inverse dualtree complex wavelet transform. Refer to Professor Ivan Selesnick's webpage at Brooklyn Polytech, NY.
// Examples
// [Faf,Fsf]=FSfarras('f');
// [af,sf]=dualfilt1('f');
// x=rand(1,256);
// [c,l]=dualtree(x,3,Faf,af);
// x0 = idualtree(c,l,Fsf,sf);
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
// waverec
