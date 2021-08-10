function [PSI,X]= cgauwavf(LB,UB,N,P)
// complex gauss wavelet
// Calling Sequence
// [PSI,X]= cgauwavf(LB,UB,N,P)
// Parameters
// LB : low bound
// UB : upper bound
// N : number of data points
// P : Derivative times, 1 to 8
// PSI : complex wavelet
// X : time grid
// Description
// cgauwavf is an utility to get complex gauss wavelet waveform.
// Examples
// [PSI,X]=cgauwavf(-20,20,1001,8);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// sinus
// mexihat
// morlet
// DOGauss
// gauswavf
// cmorwavf
// poisson
// fbspwavf
// cauwavf
