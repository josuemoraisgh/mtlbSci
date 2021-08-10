function A=appcoef(c,l,wname,[N])
// 1-D approximation coefficients extraction
// Calling Sequence
// A=appcoef(C,L,wname,[N])
// A=appcoef(C,L,Lo_R,Hi_R,[N])
// Parameters
// wname : wavelet name, haar( "haar"), daubechies ("db1" to "db20"), coiflets ("coif1" to "coif5"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// A : extracted approximation coefficients
// Lo_R : lowpass synthesis filter
// Hi_R : highpass syntheis filter
// C : coefficent array
// L : length array
// N : restruction level with N<=length(L)-2
// Description
// appcoef can be used for extraction or reconstruction of approximation 
// coefficents at  level N after a multiple level decompostion. 
// Extension mode is stored as a global variable and could be changed 
// with dwtmode. If N is omitted, the maximum level (length(L)-2) is used.
// 
// The length of A depends on the level N.
// 
// C and L can be generated using wavedec.
// Examples
// X = wnoise(4,10,0.5); //doppler with N=1024
// [C,L]=wavedec(X,3,'db2');
// A2=appcoef(C,L,'db2',2);
// 
// scf();clf();
// subplot(211);
// plot(X,'r');
// subplot(212);
// plot(A2);
// title("Approximation coefficents of level 2");
// 
// See also
// wavedec
// waverec
// detcoef
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
