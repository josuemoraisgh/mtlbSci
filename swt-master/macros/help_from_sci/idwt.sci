function X=idwt(cA,cD,wname,[L])
// Inverse Discrete Fast Wavelet Transform
// Calling Sequence
// X=idwt(cA,cD,wname,[L])
// X=idwt(cA,cD,Lo_R,Hi_R,[L])
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x : reconstructed vector
// Lo_R: lowpass synthesis filter
// Hi_R: highpass syntheis filter
// L : restruction length
// cA: approximation coefficent
// cD: detail coefficent
// Description
// idwt is for inverse discrete fast wavelet transform. Coefficent could be void vector as '[]' for cA or cD.
// Examples
// x=rand(1,100);
// [cA,cD]=dwt(x,'db2','mode','asymh');
// x0=idwt(cA,cD,'db2',100);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dwt
// dwt2
// idwt2
