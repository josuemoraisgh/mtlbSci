clc;mode(1);lines(0);
// toon0131 -- Scale Families of Wavelets
//
//  Show the Symmlet 8 wavelet at various scales 
//
mode(-1);scf(1);clf();

	clf; subplot(111);
	posarray = [ 1:6]';
	sz = size(posarray);
	nr = sz(1);
	n  = 1024;
	w = zeros(1,n);
	t = (.5:(n-.5)) ./n;
//
	//LockAxes([0 1 0 (nr+1)]); 
	title('Some S8 Symmlets at Various Scales')


	cfs = [1];  // Decomposition reduced a single coefficient. 
	essup = 16; // Essential support of the scaling filter sym8
	for iter = 1:nr,


    // Reconstruct at the top level an approximation 
    // which is equal to zero except at level i where only 
    // one coefficient is equal to 1. 
    wave = upcoef('a',cfs,'sym8',iter);

    // essup is the essential support of the 
    // reconstructed signal.
    // rec(j) is very small when j is ≥ essup. 

    w=zeros(1,n);
    w(1:essup)=wave(1:essup); 
    essup = essup*2+6; 



		j = posarray(iter,1);
		//k = posarray(iter,2);
		//w = MakeWavelet(j,k,'Symmlet',8,'Mother',1024);
		plot(t,(iter)+ 3*w);
		txt = sprintf('(%1.0f)',j);
		xstring(.87,(iter)+.275,txt);
	end

	//UnlockAxes;