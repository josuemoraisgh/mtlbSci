function x0=waverec(c,l,wname)
// Multiple level 1-D inverse discrete fast wavelet reconstruction
// Calling Sequence
// x0=waverec(C,L,wname)
// x0=waverec(C,L,Lo_R,Hi_R)
// Parameters
// wname : wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x0 : reconstructed vector
// Lo_R : lowpass synthesis filter
// Hi_R : highpass synthesis filter
// C : coefficent array
// L : length array
// Description
// waverec can be used for multiple-level 1-D inverse discrete fast wavelet 
// reconstruction.
// 
// waverec supports only orthogonal or biorthogonal wavelets.
// Examples
// X = wnoise(4,10,0.5); //doppler with N=1024
// [C,L]=wavedec(X,3,'db2');
// x0=waverec(C,L,'db2');
// //reconstruction error
// sum(abs(X-x0))
//  
//  
// See also
// wavedec
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
