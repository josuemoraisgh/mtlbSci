function [PSI,X]= morlet(LB,UB,N)
// morlet wavelet
// Calling Sequence
// [PSI,X]= morlet(LB,UB,N)
// Parameters
// LB: low bound
// UB: upper bound
// N: number of data points
// PSI: wavelet
// X: time grid
// Description
// morlet is an utility to get morlet wavelet waveform.
// Examples
// [PSI,X]=morlet(-4,4,1001);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// sinus
// mexihat
// poisson
// DOGauss
// gauswavf
// cmorwavf
// shanwavf
// fbspwavf
// cauwavf
// cgauwavf
