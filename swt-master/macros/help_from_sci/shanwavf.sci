function [PSI,X]= shanwavf(LB,UB,N,FB,FC)
// complex shannon wavelet
// Calling Sequence
// [PSI,X]= shanwavf(LB,UB,N,FB,FC)
// Parameters
// LB: low bound
// UB: upper bound
// N: number of data points
// FB: Bandwith
// FC: center frequency
// PSI: complex wavelet
// X: time grid
// Description
// shanwavf is an utility to get complex shannon wavelet waveform.
// Examples
// [PSI,X]=shanwavf(-20,20,1001,1,1.5);
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
// cgauwavf
