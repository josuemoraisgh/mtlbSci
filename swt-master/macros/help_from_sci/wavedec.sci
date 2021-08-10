function [C,L]=wavedec(x,N,wname)
// Multiple level 1-D discrete fast wavelet decomposition
// Calling Sequence
// [C,L]=wavedec(X,N,wname)
// [C,L]=wavedec(X,N,Lo_D,Hi_D)
// Parameters
// wname : wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// X : signal vector
// N : decompostion level
// Lo_D : lowpass analysis filter
// Hi_D : highpass analysis filter
// C : coefficient vector
// L : length vector
// Description
// wavedec can be used for multiple-level 1-D discrete fast wavelet 
// decompostion using a specific wavelet name wname or wavelet decompostion 
// filters Lo_D and Hi_D. Such filters can be generated using wfilters.
// 
// The global extension mode which can be change using dwtmode is used.
// 
// The coefficient vector C contains the approximation coefficient at level N 
// and all detail coefficient from level 1 to N
// 
// The first entry of L is the length of the approximation coefficent,
// then the length of the detail coefficients are stored and the last
// value of L is the length of the signal vector.
// 
// The approximation coefficient can be extracted with C(1:L(1)).
// The detail coefficients can be obtained with C(L(1):sum(L(1:2))),
// C(sum(L(1:2)):sum(L(1:3))),.... until C(sum(L(1:length(L)-2)):sum(L(1:length(L)-1))).
// Examples
// X = wnoise(4,10,0.5); //doppler with N=1024
// [C,L]=wavedec(X,3,'db2');
// scf();clf();
// subplot(511)
// plot(X,'r') 
// subplot(512)
// plot(C(1:L(1)))
// subplot(513)
// plot(C(L(1):sum(L(1:2))),'g')
// subplot(514)
// plot(C(sum(L(1:2)):sum(L(1:3))),'g')
//  subplot(515)
//  plot(C(sum(L(1:3)):sum(L(1:4))),'g')
//  
//  
// See also
// waverec
// wfilters
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// 
