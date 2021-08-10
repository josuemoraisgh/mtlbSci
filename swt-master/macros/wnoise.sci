function [X,XN] = wnoise(FUN,N,SQRT_SNR,INIT)
//Noisy wavelet test data
//Calling Sequence
//X = wnoise(FUN,N)
//[X,XN] = wnoise(FUN,N,SQRT_SNR)
//[X,XN] = wnoise(FUN,N,SQRT_SNR,INIT)
//Parameters
//N: vector length of X = 2^N
//FUN :
//: FUN = 1 or 'blocks'
//: FUN = 2 or 'bumps'
//: FUN = 3 or 'heavy sine'
//: FUN = 4 or 'doppler'
//: FUN = 5 or 'quadchirp'
//: FUN = 6 or 'mishmash'
//INIT: generator seed is set to INIT value.
//SQRT_SNR: sets std(X) = SQRT_SNR
//X: test data
//XN: noisy test data (rand(1,N,'normal') is added!)
//Description
//Noisy wavelet test data
//Examples
//[x,noisyx] = wnoise(4,10,7);
//ind = linspace(0,1,2^10); 
//for i = 1:6 
//x = wnoise(i,10); 
//subplot(6,1,i), plot(ind,x) 
//end
// See also
// wden
//Authors
//Holger Nahrstaedt - 2010-2012


//

[nargout,nargin]=argn(0);
  if (nargin < 2),
	error ( '2 parameters are required' ); 
  end
if (nargin==4)
    rand('seed',INIT);
end;

N=2^N;
X=zeros(1,N);

if (typeof(FUN)=="string")
  select FUN
  case 'blocks'
  FUN=1;
  case 'bumps'
  FUN=2;
  case 'heavy sine'
  FUN=3;
  case 'doppler'
  FUN=4;
  case 'quadchirp'
  FUN=5;
  case 'mishmash'
  FUN=6;
  else
    error("Wrong input for the FUN parameter!");
  end
else
  if (FUN<1 | FUN>6)
      error("FUN must be between 1 and 6!");
  end
end

select FUN
case 1 //'blocks'
  tj=[.1, .13, .15, .23, .25, .40, .44, .65, .76, .78, .81];
  hj=[4, -5, 3, -4, 5, -4.2, 2.1, 4.3, -3.1, 2.1, -4.2];
  for n=1:N
   
      t=(n-1)/(N-1);
      X(n)=sum(hj.*((1+sign(t-tj))/2));

  end

case 2 //'bumps'
 tj=[.1, .13, .15, .23, .25, .40, .44, .65, .76, .78, .81];
 hj = [4, 5, 3, 4, 5, 4.2, 2.1, 4.3, 3.1, 5.1, 4.2];
 wj = [.005, .005, .006, .01, .01, .03, .01, .01, .005, .008, .005];
 for n=1:N
   
      t=(n-1)/(N-1);
      X(n)=sum(hj.*((1+abs((t-tj)./wj).^4).^(-1)));
 end
case 3 //'heavy sine'
 for n=1:N
   
      t=(n-1)/(N-1);
      X(n)=4*sin(4*%pi*t)-sign(t-0.3)-sign(.72-t);
  end
case 4 //'doppler'
      eps=0.05;
  for n=1:N
   
      t=(n-1)/(N-1);

      X(n)=sqrt(t*(1-t))*sin(2*%pi*(1-eps)/(t+eps));
  end
case 5 //'quadchirp'
    t = (1:N) ./N;

      X = sin( (%pi/3) .* t .* (N .* t.^2));

case 6 //'mishmash'
    t = (1:N) ./N;
    X = sin( (%pi/3) .* t .* (N .* t.^2)) ;
   X = X +  sin( %pi * (N * .6902) .* t);
   X = X +  sin(%pi .* t .* (N .* .125 .* t));

end

if (nargin>=3)
   X=X/stdev(X)*SQRT_SNR;
end;
   XN=X+rand(1,N,'normal');

 endfunction
 
