function D=detcoef(c,l,N)
// 1-D detail coefficients extraction
// Calling Sequence
// D=detcoef(C,L,[N])
// Parameters
// D : reconstructed detail coefficient
// C : coefficent array
// L : length array
// N : restruction level with N<=length(L)-2
// Description
// detcoef is for extraction of detail coeffient at different level 
// after a multiple level decompostion. Extension mode is stored as 
// a global variable and could be changed with dwtmode. If N is omitted, 
// the detail coefficients will extract at the  maximum level (length(L)-2).
// 
// The length of D depends on the level N.
// 
// C and L can be generated using wavedec.
// Examples
// X = wnoise(4,10,0.5); //doppler with N=1024
// [C,L]=wavedec(X,3,'db2');
// D2=detcoef(C,L,2);
// scf();clf();
// subplot(211);
// plot(X,'r');
// subplot(212);
// plot(D2);
// See Also
// wavedec
// waverec
// appcoef
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
