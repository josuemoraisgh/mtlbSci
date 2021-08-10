function [STDC] = wnoisest(C,L,S)
//Estimate noise of 1-D wavelet coefficients
//Calling Sequence
//STDC = wnoisest(C,L,S)
//Parameters
//S: estimate noise for this decompostion levels
//C: coefficent array
//L: length array
//STDC: STDC(k) is an estimate of the standard deviation of C_k
//Description
//estimates of the detail coefficients' standard deviation for levels contained in the input vector S
//Examples
//init = 2055415866; rand('seed',init); 
//x = rand(1,1000,'normal');
//[c,l] = wavedec(x,2,'db3');
//
//wnoisest(c,l,1:2)
// 
// See also
// wavedec
//wden
//thselect
//
//Authors
//Holger Nahrstaedt - 2010-2012


//   STDC = wnoisest(C,L,S) 
//   STDC = wnoisest(C,L,S) returns estimates of the detail coefficients' standard deviation for levels contained in the input vector S. [
//  Inputs
//    x     1-d signal
//    C,L   output of the wavedec function   
//  Outputs
//    STDC  estimation of sigma
[nargout,nargin]=argn(0);

select nargin
    case 3 then
	maxLevel=length(L)-2;
	if(maxLevel<length(S))
	    error("C,L does not contain so much levels. reduce S!");
	end;
	
	STDC=zeros(1,length(S));
	for level=S

	 //STDC(level) = median(abs(C(sum(l(1:(maxLevel-level+1)))+1:sum(l(1:(maxLevel-level+2))))))/.6745;
         STDC(level)= median(abs(detcoef(C,L,level)))/.6745;
	//STDC(level) = median(abs(C(sum(L(1:level))+(1:L(level+1)))))/.6745;
	end;
    case 2 // for all levels
	maxLevel=length(L)-2;
	
	STDC=zeros(1,maxLevel);
	for level=1:maxLevel

	 //STDC(level) = median(abs(C(sum(l(1:(maxLevel-level+1)))+1:sum(l(1:(maxLevel-level+2))))))/.6745;
         STDC(level)= median(abs(detcoef(C,L,level)))/.6745;
	//STDC(level) = median(abs(C(sum(L(1:level))+(1:L(level+1)))))/.6745;
	end;

    case 1 then
	if or(type(C)==[1 4 8]) then
	    STDC = median(abs(C))/0.6745;
	elseif typeof(C)=="list" then
	  STDC = zeros(1,length(C));
	  for k = 1:length(C)
	      STDC(k) = median(abs(C(k)))/0.6745;
	  end
        end;
end;
    
 endfunction
 
