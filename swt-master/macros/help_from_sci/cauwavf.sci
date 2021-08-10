function [PSI,X]= cauwavf(LB,UB,N)
// complex cauchy wavelet
// Calling Sequence
// [PSI,X]= cauwavf(LB,UB,N)
// Parameters
// LB : low bound
// UB : upper bound
// N : number of data points
// PSI: complex wavelet
// X : time grid
// Description
// cauwavf is an utility to get complex cauchy wavelet waveform.
// Examples
// [PSI,X]=cauwavf(-5,5,1001);
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
// shanwavf
// cgauwavf
