clc;mode(1);lines(0);
// Illustrate smoothness of wavelets
//
//  Wavelets have different degrees of smoothness.  Plotting the
//  first through third derivatives of the D4, S6 and S8 wavelets
//  illustrates the increasing degrees of smoothness these wavelets
//  possess.
//
mode(-1); scf(1);clf();
	//wave = MakeWavelet(3,4,'Daubechies',4,'Mother',1024);
        [PHI,wave,XVAL]=wavefun("db4",8);
	N=length(wave);
	t = ((1:N)-.5)./N;
//
	subplot(2,2,1)
	plot(t,wave)
	title('Daubechies D4')
//
	dwave = diff(wave) .* N;
	subplot(2,2,2)
	plot(t,[dwave 0])
	a=gca();a.data_bounds=([0 1 -50 50]);
	title('First Derivative')
//
	d2wave = diff(wave,2) .* N^2;
	subplot(2,2,3)
	plot(t,[d2wave 0 0 ])
	a=gca();a.data_bounds=([0 1 -2000 2000]);
	title('Second Derivative')
//
	d3wave = diff(wave,3) .* N^3;
	subplot(2,2,4)
	plot(t,[d3wave 0 0 0 ])
	a=gca();a.data_bounds=([0 1 -50000 50000]);
	title('Third Derivative')
    
    
halt("press a key to proceed!");
clc;mode(1);lines(0); 
// Symmlet 8 wavelet
mode(-1); scf(1);clf();
// 	wave = MakeWavelet(3,4,'Symmlet',8,'Mother',1024);

        [PHI,wave,XVAL]=wavefun("sym8",8);
	N=length(wave);
	t = ((1:N)-.5)./N;
	subplot(2,2,1)
	plot(t,wave)
	a=gca();a.data_bounds=([0 1 -1 1]);
	title('Symmlet S8')
//
	dwave = diff(wave) .* N;
	subplot(2,2,2)
	plot(t,[dwave 0])
	a=gca();a.data_bounds=([0 1 -50 50]);
	title('First Derivative')
//
	d2wave = diff(wave,2) .* N^2;
	subplot(2,2,3)
	plot(t,[d2wave 0 0 ])
	a=gca();a.data_bounds=([0 1 -2000 2000]);
	title('Second Derivative')
//
	d3wave = diff(wave,3) .* N^3;
	subplot(2,2,4)
	plot(t,[d3wave 0 0 0 ])
	a=gca();a.data_bounds=([0 1 -50000 50000]);
	title('Third Derivative')
halt("press a key to proceed!");
clc;mode(1);lines(0); 
// Symmlet 6 wavelet
mode(-1); scf(1);clf();
// 	wave = MakeWavelet(3,4,'Symmlet',6,'Mother',1024);
	[PHI,wave,XVAL]=wavefun("sym6",6);
	N=length(wave);
	t = ((1:N)-.5)./N;
//
	subplot(2,2,1)
	plot(t,wave)
	a=gca();a.data_bounds=([0 1 -1 1]);
	title('Symmlet S6')
//
	dwave = diff(wave) .* N;
	subplot(2,2,2)
	plot(t,[dwave 0])
	a=gca();a.data_bounds=([0 1 -50 50]);
	title('First Derivative')
//
	d2wave = diff(wave,2) .* N^2;
	subplot(2,2,3)
	plot(t,[d2wave 0 0 ])
	a=gca();a.data_bounds=([0 1 -2000 2000]);
	title('Second Derivative')
//
	d3wave = diff(wave,3) .* N^3;
	subplot(2,2,4)
	plot(t,[d3wave 0 0 0 ])
	a=gca();a.data_bounds=([0 1 -50000 50000]);
	title('Third Derivative')
    
    halt("press a key to proceed!");
clc;mode(1);lines(0);
// mexican hat wavelet
//
mode(-1); scf(1);clf();
// 	wave = MakeWavelet(4,8,'Interpolating',11,'Mother',N);
        [wave,XVAL]=wavefun("mexh",10)
	N=length(wave);
	t = ((1:N)-.5)./N;
//
	subplot(2,2,1)
	plot(t,wave)
	a=gca();a.data_bounds=([0 1 -1 1]);
	title('Mexican Hat wavelet')
//
	dwave = diff(wave) .* N;
	subplot(2,2,2)
	plot(t,[dwave 0])
	a=gca();a.data_bounds=([0 1 -50 50]);
	title('First Derivative')
//
	d2wave = diff(wave,2) .* N^2;
	subplot(2,2,3)
	plot(t,[d2wave 0 0 ])
	a=gca();a.data_bounds=([0 1 -2000 2000]);
	title('Second Derivative')
//
	d3wave = diff(wave,3) .* N^3;
	subplot(2,2,4)
	plot(t,[d3wave 0 0 0 ])
	a=gca();a.data_bounds=([0 1 -50000 50000]);
	title('Third Derivative')
    
    
    
 
 
//
//  Part of Wavelab Version 850
//  Built Tue Jan  3 13:20:43 EST 2006
//  This is Copyrighted Material
//  For Copying permissions see COPYING.m
//  Comments? e-mail wavelab@stat.stanford.edu 

    
 
 
//
//  Part of Wavelab Version 850
//  Built Tue Jan  3 13:20:43 EST 2006
//  This is Copyrighted Material
//  For Copying permissions see COPYING.m
//  Comments? e-mail wavelab@stat.stanford.edu 

 
 
//
//  Part of Wavelab Version 850
//  Built Tue Jan  3 13:20:43 EST 2006
//  This is Copyrighted Material
//  For Copying permissions see COPYING.m
//  Comments? e-mail wavelab@stat.stanford.edu 

//
//  Part of Wavelab Version 850
//  Built Tue Jan  3 13:20:43 EST 2006
//  This is Copyrighted Material
//  For Copying permissions see COPYING.m
//  Comments? e-mail wavelab@stat.stanford.edu 
