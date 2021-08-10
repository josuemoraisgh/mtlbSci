function coef=cwt(x,scales,wname)
// Continous Wavelet Transform
// Calling Sequence
// coef=cwt(x,scales,wname)
// Parameters
// wname : wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8", Kingsbury ("ksq1", "ksq2"), Farras ("fa1", fa2), sinus ("sinus"), morlet ("morl"), "DOG", "shan", "cauchy", cmorlet ("cmor"), poisson ("poisson"), gauss wavelet ("gaus1" to "gaus8"), complex gauss wavelet ("cgau1" to "cgau8"), mexican hat ("mexh") and frequency B spline wavelets ("fbsp").
// x : double vector
// scales : scale vector
// coef : continuous wavelet transform matrix
// Description
// cwt is an utility of continuous wavelet transform computing. For fast wavelet transform filter, scales should integer vector whose element should be not less than 1. For other wavelets, scales should be larger than zero. Large scale corresponds to low frequency. Too long scale vector may cost more computation time. Because some wavelets have explicit expression, cwt result is better with low scaling digitization errors. wname includes haar, daubechies (db1 to db20), coiflets (coif1 to coif5), symlets (sym2 to sym20), legendre (leg1 to leg9), bathlets, dmey, beyklin, vaidyanathan, biorthogonal B-spline wavelets (bior1.1 to bior6.8), rbior1.1 to rbior6.8, sinus, morlet, DOG, shan, cauchy, cmorlet, poisson, mexican hat and frequency B spline wavelets.
// Examples
// x=[1:512];
// y=sin(2*%pi*x/32);
// stacksize(100000000);
// coef=cwt(x,1:128,'sym4');
// w=wcodemat(coef,512);
// cmap=jetcolormap(512);
// c=ind2rgb(w,cmap); // SIP function
// imshow(c); // SIP and SIVP function
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// cwtplot
