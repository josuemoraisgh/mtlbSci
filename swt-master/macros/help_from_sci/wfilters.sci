function [Lo_D,Hi_D,Lo_R,Hi_R]=wfilters(wname)
// wavelet filter set
// Calling Sequence
// [Lo_D,Hi_D,Lo_R,Hi_R]=wfilters(wname)
// [Lo_D,Hi_D]=wfilters(wname,'d')
// [Lo_R,Hi_R]=wfilters(wname,'r')
// [Lo_D,Lo_R]=wfilters(wname,'l')
// [Hi_D,Hi_R]=wfilters(wname,'h')
// Parameters
// wname : wavelet name, haar( "haar"), daubechies daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// Lo_D : lowpass analysis filter
// Hi_D : highpass analysis filter
// Lo_R : lowpass synthesis filter
// Hi_R : highpass synthesis filter
// Description
// wfilters is an utility function for obtaining analysis and synthesis filter set.
// Examples
// [lo_d,hi_d,lo_r,hi_r]=wfilters('db2');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// orthfilt
// biorfilt
