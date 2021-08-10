function L=wmaxlev(length,wname)
// maximun wavelet decompostion level
// Calling Sequence
// L=wmaxlev(length,wname)
// L=wmaxlev([LRow,LCol],wname)
// Parameters
// wname: wavelet name
// length: length
// LRow: row length
// LCol: column length
// L: decomposition level
// Description
// wmaxlev is the maximum decompostion level calculation utility.
// Examples
// x=rand(1,100);
// L=wmaxlev(length(x),'db5');
//  
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// dwt
// waverec
