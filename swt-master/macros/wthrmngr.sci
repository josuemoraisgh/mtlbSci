function varargout = wthrmngr(option,varargin)
[nargout,nargin]=argn(0);


meth = varargin(1);

if ~or(option=={'dw1dcompGBL','dw1dcompLVL','dw1ddenoLVL','dw1ddenoDEN','dw2dcompGBL','dw2dcompLVL',...
            'dw2ddenoLVL', 'wp1dcompGBL','wp2dcompGBL','wp1ddenoGBL','wp2ddenoGBL',...
             'sw1ddenoLVL','sw2ddenoLVL'}) then
   error("invalid option");
end;

if or(option=={'wp1ddenoGBL','wp2ddenoGBL'})
     select meth
       case 'sqtwologswn' , meth = 'sqtwolog'; scal = 'sln';
       case 'sqtwologuwn' , meth = 'sqtwolog'; scal = 'one';
     end
end
flgTYPE = part(option,1:2);
flgDIM  = ascii(part(option,3))-48;
flgTOOL = part(option,5:8);
flgMODE = part(option,9:11);

if ~(meth=='rem_n0') then
    if or(option=={'dw1dcompGBL','dw1dcompLVL','dw1ddenoLVL','dw1ddenoDEN'}) then
            level = length(varargin(3))-2;

     elseif  or(option=={'dw2dcompGBL','dw2dcompLVL','dw2ddenoLVL'}) then
            level = size(varargin(3),1)-2;

      elseif     or(option=={'wp1dcompGBL','wp1ddenoGBL','wp2dcompGBL','wp2ddenoGBL'}) then
            level = treedpth(varargin(2));

       elseif  option=='sw1ddenoLVL' then
            level = size(varargin(2),1)-1;

       elseif  option=='sw2ddenoLVL' then
            ND = ndims(varargin(2));
            select ND
                case 3 , level = (size(varargin(2),3)-1)/3;
                case 4 , level = (size(varargin(2),4)-1)/3;
            end
    end
else
    if length(varargin)>2 , level = varargin(3); end
end

