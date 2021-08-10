function [F]=scal2frq(A,wname,DELTA)
//Scale to frequency
// Calling Sequence
// F = scal2frq(A,'wname',DELTA)
// Parameters
//A: scales
//wname: wavelet function name
//DELTA: sampling period
//F: corresponding frequencies for the given scales
//Description
//Scales to Frequencies
//Examples
// // Set sampling period and wavelet name.
// delta = 0.1; wname = 'coif3';
// // Define scales.
// amax = 7; a = 2 .^[1:amax];
// // Compute associated pseudo-frequencies.
// f = scal2frq(a,wname,delta);
// // Compute associated pseudo-periods.
// per = 1 ./ f;
// // Display information.
// disp(' Scale Frequency Period')
// disp([a' f' per])
// See Also
// scal2frq 
// wavefun
// Authors
// Holger Nahrstaedt - 2010-2012


  [nargout,nargin]=argn(0);
  if (nargin < 2),
	error ( '2 parameters are required !' ); 
  end

  if (nargin<3)
    DELTA=1;
  end;

Fc=centfrq(wname);
F=Fc ./ (A .* DELTA);

//RECFREQ=sin(2*%pi*FREQ*XVAL);

endfunction
