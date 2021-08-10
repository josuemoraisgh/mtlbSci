function [Faf,Fsf]=FSfarras('f')
// First Stage Filters
// Calling Sequence
// [Faf,Fsf]=FSfarras('f')
// Faf=FSfarras('a')
// Fsf=FSfarras('s')
// Parameters
// c : flag, 'f' for full, 'a' for analysis and 's' for synthesis
// Faf : analysis filter, 4x10 matrix, real branch low and high pass filters and imagery branch low and high pass filters
// Fsf : synthesis filter
// Description
// FSfarras is an utility function for obtaining first stage filters for dualtree complex wavelet transform. Refer to Professor Ivan Selesnick's webpage at Brooklyn Polytech, NY.
// Examples
// [Faf,Fsf]=FSfarras('f');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dualfilt1
// dualtree
// idualtree
