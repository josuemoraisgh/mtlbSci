function [SWA,SWD]=swt(x,N,wname])
// Stationary Wavelet Transform
// Calling Sequence
// [SWA,SWD]=swt(x,N,wname])
// [SWA,SWD]=swt(x,N,Lo_D,Hi_D)
// SWC=swt(x,N,wname])
// SWC=swt(x,N,Lo_D,Hi_D)
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x: double vector
// Lo_D: lowpass analysis filter
// Hi_D: highpass analysis filter
// N: decomposition level, integer larger than zero
// SWA: approximation coefficent, N by length(x) marix if N larger than 1, or length(x) vector
// SWD: detail coefficent, N by length(x) marix if N larger than 1, or length(x) vector
// SWC: composite coefficent, (N+1) by length(x) marix, the last row is last level approximation coefficient
// Description
// swt is discrete stationary wavelet transform utility. Input vector length must be multiples of power N of 2.
// Examples
// x=rand(1,128);
// [SWA,SWD]=swt(x,3,'db2');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// iswt
// swt2
// iswt2
