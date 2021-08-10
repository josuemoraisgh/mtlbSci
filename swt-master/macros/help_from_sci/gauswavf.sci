function [PSI,X]= gauswavf(LB,UB,N,P)
// gauss wavelet
// Calling Sequence
// [PSI,X]= gauswavf(LB,UB,N,P)
// Parameters
// LB : low bound
// UB : upper bound
// N : number of data points
// P : Derivative times, 1 to 8
// PSI : wavelet
// X : time grid
// Description
// gauswavf is an utility to get gauss wavelet waveform.
// Examples
// [PSI,X]=gauswavf(-20,20,1001,8);
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
// cmorwavf
// poisson
// fbspwavf
// cauwavf
// cgauwavf
