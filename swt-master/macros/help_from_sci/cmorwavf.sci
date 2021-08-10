function [PSI,X]= cmorwavf(LB,UB,N,FB,FC)
// complex morlet wavelet
// Calling Sequence
// [PSI,X]= cmorwavf(LB,UB,N,FB,FC)
// Parameters
// LB : low bound
// UB : upper bound
// N  : number of data points
// FB : positive bandwidth parameter
// FC : wavelet center frequency
// PSI: wavelet
// X  : time grid
// Description
// cmorwavf is an utility to get complex morlet wavelet waveform.
// Examples
// [PSI,X]=cmorwavf(-8,8,1000,1.5,1);
// // Plot complex Morlet wavelet.
// subplot(211)
// plot(X,real(PSI)),
// title('Complex Morlet wavelet cmor1.5-1')
// xlabel('Real part'), xgrid()
// subplot(212)
// plot(X,imag(PSI))
// xlabel('Imaginary part'),  xgrid()
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
// poisson
// shanwavf
// fbspwavf
// cauwavf
// cgauwavf
