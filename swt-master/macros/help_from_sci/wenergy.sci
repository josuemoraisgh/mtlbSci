function [Ea,Ed]=wenergy(c,l)
// Energy Statistics from multiple level decompostion
// Calling Sequence
// [Ea,Ed]=wenergy(c,l)
// Parameters
// Ea : energy percentage of approximation coefficent
// Ed : energy percentage of detail coefficent, vector
// c : coefficent array
// l : length array
// Description
// wenergy is to calculate the energy percentage of approximation and detail coefficent.
// Examples
// x=rand(1,100);
// [C,L]=wavedec(x,3,'db2');
// [Ea,Ed]=wenergy(C,L);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavedec
// waverec
