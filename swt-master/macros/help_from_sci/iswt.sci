function x0=iswt(SWA,SWD,wname])
// Inverse Stationary Wavelet Transform
// Calling Sequence
// x0=iswt(SWA,SWD,wname])
// x0=iswt(SWA,SWD,Lo_R,Hi_R)
// x0=iswt(SWC,wname])
// x0=iswt(SWC,Lo_R,Hi_R)
// Parameters
// SWA: approximation coefficient
// SWD: detail coefficient
// SWC: composite coefficient
// wname: wavelet name, haar( "haar"),daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x0: reconstruced signal
// Lo_R: lowpass synthesis filter
// Hi_R: highpass synthesis filter
// Description
// iswt is discrete inverse stationary wavelet transform utility.
// Examples
// x=rand(1,128);
// [SWA,SWD]=swt(x,3,'db2');
// x0 = iswt(SWA,SWD,'db2');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// swt
// swt2
// iswt2
