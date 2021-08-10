function [RF,DF]=rbiorwavf(wname)
// reverse bi-orthogonal spline wavelets scaling filter
// Calling Sequence
// [RF,DF]=rbiorwavf(wname)
// Parameters
// wname: wavelet name, 'rbior1.1' to 'rbior6.8'
// RF: synthesis scaling filter
// DF: analysis scaling filter
// Description
// rbiorwavf is an utility function for obtaining twin scaling filters of bi-orthogonal spline wavelet including bior1.1, bior1.3, bior1.5, bior2.2, bior2.4, bior2.6, bior2.8, bior3.1, bior3.3, bior3.5, bior3.7, bior3.9, bior4.4, bior5.5 and bior6.8. Although the twin filters have different length, zeros has been fed to keep two filters the same length. rbiorwavf is reversing the results of biorwavf.
// Examples
// [RF,DF]=rbiorwavf('rbior3.3');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dbwavf
// biorwavf
// coifwavf
// legdwavf
// symwavf
