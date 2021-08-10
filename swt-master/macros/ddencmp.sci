function [THR,SORH,KEEPAPP,CRIT] = ddencmp(IN1,IN2,X)
// Default values for de-noising or compression
//Calling Sequence
//[THR,SORH,KEEPAPP,CRIT] = ddencmp(IN1,IN2,X)
//[THR,SORH,KEEPAPP] = ddencmp(IN1,'wv',X)
//[THR,SORH,KEEPAPP,CRIT] = ddencmp(IN1,'wp',X)
//Parameters
//X: double vector or matrix
//IN1: IN1 is 'den' for de-noising or 'cmp' for compression.
//IN2: IN2 is 'wv' for wavelet or 'wp' for wavelet packet.
//CRIT: entropy name
//KEEPAPP: keep aproximation coefficients
//SORH: hard / soft thresholding
//THR: threshold
//Description
//ddencmp gives default values for all the general procedures related to de-noising and compression of one- or two-dimensional signals, using wavelets or wavelet packets.
//Examples
//init = 2055415866; rand('seed',init); 
//x = rand(1,1000,'normal');
//[thr,sorh,keepapp] = ddencmp('den','wv',x)
//
//See also
// waverec
//Authors
// Roger Liu and Isaac Zhi
// H. Nahrstaedt - 2010-2012


    [nargout,nargin]=argn(0);
    if (nargin < 3),
        error ( '3 parameters are required' ); 
    end

    if ~(convstr(IN1)=='den' | convstr(IN1)=='cmp')
        error("IN1 must be den or cmp!");
    end;
    if ~(convstr(IN2)=='wv' | convstr(IN2)=='wp')
        error("IN2 must be wv or wp!");
    end;
    CRIT='threshold';
    n=prod(size(X));


    if (convstr(IN1)=='den' & convstr(IN2)=='wv') then
        SORH='s';
        KEEPAPP=1;
          if (min(size(X))==1) then
            [C,L]=wavedec(X,1,'db1');
            C = C(L(1)+1:$);
        else
            [C,L]=wavedec2(X,1,'db1');
            C = C(prod(L(1,:))+1:$);
         end;
        //s=wnoisest(C,L,1);
        s=median(abs(C))/0.6745;
        THR = sqrt(2*log(n)) * s;
    elseif (convstr(IN1)=='cmp' & convstr(IN2)=='wv') then
        SORH='h';
        KEEPAPP=1;
        if (min(size(X))==1) then
            [C,L]=wavedec(X,1,'db1');
            C = C(L(1)+1:$);
        else
            [C,L]=wavedec2(X,1,'db1');
            C = C(prod(L(1,:))+1:$);
         end;
        THR= median(abs(C));
        if (THR==0),
            THR= 0.05 * max(abs(C));
        end;
    elseif (convstr(IN1)=='den' & convstr(IN2)=='wp') then
        SORH='h';
        KEEPAPP=1;
        CRIT='sure';
        THR = sqrt(2*log(n*log(n)/log(2)));
    elseif (convstr(IN1)=='cmp' & convstr(IN2)=='wp') then
        SORH='h';
        KEEPAPP=1;
         if (min(size(X))==1) then
            [C,L]=wavedec(X,1,'db1');
            C = C(L(1)+1:$);
        else
            [C,L]=wavedec2(X,1,'db1');
            C = C(prod(L(1,:))+1:$);
         end;
        THR = median(abs(C));
    end;

endfunction

