function Y=upcoef2(type,x,wname,[N],[S])
// Two Dimension Direct Restruction
// Calling Sequence
// Y=upcoef2(type,x,wname,[N],[S])
// Y=upcoef2(type,x,Lo_R,Hi_R,[N],[S])
// Parameters
// x: input matrix
// type: approximation or detail, 'a', 'h', 'v' or 'd'.
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// Y: reconstruction
// Lo_R: lowpass synthesis filter
// Hi_R: highpass syntheis filter
// N: restruction level
// S: desired output size vector
// Description
// upcoef2 is for upward two dimension reconstruction from any desired input matrix.
// Examples
// x=rand(100,100);
// [cA,cH,cV,cD]=dwt2(x,'db2');
// Y=upcoef2('a',cA,'db2',1);
// Z=upcoef2('h',cH,'db2',3);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavedec2
// waverec2
// wrcoef2
