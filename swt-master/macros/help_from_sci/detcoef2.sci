function D=detcoef2(type,c,s,N)
// Two Dimension Detail Coefficent Extraction
// Calling Sequence
// D=detcoef2(type,c,s,N)
// [H,V,D]=detcoef2('all',c,s,N)
// Parameters
// H : reconstructed horizontal detail coefficient
// V : reconstructed vertical detail coefficient
// D : reconstructed diagonal detail coefficient
// c : coefficent array
// s : size array
// N : restruction level
// type: 'h', 'v', 'd', 'c' or 'all'
// Description
// detcoef2 is for extraction of detail coeffient at different level after a multiple level decompostion. Extension mode is stored as a global variable and could be changed with dwtmode.
// Examples
// x=rand(100,100);
// [C,S]=wavedec2(x,3,'db2');
// H2=detcoef2('h',C,S,2);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavedec2
// waverec2
// appcoef2
