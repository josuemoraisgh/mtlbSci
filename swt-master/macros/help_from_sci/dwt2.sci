function [CA,CH,CV,CD]=dwt2(x,wname,['mode',extMethod])
// Two Dimensional Discrete Fast Wavelet Transform
// Calling Sequence
// [CA,CH,CV,CD]=dwt2(x,wname,['mode',extMethod])
// [CA,CH,CV,CD]=dwt2(x,Lo_D,Hi_D,['mode',extMethod])
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x: double matrix
// Lo_D: lowpass analysis filter
// Hi_D: highpass analysis filter
// extMethod: extension mode, 'zpd' for example
// CA: approximation coefficent
// CH: horizontal detail coefficent
// CV: vertical detail coefficent
// CD: diagonal detail coefficent
// Description
// dwt2 is for two dimension discrete fast wavelet transform with the signal extension method optional argument.
// Examples
// x=rand(100,100);
// [CA,CH,CV,CD]=dwt2(x,'db2','mode','asymh');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dwt
// dwt3
// idwt
// idwt2
// idwt3
