function [S,W1,W2,W3,XYVAL]=wavefun2(wname,ITER)
// 2-D Wavelet and Scaling Functions
// Calling Sequence
// [S,W1,W2,W3,XYVAL]=wavefun2(wname,ITER)
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8", Kingsbury ("ksq1", "ksq2"), Farras ("fa1", fa2)
// ITER: iteration cycle, default is 4, large cycle may consume more time
// S : tensor product of PHI and PHI
// W1: tensor product of PHI and PSI
// W2: tensor product of PSI and PHI
// W3: tensor product of PSI and PSI
// XYVAL: 2-D time domain grid
// Description
// wavefun2 is an utility to get 2-D scaling function phi and wavelet function psi. Only available on orthogonal wavelets. ITER should be small integers for short computation time.
// Examples
// [S,W1,W2,W3,XYVAL]=wavefun2('sym4',4);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavefun
