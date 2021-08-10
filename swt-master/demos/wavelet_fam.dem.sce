clc;mode(1);lines(0);
//  Wavelet Families
//
//   Wavelet analysis begins by choosing a specific family of wavelets
//   to work with.
//
// 
//   Here we illustrate four specific  wavelets
//
//       Haar          -- the first wavelet; a square-wave wavelet
//
//       Daubechies D4 -- the first continuous, compactly supported
//                        orthonormal wavelet family
//
//       Coiflet C3    -- orthonormal wavelets  with special vanishing moments properties
//
//       Symmlet S8    -- nearly-symmetric orthogonal wavelet of
//                        compact support with 8 vanishing moments.
// 
	mode(-1);scf(1);clf();
//	
	n=1025;
	[phi,wave,t]  = wavefun("haar",10);
	subplot(221);
	//t = (1:1024)./1024;
	plot(t,wave); title(' Haar Wavelet ');
//
	[phi,wave,t]  =  wavefun("db4",10);
	subplot(222);
	plot(t,wave); title(' D4 Wavelet ');
//
	[phi,wave,t]  =  wavefun("coif3",10);
	subplot(223);
	plot(t,wave); title(' C3 Coiflet ');
//
	[phi,wave,t]  =  wavefun("sym8",10);
	subplot(224);
	plot(t,wave); title(' S8 Symmlet ');
    

 
