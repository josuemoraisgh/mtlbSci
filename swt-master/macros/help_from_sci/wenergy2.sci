function [Ea,Ed]=wenergy2(c,s)
// Energy Statistics from two dimension multiple level decompostion
// Calling Sequence
// [Ea,Ed]=wenergy2(c,s)
// [Ea,Eh,Ev,Ed]=wenergy2(c,s)
// Parameters
// Ea : energy percentage of approximation coefficent
// Eh : energy percentage of horizontal detail coefficent
// Ec : energy percentage of vertical detail coefficent
// Ed : energy percentage of diagonal detail coefficent, vector
// c : coefficent array
// s : size array
// Description
// wenergy2 is to calculate the energy percentage of approximation and detail coefficent for two dimension decompostion.
// Examples
// x=rand(100,100);
// [C,S]=wavedec2(x,3,'db2');
// [Ea,Ed]=wenergy2(C,S);
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavedec2
// waverec2
