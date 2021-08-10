function [C,S]=wavedec(x,N,wname)
// Two Dimension Multiple Level Discrete Fast Wavelet Transform
// Calling Sequence
// [C,S]=wavedec(x,N,wname)
// [C,S]=wavedec(x,N,Lo_D,Hi_D)
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x: double matrix
// N: decompostion level
// Lo_D: lowpass analysis filter
// Hi_D: highpass analysis filter
// C : coefficent array
// S : size array
// Description
// wavedec is for two dimension multiple-level discrete fast wavelet transform. Extension is stored as a global variable and could be changed by dwtmode;
// Examples
// x=rand(100,100);
// [C,S]=wavedec2(x,3,'db2');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// waverec2
