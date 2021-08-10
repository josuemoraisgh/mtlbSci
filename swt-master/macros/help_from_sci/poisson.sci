function [PSI,X]= poisson(LB,UB,N)
// poisson wavelet
// Calling Sequence
// [PSI,X]= poisson(LB,UB,N)
// Parameters
// LB: low bound
// UB: upper bound
// N: number of data points
// PSI: wavelet
// X: time grid
// Description
// poisson is an utility to get poisson wavelet waveform.
// Examples
// [PSI,X]=poisson(-10,10,1001);
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
// shanwavf
// fbspwavf
// cauwavf
// cgauwavf