select option
   case 'sw1ddenoLVL'
       tmp = varargin(2);
       varargin(4) = varargin(3);
       varargin(2) = [];
       varargin(3) = size(tmp,2);
       for k=1:level
           cfs  = tmp(k,1:2^k:$);
           varargin(2) = [cfs , varargin(2)];
           varargin(3) = [length(cfs) , varargin(3)];
       end
       cfs = tmp(level+1,1:2^level:$);
       varargin(2) = [cfs , varargin(2)];
       varargin(3) = [length(cfs) , varargin(3)];

   case 'sw2ddenoLVL'
       tmp = varargin(2);
       varargin(4) = varargin(3);
       varargin(2) = [];
       varargin(3) = size(tmp(:,:,1));
       for k=1:level
           cfs  = tmp(1:2^k:$,1:2^k:$,3*k);
           varargin(2) = [cfs(:)' , varargin(2)];
           cfs  = tmp(1:2^k:$,1:2^k:$,2*k);
           varargin(2) = [cfs(:)' , varargin(2)];
           cfs  = tmp(1:2^k:$,1:2^k:$,1*k);
           varargin(2) = [cfs(:)' , varargin(2)];
           varargin(3) = [size(cfs) ; varargin(3)];
       end
       cfs = tmp(1:2^level:$,1:2^level:$,$);
       varargin(2) = [cfs(:)' , varargin(2)];
       varargin(3) = [size(cfs) ; varargin(3)];

end

select flgTOOL
 
  case 'comp'
    select flgMODE
      case 'GBL'
        if meth== 'rem_n0'
             varargout(1) = remNearZero(flgTOOL,flgTYPE,varargin(2));

           elseif  or(meth==  {'bal_sn','sqrtbal_sn'}) then
             if length(varargin)<3 , varargin(3) = []; end 
             [valTHR,maxTHR,thresVALUES,rl2SCR,n0SCR] = ...
                   balanceSparsityNorm(meth,flgTYPE,varargin(2),varargin(3));
             varargout = list(valTHR,maxTHR,thresVALUES,rl2SCR,n0SCR);
        end

      case 'LVL'
        if or(meth==  {'scarcehi','scarceme','scarcelo'}) then
             varargout(1) = scarceStrategies(meth,flgDIM,varargin(2),varargin(3),varargin(4));

           elseif  meth==  'rem_n0'
             valTHR = remNearZero(flgTOOL,flgTYPE,varargin(2));
             varargout(1) = expandTHR(valTHR,flgDIM,level);

           elseif  or(meth== {'bal_sn','sqrtbal_sn'}) then
             valTHR = balanceSparsityNorm(meth,flgTYPE,varargin(2),varargin(3));
             varargout(1) = expandTHR(valTHR,flgDIM,level);
       end
    end
  case 'deno'
    select flgMODE
      case 'GBL'        
        if length(varargin)==2 , varargin(3) = []; end
        if meth == 'sqtwolog'

		order = treeord(varargin(2));
		nodes = (2:order)'; 
		det = [];
		for k =1:length(nodes)
		    tmp = wpcoef(arargin(2),nodes(k));
		    det = [det , tmp(:)'];
		end
		cfs = read(arargin(2),'allcfs');
		univTHR = sqrt(2*log(length(det)));
		select scal
		  case 'one' , s = 1;
		  case 'sln' , s = wnoisest(det);
		end
		valTHR = s*univTHR;
		maxTHR = max(abs(cfs));
		valTHR = min(valTHR,maxTHR);


             varargout = list(valTHR,maxTHR,cfs);

           elseif  or(meth==  {'bal_sn','sqrtbal_sn'}) then
             [valTHR,maxTHR,thresVALUES] = ...
                   balanceSparsityNorm(meth,flgTYPE,varargin(2),varargin(3));
             varargout = list(valTHR,maxTHR,thresVALUES);

           elseif  or(meth==  {'penalhi','penalme','penallo'}) then
	      sliBMVal = 3;
	      select meth
		case 'penalhi' , alfa = 5*(3*sliBMVal+1)/8;
		case 'penalme' , alfa = (sliBMVal+5)/4;
		case 'penallo' , alfa = (sliBMVal+3)/4;
	      end

	      depth = treedpth(varargin(2));
	      if depth==0 , valTHR = 0; return; end
	      select flgDIM
		case 1
		  cD1 = wpcoef(varargin(2),[1,1]);
		  sigma = wnoisest(cD1);
		case 2
		  cH1 = wpcoef(varargin(2),[1,1]);
		  cV1 = wpcoef(varargin(2),[1,2]);
		  cD1 = wpcoef(varargin(2),[1,3]);
		  sigma = wnoisest([cH1(:)',cV1(:)',cD1(:)']);
	      end
	      cfs = read(varargin(2),'allcfs');
	      valTHR = wpbmpen(varargin(2),sigma,alfa);
	      maxTHR = max(abs(cfs));
	      valTHR = min(valTHR,maxTHR);
             varargout = list(valTHR,maxTHR,cfs);
        end

      case 'LVL'
        if meth=='sqtwolog' then
             select flgDIM
                case 1 then
			  coefs=varargin(2);sizes=varargin(3);scal=varargin(4);
			  coefs2=list();
			    for k=1:length(sizes)-2
			  coefs2(k)  = detcoef(coefs,sizes,k);
                           end;
		  
			sigma  = sigmaHAT(scal,coefs2);
			nbcfs = 0;
			for k=1:length(coefs2)
			    nbcfs = nbcfs+length(coefs2(k));
			end
			valTHR = sqrt(2*log(nbcfs))*sigma;
			varargout(1) = valTHR;
                case 2  then
			coefs=varargin(2);sizes=varargin(3);scal=varargin(4);
			strDET = ['h','d','v'];
			s = ones(3,level);
			select scal
			  case 'one'
			  case 'sln'
			    detc  = detcoef2('compact',coefs,sizes,1);
			    s = wnoisest(detc) * s;  
			  case 'mln'
			    for k = 1:level
			      detc = detcoef2('compact',coefs,sizes,k);
			      s(:,k) = wnoisest(detc) * ones(3,1);
			    end
			end
			valTHR = zeros(3,level);
			for d = 1:3
			  for k = 1:level
			    detc = detcoef2(strDET(d),coefs,sizes,k);
			    univTHR     = sqrt(2*log(length(detc)));
			    valTHR(d,k) = univTHR*s(d,k);
			  end
			end
			varargout(1) = valTHR;
             end

          elseif  or(meth=={'rigrsure','heursure','minimaxi'}) then
             coefs = detcoef(varargin(2),varargin(3),'all');
             sigma = sigmaHAT(varargin(4),coefs);
             varargout(1) = getTHR(meth,sigma,coefs);

           elseif  or(meth=={'penalhi','penalme','penallo'}) then

             valTHR = penalStrategies(meth,flgDIM,varargin(2),varargin(3),varargin(4));
             varargout(1) = expandTHR(valTHR,flgDIM,level);

           elseif  or(meth=={'scarcehi','scarceme','scarcelo'}) then
             varargout(1) = scarceStrategies(meth,flgDIM,varargin(2),varargin(3),varargin(4));

           elseif  or(meth=={'bal_sn','sqrtbal_sn'}) then
             valTHR = balanceSparsityNorm(meth,flgTYPE,varargin(2),varargin(3));
             varargout(1) = expandTHR(valTHR,flgDIM,level);
        end


      case 'DEN' 
        select meth
           case 'globalth', 
	      coefs=varargin(2);
	      sizes=varargin(3);
	      n = sizes($);
	      J = size(sizes,2)-2;
	      coefs = coefs(sizes(1)+1:$);
	      valTHR = max(abs(coefs))*log(n)/sqrt(n);
	      valTHR = expandTHR(valTHR,1,J);
	      varargout(1)=valTHR;
           case {'bylevth1'}
		      J = size(varargin(3),2)-2;
	      valTHR = zeros(1,J);
	      for j=1:J
		  d = detcoef(varargin(2),varargin(3),j);
		  valTHR(j) = 0.4*max(abs(d));
	      end
	      varargout(1)=valTHR;
             
           case {'bylevth2'}
	      J = size(varargin(3),2)-2;
	      valTHR = zeros(1,J);
	      for j=1:J
		  d = detcoef(varargin(2),varargin(3),j);
		  valTHR(j) = 0.8*max(abs(d));
	      end
	      varargout(1)=valTHR;
           case {'bylevsth'}
	    J = size(varargin(3),2)-2;
	    valTHR = zeros(1,J);
	    for j=1:J
		d = detcoef(varargin(2),varargin(3),j);
		valTHR(j) = max(abs(d));
	    end
	    valTHR = valTHR * (varargin(4)/(5-sqrt(%eps)));
	    varargout(1)=valTHR;
        end
    end


end

endfunction

function [valTHR,maxTHR,thresVALUES,rl2SCR,n0SCR] = ...
                         balanceSparsityNorm(meth,flgTYPE,A,B)

select flgTYPE
  case 'dw'
    [thresVALUES,rl2SCR,n0SCR,imin] = wcmpscr(A,B);
  case 'sw'
    [thresVALUES,rl2SCR,n0SCR,imin] = wcmpscr(A,B);
 case 'wp'
    [thresVALUES,rl2SCR,n0SCR,imin] = wpcmpscr(A);
end
valTHR = thresVALUES(imin);
maxTHR = thresVALUES($);
if (meth=='sqrtbal_sn') , valTHR = min(sqrt(valTHR),maxTHR); end
endfunction

function valTHR = remNearZero(flgTOOL,flgTYPE,X)

select flgTOOL
  case 'comp' , argTOOL = 'cmp';
  case 'deno' , argTOOL = 'den';
end
select flgTYPE
  case 'dw' , argTYPE = 'wv';
  case 'wp' , argTYPE = 'wp';
end
valTHR = ddencmp(argTOOL,argTYPE,X);
endfunction

function valTHR = scarceStrategies(meth,flgDIM,coefs,sizes,alfa)

select flgDIM
  case 1 , M = [1 , 1.5 ,   2] * sizes(1);
  case 2 , M = 4 * [1 , 4/3 , 8/3] * prod(sizes(1,:));
end
select meth
    case 'scarcehi' , M = M(1);
    case 'scarceme' , M = M(2);
    case 'scarcelo' , M = M(3);
end
if flgDIM==1
    valTHR = wdcbm(coefs,sizes,alfa,M);
else
    valTHR = wdcbm2(coefs,sizes,alfa,M);
end
endfunction

function valTHR = penalStrategies(meth,flgDIM,coefs,sizes,sliBMVal)

select flgDIM
  case 1
    sigma = wnoisest(coefs,sizes,1);
  case 2 
    det   = detcoef2('compact',coefs,sizes,1);
    sigma = wnoisest(det);
end
select meth
  case 'penalhi' , alfa = 5*(3*sliBMVal+1)/8;
  case 'penalme' , alfa = (sliBMVal+5)/4;
  case 'penallo' , alfa = (sliBMVal+3)/4;
end
valTHR = wbmpen(coefs,sizes,sigma,alfa);
endfunction

function [valTHR,maxTHR,cfs] = WPpenalStrategies(meth,flgDIM,wpt)

sliBMVal = 3;
select meth
  case 'penalhi' , alfa = 5*(3*sliBMVal+1)/8;
  case 'penalme' , alfa = (sliBMVal+5)/4;
  case 'penallo' , alfa = (sliBMVal+3)/4;
end

depth = treedpth(wpt);
if depth==0 , valTHR = 0; return; end
select flgDIM
  case 1
    cD1 = wpcoef(wpt,[1,1]);
    sigma = wnoisest(cD1);
  case 2
    cH1 = wpcoef(wpt,[1,1]);
    cV1 = wpcoef(wpt,[1,2]);
    cD1 = wpcoef(wpt,[1,3]);
    sigma = wnoisest([cH1(:)',cV1(:)',cD1(:)']);
end
cfs = read(wpt,'allcfs');
valTHR = wpbmpen(wpt,sigma,alfa);
maxTHR = max(abs(cfs));
valTHR = min(valTHR,maxTHR);
endfunction

function valTHR = expandTHR(valTHR,flgDIM,nbLEV)
select flgDIM
   case 1 , nbDIR = 1;
   case 2 , nbDIR = 3;
end
valTHR = valTHR*ones(nbDIR,nbLEV);
endfunction

function s = sigmaHAT(scal,coefs)

level = length(coefs);
select scal
  case 'one' , s = ones(1,level);
  case 'sln' , s = ones(1,level)*wnoisest(coefs(1));
  case 'mln' , s = wnoisest(coefs);
end
endfunction

function thr = getTHR(meth,s,coefs)

if meth=='minimaxi' then
      nbcfs = 0;
      for k=1:length(s) , nbcfs = nbcfs+length(coefs(k)); end
      if nbcfs <= 32
          thr = 0*s;
      else
          thr = (0.3936 + 0.1829*(log(nbcfs)/log(2)))*s;
      end

elseif or(meth== {'rigrsure','heursure'}) then
      thr = zeros(s);
      for k=1:length(s)
          mk = max(coefs(k));
          if (mk<sqrt(eps)) | (s(k)<sqrt(eps)*mk)
              thr(k) = 0;
          else
              thr(k) = sureTHR(meth,coefs(k)/s(k));
          end
      end
      thr = thr.*s;
end
endfunction

function thr = sureTHR(meth,x)

x = x(:)';
n = length(x);
select meth
  case 'rigrsure'
    sx2 = sort(abs(x)).^2;
    risks = (n-(2*(1:n))+(cumsum(sx2)+(n-1:-1:0).*sx2))/n;
    [tmp,best] = min(risks);
    thr = sqrt(sx2(best));

  case 'heursure'
    hthr = sqrt(2*log(n));
    eta = (norm(x).^2-n)/n;
    crit = (log(n)/log(2))^(1.5)/sqrt(n);
    if eta < crit
        thr = hthr;
    else
        thr = min(sureTHR('rigrsure',x),hthr);
    end
end
endfunction





