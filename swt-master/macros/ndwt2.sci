function varargout = ndwt2(X,level,varargin)
// Nondecimated 2-D wavelet transform
// Calling Sequence
// W=ndwt2(X,N,wname,['mode',extMethod])
// Parameters
// wname : wavelet name, haar( "haar"), daubechies ("db1" to "db20"), coiflets ("coif1" to "coif5"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// x : double matrix
// N: Level of decomposition
// extMethod : extension mode, 'zpd' for example
// W:ndwt structure
// Description
// ndwt performs a multilevel nondecimate decomposition. W is a structure with W.sizeINI, W.level, W.mode, W.filters, W.dec, W.sizes.
// Examples
// x=rand(2,100);
// W1 = ndwt2(x,3,'db1');
//  a0 = indwt2(W1,'a',0);
// 
//  //reconstruction error
// err = max(abs(x(:)-a0(:)))
// 
// Authors
// H. Nahrstaedt - 2013
// See Also
// ndwt
// indwt
// indwt2

nbIn = length(varargin);

LoD = list(); HiD = list(); LoR = list(); HiR = list();
if type(varargin(1))==10
    [LD,HD,LR,HR] = wfilters(varargin(1)); 
    for k = 1:2
        LoD(k) = LD; HiD(k) = HD; LoR(k) = LR; HiR(k) = HR;
    end

elseif isstruct(varargin(1))
    if isfield(varargin(1),'w1') & isfield(varargin(1),'w2')
        for k = 1:2
//             [LoD(k),HiD(k),LoR(k),HiR(k)] = ...
//                 wfilters((varargin(1)).('w'+string(k)));
         end
    elseif isfield(varargin(1),'LoD') & isfield(varargin(1),'HiD') & ...
           isfield(varargin(1),'LoR') & isfield(varargin(1),'HiR')
        for k = 1:2
            LoD(k) = varargin(1).LoD(k); HiD(k) = varargin(1).HiD(k);
            LoR(k) = varargin(1).LoR(k); HiR(k) = varargin(1).HiR(k);
        end
    else
        error('error');
    end
        
elseif typeof(varargin(1))=="list"
    if type(varargin(1)(1))==10
        for k = 1:2
            [LoD(k),HiD(k),LoR(k),HiR(k)] = wfilters(varargin(1)(k));
        end
    else
        LoD(1:$) = varargin(1)(1); HiD(1:$) = varargin(1)(2);
        LoR(1:$) = varargin(1)(3); HiR(1:$) = varargin(1)(4);
    end
else
    
end
nextArg = 2;

dwtEXTM = 'sym';
while nbIn>=nextArg
    argName = varargin(nextArg);
    argVal  = varargin(nextArg+1);
    nextArg = nextArg + 2;
    select argName
        case 'mode' , dwtEXTM = argVal;
    end
end
varargout=list();
if isempty(X) , varargout(1) = []; return; end
sX = size(X);
X = double(X);
sizes = zeros(level+1,length(sX));
sizes(level+1,:) = sX;

for k=1:level
    dec = list();
    permVect = [];
    [a_Lo,d_Hi] = wdec1D(X,LoD(1),HiD(1),permVect,dwtEXTM);
    permVect = [2,1,3];
    [dec11,dec12] = wdec1D(a_Lo,LoD(2),HiD(2),permVect,dwtEXTM);
    [dec21,dec22] = wdec1D(d_Hi,LoD(2),HiD(2),permVect,dwtEXTM);
    X = dec11;
    sizes(level+1-k,:) = size(X);
    dec(1)=dec11;dec(2)=dec12;dec(3)=dec21;dec(4)=dec22
    if k>1
        cfs(1) = null();
	  
        cfs(0) = dec(4);
	cfs(0) = dec(3);
	cfs(0) = dec(2);
	cfs(0) = dec(1);
    else
        cfs = dec;
    end
end

WT.sizeINI = sX;
WT.level = level;
WT.filters.LoD = LoD;
WT.filters.HiD = HiD;
WT.filters.LoR = LoR;
WT.filters.HiR = HiR;
WT.mode = dwtEXTM;
WT.dec = cfs;
WT.sizes = sizes;
varargout(1) = WT;
endfunction
//-------------------------------------------------------------------------//

//-------------------------------------------------------------------------//
function [L,H] = wdec1D(X,Lo,Hi,perm,dwtEXTM)

if ~isempty(perm) , X = permute(X,perm); end
sX = size(X);
if length(sX)<3 , sX(3) = 1; end
lf = length(Lo);
lx = sX(2);
lc = lx+lf-1;
x = wextend('ac',dwtEXTM,X,lf,'b');
select dwtEXTM
    case 'zpd'            
        
    case 'sym'  
        X = x(:,2:$);
    case 'symh' 
        X = x(:,2:$);
    case 'sp0'           
        X = x(:,2:$-1);
    case 'sp1'     
        X = x(:,2:$-1);
    case 'spd'     
        X = x(:,2:$-1);
    case 'symw'         
        X = x(:,2:$);
    case 'asym'  
         X = x(:,2:$);
    case 'asymw'         
         X = x(:,2:$);
    case 'rndu'            // Uniformly randomized extension.
        X = [rand(sX(1),lf-1,sX(3),'norm') , X , rand(sX(1),lf-1,sX(3),'norm')];        
                        
    case 'rndn'            // Normally randomized extension.
        X = [rand(sX(1),lf-1,sX(3),'norm') , X , rand(sX(1),lf-1,sX(3),'norm')];           
    case 'ppd'             
        X = x(:,2:$-1);
    case 'per'    
        X = x(:,2:$-1);   
end
L = conv2(X,Lo);
H = conv2(X,Hi);
clear X
select dwtEXTM
    case 'zpd'
    else
        lenL = size(L,2);
        first = lf; last = lenL-lf+1;
        L = L(:,first:last,:); H = H(:,first:last,:);
        lenL = size(L,2);
        first = 1+floor((lenL-lc)/2);  last = first+lc-1;
        L = L(:,first:last,:); H = H(:,first:last,:);
end
if (dwtEXTM=='per')
    first = 1; last = lx;
    L = L(:,first:last,:);
    H = H(:,first:last,:);
end

if ~isempty(perm)
    L = permute(L,perm);
    H = permute(H,perm);
end
//-------------------------------------------------------------------------//
endfunction

