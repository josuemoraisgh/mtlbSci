function Y=upcoef(type,x,wname,[N],[L])
// Direct Restruction
// Calling Sequence
// Y=upcoef(type,x,wname,[N],[L])
// Y=upcoef(type,x,Lo_R,Hi_R,[N],[L])
// Parameters
// type: approximation or detail, 'a' or 'd'.
// x: input vector
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// X: reconstruction
// Lo_R: lowpass synthesis filter
// Hi_R: highpass syntheis filter
// N: restruction level
// L: desired output length
// Description
// upcoef is for upward reconstruction from any desired input vector.
// Examples
// x=rand(1,100);
// [cA,cD]=dwt(x,'db2');
// Y=upcoef('a',cA,'db2',1);
// Z=upcoef('a',cA,'db2',3);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavedec
// waverec
// wrcoef
