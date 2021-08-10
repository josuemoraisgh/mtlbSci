function [PSI,X]= mexihat(LB,UB,N)
// mexican hat wavelet
// Calling Sequence
// [PSI,X]= mexihat(LB,UB,N)
// Parameters
// LB: low bound
// UB: upper bound
// N : number of data points
// PSI: wavelet
// X: time grid
// Description
// mexihat is an utility to get mexican hat wavelet waveform.
// Examples
// [PSI,X]=mexihat(-5,5,1001);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// sinus
// poisson
// morlet
// DOGauss
// gauswavf
// cmorwavf
// shanwavf
// fbspwavf
// cauwavf
// cgauwavf
