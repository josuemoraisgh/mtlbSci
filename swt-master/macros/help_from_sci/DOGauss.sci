function [PSI,X]= DOGauss(LB,UB,N)
// DOGauss wavelet
// Calling Sequence
// [PSI,X]= DOGauss(LB,UB,N)
// Parameters
// LB : low bound
// UB : upper bound
// N : number of data points
// PSI: wavelet
// X : time grid
// Description
// DOGauss is an utility to get Difference of Gauss wavelet waveform.
// Examples
// [PSI,X]=DOGauss(-5,5,1001);
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
// poisson
// gauswavf
// cmorwavf
// shanwavf
// fbspwavf
// cauwavf
// cgauwavf
