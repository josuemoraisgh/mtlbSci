function [af,sf]=dualfilt1('f')
// Second Stage Filters
// Calling Sequence
// [af,sf]=dualfilt1('f')
// af=dualfilt1('a')
// sf=dualfilt1('s')
// Parameters
// c : flag, 'f' for full, 'a' for analysis and 's' for synthesis
// af : analysis filter, 4x10 matrix, real branch low and high pass filters and imagery branch low and high pass filters
// sf : synthesis filter
// Description
// dualfilt1 is an utility function for obtaining second and further stage filters for dualtree complex wavelet transform. Refer to Professor Ivan Selesnick's webpage at Brooklyn Polytech, NY.
// Examples
// [af,sf]=dualfilt1('f');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// FSfarras
// dualtree
// idualtree
