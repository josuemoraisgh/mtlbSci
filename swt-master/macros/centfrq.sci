function [cfreq]=centfrq(wname,iter)
//Wavelet center frequency
//Calling Sequence
//cfreq = centfrq(wname)
//cfreq = centfrq(wname,iter)
//Parameters
//wname: wavelet function name
//iter: number of iteration used by wavefun
//cfreq: center frequency of the wavelet function
//Description
//Estimations the center frequency of a wavelet function.
//Examples
//wname = 'db2';iter=8;
// // Compute the center frequency
// cfreq = centfrq(wname,iter)
// See also
// scal2frq 
// wavefun
//
// Authors
// Holger Nahrstaedt - 2010-2012

//function [cfreq,xval,RECcfreq]=centfrq(wname,iter)

  [nargout,nargin]=argn(0);
  if (nargin < 1),
	error ( '1 parameter is required !' ); 
  end

  if (nargin<2)
    iter=8;
  end;


try
[phi,psi,xval]=wavefun(wname,iter);
catch 
 xval=[];
 psi=[];
 phi=[];
end


if (isempty(xval)) then
  try
  [psi,xval]=wavefun(wname,iter);
  catch 
  xval=[];
  psi=[];
  phi=[];
  end
end

if (isempty(xval)) then
[phi1,psi,phi2,psi2,xval]=wavefun(wname,iter);
end



sample_rate=1/(xval(2)-xval(1));
N=size(xval,'*');
f=sample_rate*(0:(N/2))/N;
n=size(f,'*');

y=fft(real(psi));
[value,place]=max(abs(y(1:n)));

//second max?
moremax=find(ceil(abs(y(1:n)))==ceil(real(value)));
if(size(moremax,'*')>1)
  cfreq=(f(moremax(1))+f(moremax($)))/2;
else
cfreq=f(place);
end;



//RECcfreq=sin(2*%pi*cfreq*xval);

endfunction
