function X=wrcoef2(type,c,s,wname,[N])
// Restruction from single branch from two dimension multiple level decompstion
// Calling Sequence
// X=wrcoef2(type,c,s,wname,[N])
// X=wrcoef2(type,c,s,Lo_R,Hi_R,[N])
// Parameters
// type : approximation or detail, 'a', 'h', 'v' or 'd'.
// wname : wavelet name, haar( "haar"), daubechies daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// X : reconstruction
// Lo_R : lowpass synthesis filter
// Hi_R : highpass syntheis filter
// c : coefficent array
// s : size array
// N : restruction level
// Description
// wrcoef2 is for reconstruciton from single branch of two dimension multiple level decompostion. Extension mode is stored as a global variable and could be changed with dwtmode. If N is omitted, maximum level is used.
// Examples
// x=rand(100,100);
// [C,S]=wavedec2(x,3,'db2');
// A2=wrcoef2('a',C,S,'db2',2);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavedec2
// waverec2
// upcoef2
