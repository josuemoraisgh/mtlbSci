function [PHI,PSI,XVAL]=wavefun(wname,ITER)
// Wavelet and Scaling Functions
// Calling Sequence
// [PHI,PSI,XVAL]=wavefun(wname,ITER)
// [PHI1,PSI1,PHI2,PSI2,XVAL]=wavefun(wname,ITER)
// [PSI,XVAL]=wavefun(wname,ITER)
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8", Kingsbury ("ksq1", "ksq2"), Farras ("fa1", fa2), sinus ("sinus"), morlet ("morl"), "DOG", "shan", "cauchy", cmorlet ("cmor"), poisson ("poisson"), gauss wavelet ("gaus1" to "gaus8"), complex gauss wavelet ("cgau1" to "cgau8"), mexican hat ("mexh") and frequency B spline wavelets ("fbsp").
// ITER : iteration cycle, default is 8, 10 is used frequently
// PHI : scaling function, some wavelets do not have scaling function
// PSI : wavelet function
// XVAL: time domain grid
// Description
// wavefun is an utility to get scaling function phi and wavelet function psi. For orthogonal wavelets, both phi and psi are available. For biorthogonal wavelets, two scaling functions and wavelet function could be obtained. For some wavelets, only wavelet function is available.
// Examples
// [phi,psi,xval]=wavefun('sym4',10);
// [phi1,psi1,phi2,psi2,xval]=wavefun('bior3.3',8);
// [psi,xval]=wavefun('mexh',8);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavefun2
