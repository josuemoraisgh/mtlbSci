function [xc,cxc,lxc,perf0,perfl2] = wdencmp(o,varargin)
//   De-noising or compression using wavelets.
//   Calling Sequence
//   [XC,CXC,LXC,PERF0,PERFL2] = wdencmp('gbl',X,'wname',N,THR,SORH,KEEPAPP)
//   [XC,CXC,LXC,PERF0,PERFL2] = wdencmp('gbl',C,L,W,N,THR,SORH,KEEPAPP)
//   [XC,CXC,LXC,PERF0,PERFL2] = wdencmp('lvd',X, 'wname',N,THR,SORH)
//   [XC,CXC,LXC,PERF0,PERFL2] = wdencmp('lvd',C,L, 'wname',N,THR,SORH)
//   [XC,CXC,LXC,PERF0,PERFL2] = wdencmp('lvd',X, 'wname',N,THR,SORH)
//   [XC,CXC,LXC,PERF0,PERFL2] = wdencmp('lvd',C,L, 'wname',N,THR,SORH)
//   Parameters
//   X : input signal (1-D or 2-D)
//   C,L:wavelet decomposition structure
//   THR : positive threshold 
//   XC: de-noised or compressed version of X
//   [CXC,LXC]: wavelet decomposition  of XC
//   PERFL2 and PERF0: are L^2 recovery and compression   scores in percentages.
//   PERFL2: PERFL2 = 100*(vector-norm of CXC/vector-norm of C)^2
//   N: level of Wavelet decomposition
//   'wname': is a string containing the wavelet name.
//   SORH('s' or 'h')  : soft or hard thresholding
//   KEEPAPP: = 1, approximation coefficients cannot be   thresholded, otherwise it is possible.
//   'gbl':  using one threshold value
//   'lvd': level-dependent  thresholds (THR must be of length N). For 2-D case THR must be a matrix of size 3 by N in the three orientations   horizontal, diagonal and vertical.
//   
//   Description
//   performs a de-noising or compression process
//   of a signal or an image using wavelets.
//
//   Examples
//   x=sin(2*%pi*(0:0.01:1));
//   xn=x+rand(x);
//   thr=35;
//    //compression  using global thresholding
//   [xcomp,cxd,lxd,perf0,perfl2] = wdencmp('gbl',xn,'db3',3,thr,'h',1);
//    //denoising
//   // Find default values 
//   [thr,sorh,keepapp] = ddencmp('den','wv',x);
//   // De-noise signal using global thresholding option. 
//   xd = wdencmp('gbl',xn,'db3',4,thr,sorh,keepapp);
//   scf();clf();
//   plot(xn);
//   plot(xcomp,'r');
//   plot(xd,'g');
//   legend(["noisy signal","compressed signal","de-noised signal"],1);
//   See also 
//   ddencmp
//   wavedec
//   wavedec2
//   wden
//   wthresh
//   Authors
//   H. Nahrstaedt - 2010-2012



[nargout,nargin]=argn();
dim = 1;        // initialize dimension to 1D.
nbIn  = nargin;
nbOut = nargout;
select o
    case 'gbl' , minIn = 7; maxIn = 8; 
    case 'lvd' , minIn = 6; maxIn = 7;
    else
        error('Invalid argument value.')
end

okOut = [0:1 3:5];
if ~or(okOut==nbOut)
    error('Invalid number of output arguments.');
end

if nbIn == minIn
    x = varargin(1); indarg = 2;
    if min(size(x))~=1, dim = 2; end
else
    c = varargin(1); l = varargin(2); indarg = 3;
    if min(size(l))~=1, dim = 2; end
end

// Get Inputs
w    = varargin(indarg);
n    = varargin(indarg+1);
thr  = varargin(indarg+2);
sorh = varargin(indarg+3);
if (o=='gbl') , keepapp = varargin(indarg+4); end


// Wavelet decomposition of x (if not given).
if ((o=='gbl') & nbIn==7)  | ((o=='lvd') & nbIn==6)
    if dim == 1, [c,l] = wavedec(x,n,w);
    else        [c,l] = wavedec2(x,n,w);
    end
end

// Wavelet coefficients thresholding.
if (o=='gbl')
    if keepapp
        // keep approximation.
        cxc = c;
        if dim == 1, inddet = l(1)+1:length(c);
        else inddet = prod(l(1,:))+1:length(c); end
        // threshold detail coefficients.
        cxc(inddet) = wthresh(c(inddet),sorh,thr);
    else 
        // threshold all coefficients.
        cxc = wthresh(c,sorh,thr);
    end
else
    if dim == 1, cxc = wthcoef('t',c,l,1:n,thr,sorh);
    else
        cxc = wthcoef2('h',c,l,1:n,thr(1,:),sorh);
        cxc = wthcoef2('d',cxc,l,1:n,thr(2,:),sorh);
        cxc = wthcoef2('v',cxc,l,1:n,thr(3,:),sorh);
    end
end
lxc = l;

// Wavelet reconstruction of xd.
if dim == 1,xc = waverec(cxc,lxc,w);
else        xc = waverec2(cxc,lxc,w);
end

if nbOut<4 , return; end

// Compute compression score.
perf0 = 100*(length(find(cxc==0))/length(cxc));
if nbOut<5 , return; end

// Compute L^2 recovery score.
nc = norm(c);
if nc<%eps
    perfl2 = 100;
else
    perfl2 = 100*((norm(cxc)/nc)^2);
end
endfunction
