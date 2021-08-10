function [PSI,X]= fbspwavf(LB,UB,N,M,FB,FC)
// complex frequency B spline wavelet
// Calling Sequence
// [PSI,X]= fbspwavf(LB,UB,N,M,FB,FC)
// Parameters
// LB : low bound
// UB : upper bound
// N  : number of data points
// M  : order integer
// FB : Bandwith
// FC : center frequency
// PSI: complex wavelet
// X : time grid
// Description
// fbspwavf is an utility to get complex frequency B Spline wavelet waveform.
// Examples
// [PSI,X]=fbspwavf(-20,20,1001,2,1,1.5);
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
// shanwavf
// cauwavf
// cgauwavf
