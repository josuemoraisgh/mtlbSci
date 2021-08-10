function [Lo_D,Hi_D,Lo_R,Hi_R]=biorfilt(DF,RF)
// bi-orthogonal wavelet filter set
// Calling Sequence
// [Lo_D,Hi_D,Lo_R,Hi_R]=biorfilt(DF,RF)
// Parameters
// DF : analysis scaling filter
// RF : synthesis scaling filter
// Lo_D : lowpass analysis filter
// Hi_D : highpass analysis filter
// Lo_R : lowpass synthesis filter
// Hi_R : highpass synthesis filter
// Description
// orthfilt is an utility function for obtaining analysis and synthesis filter set of given bi-orthogonal spline wavelets. DF and RF should be output of biorfilt result with the same length.
// Examples
// [RF,DF]=biorwavf('bior3.3');
// [lo_d,hi_d,lo_r,hi_r]=biorfilt(DF,RF);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// orthfilt
// wfilters
