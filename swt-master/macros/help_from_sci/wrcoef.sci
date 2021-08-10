function X=wrcoef(type,c,l,wname,N)
// Restruction from single branch from multiple level decomposition
// Calling Sequence
// X=wrcoef(type,C,L,wname,[N])
// X=wrcoef(type,C,L,Lo_R,Hi_R,[N])
// Parameters
// type : approximation or detail, 'a' or 'd'.
// wname : wavelet name
// X : vector of reconstructed coefficents
// Lo_R : lowpass synthesis filter
// Hi_R : highpass syntheis filter
// C : coefficent array
// L : length array
// N : restruction level with length(L)-2>=N
// Description
// wrcoef is for reconstruction from single branch of multiple level 
// decomposition from 1-D wavelet coefficients. Extension mode is stored as a global variable 
// and could be changed with dwtmode. If N is omitted, maximum level (length(L)-2) is used.
// 
// The wavelet coefficents C and L can be generated using wavedec.
// Examples
// x=rand(1,100);
// [C,L]=wavedec(x,3,'db2');
// x0=wrcoef('a',C,L,'db2',2);
// 
//  //
//  // wrcoef can be used to generate the detail and the approximation until the given level
//  lvl=3;wname="db2";
//  X = wnoise(4,10,0.5); //doppler with N=2^10 and Noise
//  [C,L] = wavedec(X,lvl,wname);
// 
// A=zeros(lvl,length(X));D=zeros(A);
// for i = 1:lvl
//     A(i,:) = wrcoef('a',C,L,wname,i);
//     D(i,:) = wrcoef('d',C,L,wname,i);
// end
// scf();clf();
// subplot(2,1,1)
// plot(X,'k')
// plot(A')
// subplot(2,1,2)
// plot(D');
// See also
// wavedec
// waverec
// upcoef 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt

