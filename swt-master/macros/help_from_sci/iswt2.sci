function X0=iswt2(A,H,V,D,wname])
// Two Dimensional Inverse Stationary Wavelet Transform
// Calling Sequence
// X0=iswt2(A,H,V,D,wname])
// X0=iswt2(A,H,V,D,Lo_R,Hi_R)
// X0=iswt2(SWC,wname])
// X0=iswt2(SWC,Lo_R,Hi_R)
// Parameters
// A: approximation coefficient
// H: horizontal detail coefficient
// V: vertical detail coefficient
// D: detail coefficient
// SWC: composite coefficient
// wname: wavelet name, haar( "haar"),daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// X0: reconstruced signal
// Lo_R: lowpass synthesis filter
// Hi_R: highpass synthesis filter
// Description
// iswt2 is two dimenstional discrete inverse stationary wavelet transform utility.
// Examples
// x=rand(128,128);
// [A,H,V,D]=swt2(x,3,'db2');
// x0 = iswt2(A,H,V,D,'db2');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// swt
// iswt
// swt2
