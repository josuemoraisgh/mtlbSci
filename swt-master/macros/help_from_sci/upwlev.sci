function [NC,NL,CA]=upwlev(c,l,wname)
// Single Level Reconstruction from multiple level decompostion
// Calling Sequence
// [NC,NL,CA]=upwlev(c,l,wname)
// [NC,NL,CA]=upwlev(c,l,Lo_R,Hi_R)
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// NC: upward level coefficent array
// NL: upward level length array
// CA: approximation coeffient at the last level
// Lo_R: lowpass synthesis filter
// Hi_R: highpass syntheis filter
// c: coefficent array
// l: length array
// Description
// upwlev is for single level reconstruction.
// Examples
// x=rand(1,100);
// [C,L]=wavedec(x,3,'db2');
// [NC,NL,CA3]=upwlev(C,L,'db2');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavedec
// waverec
