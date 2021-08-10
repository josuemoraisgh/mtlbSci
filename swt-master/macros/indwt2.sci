function X = indwt2(W,varargin)
// Inverse nondecimated 2-D wavelet transform
// Calling Sequence
// C=indwt2(W,type,[N])
// Parameters
// W:ndwt structure
// type : type ('a' for low-pass components or 'd' for high-pass components)
// N: Level of decomposition
// C: reconstructed components at level N 
// Description
// indwt performs a multilevel nondecimate reconstruction.
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
// ndwt2
[nargout,nargin]=argn(0);
nbIN = nargin-1;
idxCFS  = -1;
cfsFLAG = %f;
if nbIN>0
    nbCELL = length(W.dec);
    w_type = varargin(1);
    if ~type(w_type)==10
        error('W must be a char!')
    end
    w_type = convstr(w_type,'u');
    cfsFLAG = (convstr(w_type(1),'u')=='C');
    if cfsFLAG , w_type = part(w_type,2:$); end
    select w_type
        case 'D' ,           idxCFS = 0;
	case 'H' ,           idxCFS = 0;
        case 'AA' , idxCFS = 1;
        case 'LL' , idxCFS = 1;
        case 'A' , idxCFS = 1;
        case 'L' , idxCFS = 1;
        case 'AD' ,         idxCFS = 2;
        case 'LH' ,         idxCFS = 2;
        case 'DA' ,         idxCFS = 3;
        case 'HL' ,         idxCFS = 3;
        case 'DD' ,         idxCFS = 4;
        case 'HH' ,         idxCFS = 4;
    end
    if nbIN>1 , levREC = varargin(2); else levREC = W.level; end
        
    if idxCFS>1
        idxCFS = idxCFS + 3*(W.level-levREC);
        if ~cfsFLAG
            for j=1:nbCELL
                if ~(j==idxCFS);
                    W.dec(j) = zeros(W.dec(j));
                end
            end
        else
            X = W.dec(idxCFS);  
            return
        end
        
    elseif idxCFS==1   
        if cfsFLAG & levREC==W.level 
            X = W.dec(1); 
            return; 
        end
        for j=(1 + 3*(W.level-levREC)+1):nbCELL
            W.dec(j) = zeros(W.dec(j));
        end
                
    elseif idxCFS==0
        for j=1:(1 + 3*(W.level-levREC))
            W.dec(j) = zeros(W.dec(j));
        end
        
    else
        
    end
end


Lo  = W.filters.LoR;
Hi  = W.filters.HiR;
dwtEXTM = W.mode;
perFLAG = (dwtEXTM=='per');
cfs   = W.dec;
sizes = W.sizes;
level = W.level;

maxloop = level;
if idxCFS==1 & cfsFLAG , maxloop = (level-levREC); end

for k=1:maxloop
    sizerec = sizes(k+1,:);
    perm = [2,1,3];
    W = list();
    
	W(1) = wrec1D(cfs(1),Lo(2),perm,perFLAG) + ...
	    wrec1D(cfs(2),Hi(2),perm,perFLAG);
	W(2) = wrec1D(cfs(3),Lo(2),perm,perFLAG) + ...
	    wrec1D(cfs(4),Hi(2),perm,perFLAG);
    
    X = (wrec1D(W(1),Lo(1),[],perFLAG) + wrec1D(W(2),Hi(1),[],perFLAG))/4;


    sREC = size(X);
    F = floor((sREC-sizerec)/2);
    C = ceil((sREC-sizerec)/2);
    X = X(1+F(1):$-C(1),1+F(2):$-C(2),:);
    cfs(1) = null();cfs(1) = null();cfs(1) = null();;
    cfs(1) = X;
end


endfunction


function X = wrec1D(X,F,perm,perFLAG)

if ~isempty(perm) , X = permute(X,perm); end
if perFLAG
    nb = length(F)-1;
    X = [X X(:,1:nb,:)];
end
X = conv2(X,F);
if ~isempty(perm) , X = permute(X,perm); end

endfunction