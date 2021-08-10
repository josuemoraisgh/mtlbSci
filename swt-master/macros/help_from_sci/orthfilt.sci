function [Lo_D,Hi_D,Lo_R,Hi_R]=orthfilt(w)
// orthogonal wavelet filter set
// Calling Sequence
// [Lo_D,Hi_D,Lo_R,Hi_R]=orthfilt(w)
// Parameters
// w: scaling filter
// Lo_D: lowpass analysis filter
// Hi_D: highpass analysis filter
// Lo_R: lowpass synthesis filter
// Hi_R: highpass synthesis filter
// Description
// orthfilt is an utility function for obtaining analysis and synthesis filter set of given orthogonal wavelets including haar, daubechies, coiflets and symlets.
// Examples
// w=dbwavf('db2');
// [lo_d,hi_d,lo_r,hi_r]=orthfilt(w);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// biorfilt
// wfilters
