function Y = wthresh(X,SORH,T)
//Soft or hard thresholding
//Calling Sequence
//Y = wthresh(X,SORH,T)
//Parameters
//X: input data (vector or matrix)
//SORH = 's': soft thresholding
// SORH = 'h' : hard thresholding
//T: threshold value
// Y : output
//Description
//doing either hard (if SORH = 'h') or soft (if SORH = 's') thresholding
//Examples
// // Generate signal and set threshold. 
// y = linspace(-1,1,100); 
// thr = 0.4;
// 
// // Perform hard thresholding. 
// ythard = wthresh(y,'h',thr);
//
//  // Perform soft thresholding. 
//ytsoft = wthresh(y,'s',thr);
// 
// See also 
// wden
//Authors
// Holger Nahrstaedt - 2010-2012




      [nargout,nargin]=argn(0);
      if (nargin < 3),
      error ( '3 parameters are required' ); 
      end
    if (convstr(SORH) ~= 'h' &  convstr(SORH) ~= 's') then
      error(' SORH must be either h or s');
    end;

	if (convstr(SORH)=='h') then
	  Y   = X .* (abs(X) > T);
        else
	  res = (abs(X) - T);
	  res = (res + abs(res))/2;
	  Y   = sign(X).*res;
	end;
endfunction
