// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Allan CORNET
// Copyright (C) 2011 - DIGITEO - Allan CORNET
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

function subdemolist = demo_gateway()
demopath = get_absolute_file_path("swt.dem.gateway.sce");

subdemolist=['one dimensional wavelet transform', 'swt1d.sce';..
 '1-D Wavelet decomposition using wavedec()','wavedec.dem.sce';..
 '1-D de-noising of test signal using wden()','wden.dem.sce';..
 '1-D scale 2 freq demo using scal2frq()','scale2freq.dem.sce';..
 '1-D dwtmode demo', 'dwtmode.dem.sce';..
'two dimensional wavelet transform', 'swt2d.sce';..
'three dimensional wavelet transform', 'swt3d.sce';..
'one dimensional dualtree complex wavelet transform','cowt1d.sce';..
'two dimensional dualtree complex wavelet transform','cowt2d.sce';..
'continous wavelet transform', 'cwt.sce';..
'stationary wavelet transform', 'swtswt.sce';..
'image processing', 'image.sce';..
'image denoising', 'imageDenoising.sce';..
'Differentiation of noisy Data', 'diff_cwt.dem.sce';..
'S8 Symmlets at Various Scales', 'wavelet_scale.dem.sce';..
'some wavelets', 'wavelet_fam.dem.sce';..
'smoothness of wavelets', 'smoothness_wav.dem.sce';..
'cross-correlation plot between two timeseries as a function of both time and wavelength','semibalance.sce';..
];


subdemolist(:,2) = demopath + subdemolist(:,2);
// ====================================================================

endfunction

subdemolist = demo_gateway();
clear demo_gateway; // remove demo_gateway on stack
