function [A,H,V,D]=swt2(X,N,wname])
// Two Dimentional Stationary Wavelet Transform
// Calling Sequence
// [A,H,V,D]=swt2(X,N,wname])
// [A,H,V,D]=swt2(X,N,Lo_D,Hi_D)
// SWC=swt2(X,N,wname])
// SWC=swt2(X,N,Lo_D,Hi_D)
// Parameters
// wname : wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// X : double matrix
// Lo_D : lowpass analysis filter
// Hi_D : highpass analysis filter
// N : decomposition level, integer larger than zero
// A : approximation coefficient, 3 dimensional matrix if N is larger than one, or 2 dimensional matrix if N equals to one.
// H : Horizontal Detail coefficient, 3 dimensional matrix if N is larger than one, or 2 dimensional matrix if N equals to one.
// V : Vertical Detail coefficient, 3 dimensional matrix if N is larger than one, or 2 dimensional matrix if N equals to one.
// D : detail coefficent, 3 dimensional matrix if N larger than one, or 2 dimensional if N equals to one.
// SWC: composite coefficent, 3 dimensional matrix, SWC(:,:,$) is the last level approximation coefficient.
// Description
// swt2 is two dimensional discrete stationary wavelet transform utility. Input matrix size must be multiples of power N of 2.
// Examples
// x=rand(512,512);
// [A,H,V,D]=swt2(x,3,'db2');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// swt
// iswt
// iswt2
