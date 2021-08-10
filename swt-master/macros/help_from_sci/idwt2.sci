function X=idwt2(CA,CH,CV,CD,wname,[S])
// Two Dimension Inverse Discrete Fast Wavelet Transform
// Calling Sequence
// X=idwt2(CA,CH,CV,CD,wname,[S])
// X=idwt2(CA,CH,CV,CD,Lo_R,Hi_R,[S])
// Parameters
// wname: wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// X : reconstructed matrix
// Lo_R: lowpass synthesis filter
// Hi_R: highpass syntheis filter
// S: restruction size of row and column
// CA: approximation coefficent
// CH: horizontal detail coefficent
// CV: vertical detail coefficent
// CD: diagnoal detail coefficent
// Description
// idwt2 is for two dimension inverse discrete fast wavelet transform. Coefficent could be void vector as '[]' for either of CA, CH, CV or CD.
// Examples
// x=rand(100,100);
// [CA,CH,CV,CD]=dwt2(x,'db2','mode','asymh');
// x0=idwt2(CA,CH,CV,CD,'db2',[100 100]);
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
// idwt3
