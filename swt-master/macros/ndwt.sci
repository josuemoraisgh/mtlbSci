function varargout = ndwt(x,level,varargin)
// Nondecimated 1-D wavelet transform
// Calling Sequence
// W=ndwt(X,N,wname,['mode',extMethod])
// Parameters
// wname : wavelet name, haar( "haar"), daubechies ("db1" to "db20"), coiflets ("coif1" to "coif5"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x : double vector
// N: Level of decomposition
// extMethod : extension mode, 'zpd' for example
// W:ndwt structure
// Description
// ndwt performs a multilevel nondecimate decomposition. W is a structure with W.rowvect, W.level, W.mode, W.filters, W.dec, W.longs.
// Examples
// t = linspace(0,1,1000);
// x = 4*sin(4*%pi*t);
// x = x - sign(t - .3) - sign(.72 - t);
// W = ndwt(x,4,'db2','mode','per');
// d1 = indwt(W,'d',1);
// scf();
// subplot(211);
// plot(t,x); title('Original Signal');
// subplot(212);
// plot(t,d1,'linewidth',2); title('Wavelet Approximation -- Level 1');
// 
// Authors
// H. Nahrstaedt - 2013
// See Also
// indwt
// ndwt2
// indwt2
[nargout,nargin]=argn(0);
nbIn = length(varargin);
nextArg = 2;
if type(varargin(1))==10     
    [LoD,HiD,LoR,HiR] = wfilters(varargin(1));
else
        error('3rd argument should be a wavelet name!');
end
lf = length(LoD);

 dwtEXTM = 'sym';
while nbIn>=nextArg
    argName = varargin(nextArg);
    argVal  = varargin(nextArg+1);
    nextArg = nextArg + 2;
    select argName
        case 'mode' , dwtEXTM = argVal;
    end
end

rowvect =  size(x,1)<=1;
lx = length(x);
longs = zeros(1,level+2);
longs($) = lx;
dec = list();

idx = level+1;
for k=1:level
    lx = length(x);
    x = wextend('1d',dwtEXTM,x,lf-1,'b');
    lkeep = lx+lf-1;
    dec(idx) = wkeep(conv(HiD,x),lkeep);
    x = wkeep(conv(LoD,x),lkeep);
    idx = idx-1;
end
dec(idx) = x;
for k = 1:level+1 , longs(k) = length(dec(k)); end

wt.rowvect = rowvect;
wt.level = level;
wt.mode  = dwtEXTM;
wt.filters.LoD = LoD;
wt.filters.HiD = HiD;
wt.filters.LoR = LoR;
wt.filters.HiR = HiR;
wt.dec = dec;
wt.longs = longs;
varargout=list();
select nargout
    case 1
        varargout(1) = wt;
    case 2        
        //if ~rowvect , catDIR = 1; longs = longs'; else catDIR = 2; end
        varargout(1) = dec;
        varargout(2) = longs;
    case 3        
        NbCd1 = length(wt.dec(1));
        A = wt.dec($)($-NbCd1+1:$);
        D = zeros(level,NbCd1);
        for k = 1:level
            D(k,:) = wt.dec(k)($-NbCd1+1:$);
        end
        varargout = list(A,D,wt);        
end
endfunction