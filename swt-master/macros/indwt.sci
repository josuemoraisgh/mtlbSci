function x = indwt(varargin)
// Inverse nondecimated 1-D wavelet transform
// Calling Sequence
// C=indwt(W,type,[N])
// Parameters
// W:ndwt structure
// type : type ('a' for low-pass components or 'd' for high-pass components)
// N: Level of decomposition
// C: reconstructed components at level N 
// Description
// indwt performs a multilevel nondecimate reconstruction.
// Examples
// x=rand(1,100);
// W1 = ndwt(x,3,'db1');
//  a0 = indwt(W1,'a',0);
// 
//  //reconstruction error
// err = max(abs(x(:)-a0(:)))
// 
// Authors
// H. Nahrstaedt - 2013
// See Also
// ndwt
// ndwt2
// indwt2
[nargout,nargin]=argn(0);


if ~isstruct(varargin(1))
    error('first argument shoud be a struct!');
end

wt = varargin(1);
ndList = wt.dec;
LoR = wt.filters.LoR;
HiR = wt.filters.HiR;
LX  = wt.longs($);
level = wt.level;
nextArg = 2;

nam_Rec = 's';
lev_Rec = 0;
while nargin>=nextArg
    argName = convstr(varargin(nextArg));
    argVal  = varargin(nextArg+1);
    nextArg = nextArg + 2;
    if or( argName== {'a','d','ca','cd'})
            nam_Rec = argName;
            lev_Rec = argVal;
    end
end

lastSTEP = level;
select nam_Rec
    case 's'
        
    case 'cd'
        x = ndList(level+1-(lev_Rec-1));
        return;
        
    case 'ca'
        if lev_Rec==level
             x = ndList(1);
             return
        end
        for k = level+1:-1:2+(level-lev_Rec)
            ndList(k) = zeros(ndList(k));
        end
        lastSTEP = level-lev_Rec;
        
    case 'd'
        set2zero = setdiff((1:level+1),level+2-lev_Rec);
        for k = set2zero
            ndList(k) = zeros(ndList(k));
        end        
        
    case 'a'
        for k = level+1:-1:2+(level-lev_Rec)
            ndList(k) = zeros(ndList(k));
        end
end

index = 1;
for k=1:lastSTEP
    a = conv(ndList(index),LoR);
    d = conv(ndList(index+1),HiR);
    ndList(index+1) = (a+d)/2;
    if index<level
        ndList(index+1) = wkeep(ndList(index+1),length(ndList(index+2)),'c');
    end
    index = index+1;
end
if (nam_Rec=='ca') & ~(lev_Rec==0)
    x = ndList(index); return; 
end
x = wkeep(ndList($),LX,'c');

endfunction