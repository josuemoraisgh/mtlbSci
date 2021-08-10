function Y=dwt3(x,wname,['mode',extMethod])
// Three Dimensional Discrete Fast Wavelet Transform
// Calling Sequence
// Y=dwt3(x,wname,['mode',extMethod])
// Y=dwt3(x,wname1,wname2,wname3,['mode',extMethod])
// Y=dwt3(x,Lo_D,Hi_D,['mode',extMethod])
// Y=dwt3(x,Lo_D1,Hi_D1,Lo_D2,Hi_D2,Lo_D3,Hi_D3,['mode',extMethod])
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x: 3D double matrix
// Lo_D: lowpass analysis filter
// Hi_D: highpass analysis filter
// extMethod: extension mode, 'zpd' for example
// Y: output hyper matrix, (MxNLx8), (:,:,:,1) should be LLL(LowPass on row, LowPass on column, and LowPass on Slice, (:,:,:,2) should be LLH(LowPass on row, LowPass on column, and HighPass on Slice, (:,:,:,3) for LHL, (:,:,:,4) for LHH, (:,:,:,5) for HLL, (:,:,:,6) for HLH, (:,:,:,7) for HHL and (:,:,:,8) for HHH.
// Description
// dwt3 is for three dimension discrete fast wavelet transform with the signal extension method optional argument.
// Examples
// x=rand(100,100,100);
// Y=dwt3(x,'db2');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dwt
// dwt2
// idwt
// idwt2
// idwt3
