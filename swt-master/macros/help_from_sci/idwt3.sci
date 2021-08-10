function X=idwt3(Y,wname,[S])
// Three Dimension Inverse Discrete Fast Wavelet Transform
// Calling Sequence
// X=idwt3(Y,wname,[S])
// X=idwt3(Y,wname1,wname2,wname3,[S])
// X=idwt3(Y,Lo_R,Hi_R,[S])
// X=idwt3(Y,Lo_R1,Hi_R1,Lo_R2,Hi_R2,Lo_R3,Hi_R3,[S])
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// X : reconstructed 3D double matrix
// Lo_R: lowpass synthesis filter
// Hi_R: highpass syntheis filter
// S: restruction size of row, column and slice
// Y: input hyper matrix, MxNxLx8, see dwt3 for more details
// Description
// idwt3 is for three dimension inverse discrete fast wavelet transform.
// Examples
// x=rand(100,100,100);
// Y=dwt3(x,'db2','mode','asymh');
// x0=idwt3(Y,'db2',[100 100 100]);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dwt
// dwt2
// dwt3
// idwt
// idwt2
