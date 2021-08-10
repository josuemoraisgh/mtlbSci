function [cA,cD]=dwt(x,wname,['mode',extMethod])
// Discrete Fast Wavelet Transform
// Calling Sequence
// [cA,cD]=dwt(x,wname,['mode',extMethod])
// [cA,cD]=dwt(x,Lo_D,Hi_D,['mode',extMethod])
// Parameters
// wname : wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x : double vector
// Lo_D : lowpass analysis filter
// Hi_D : highpass analysis filter
// extMethod : extension mode, 'zpd' for example
// cA : approximation coefficent
// cD : detail coefficent
// Description
// dwt is for discrete fast wavelet transform with the signal extension method optional argument. Available wavelets include haar, daubechies (db1 to db20), coiflets (coif1 to coif5), symlets (sym2 to sym20), legendre (leg1 to leg9), bathlets, dmey, beyklin, vaidyanathan, biorthogonal B-spline wavelets (bior1.1 to bior6.8).
// Examples
// x=rand(1,100);
// [cA,cD]=dwt(x,'db2','mode','asymh');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// idwt
// dwt2
// idwt2
