// -------------------------------------------------------------------------
// SWT - Scilab wavelet toolbox
// Copyright (C) 2010-2014  Holger Nahrstaedt
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//-------------------------------------------------------------------------
//
//  <-- NO CHECK ERROR OUTPUT -->


// filter Test
// biorfilt

function w = symaux(N)

if N==1  // Haar filters
    w = [0.5 0.5];
    w = (w/sum(w));
    return
end



lon = 2*N-1;
sup = [-N+1:N];
a = zeros(1,N);
for k = 1:N
    nok  = sup(sup ~= k);
    a(k) = prod(0.5-nok)/prod(k-nok);
end
P = zeros(1,lon);
P(1:2:lon) = a;
if N==1 then
  P = [P,1,P];
else
  P = [wrev(P),1,P];
end;
//if nargout>1
    Proots = roots(P);
    [s,K] = mtlb_sort(abs(Proots+1));
    Proots = Proots(K(lon+2:2*lon));
    [s,K] = mtlb_sort(abs(Proots));
    Proots = Proots(K);
//end
realzeros   = Proots(find(imag(Proots)==0));
nbrealzeros = length(realzeros);
imagzeros   = Proots(find(imag(Proots)~=0));
nbimagzeros = length(imagzeros);

tmp  = imagzeros(1:2:nbimagzeros/2);
rho  = abs(tmp);
teta = atan(imag(tmp),real(tmp));


nbfr = 200;
freqs = linspace(0,2*%pi,nbfr);
uZ   = exp(-%i*freqs);
nbGroupOfRealZ = nbrealzeros/2;
nbGroupOfImagZ = nbimagzeros/4;
nbGroupOfZeros = nbGroupOfImagZ+nbGroupOfRealZ;
pow2NbGroup    = 2^(nbGroupOfZeros-1);
indImagZ       = [1:nbGroupOfImagZ];
indRealZ       = [nbGroupOfImagZ+1:nbGroupOfZeros];
phas           = zeros(pow2NbGroup,nbfr);
for numG=1:pow2NbGroup;
    [indReZ,indImZ] = getZeroInd(numG,nbGroupOfZeros,nbGroupOfRealZ, ...
                        indRealZ,indImagZ);
    tmp = realzeros(indReZ);
    for ii=1:nbGroupOfRealZ
        phas(numG,:) = phas(numG,:) + phasecontrib(uZ,tmp(ii));
    end
    tmp = rho;
    tmp(indImZ) = 1 ./tmp(indImZ);
    for ii=1:nbGroupOfImagZ
        phas(numG,:) = phas(numG,:) + phasecontrib(uZ,tmp(ii),teta(ii));
    end
end

[m,n] = size(phas);
nlphase = zeros(phas);
for row=1:m
    nlphase(row,:) = phas(row,:)-phas(row,n)*freqs/(2*%pi);
end
phas=nlphase;

phas = sum(phas'.^2,'r');
[phasMin,imin]  = min(phas);

if or(N==[4,5,7,8])
   imin = 2*pow2NbGroup-imin+1;
end


[indReZ,indImZ] = getZeroInd(imin,nbGroupOfZeros,nbGroupOfRealZ, ...
                        indRealZ,indImagZ);

realzeros = realzeros(indReZ);


tmp = rho;
tmp(indImZ) = 1 ./tmp(indImZ);
tmp = tmp.*exp(%i*teta);
tmp = [tmp conj(tmp)]';
imagzeros = tmp(:);


w = real(poly([realzeros;imagzeros;-ones(N,1)],'s'));
w=coeff(w);
w=w($:-1:1);
w = (w/sum(w));

endfunction

function [iReZ,iImZ] = getZeroInd(num,nbGrZ,nbGrReZ,indReZ,indImZ)


bin  = dec2bin(num-1,nbGrZ);
//bin  = logical(wstr2num(bin')');
bin  = (ascii(bin)-48)==1;
if and(bin == %f) then
  bin=[];
end;
iReZ = [1:2:2*nbGrReZ]+bin(indReZ);
iImZ = bin(indImZ);
endfunction

function F = phasecontrib(Z,R,teta)
[nargout,nargin]=argn(0);
select nargin
  case 2 , V = Z-R;
  case 3 , V = (Z-R*exp(%i*teta)).*(Z-R*exp(-%i*teta));
end

F  = atan(imag(V),real(V));
N  = length(F);
DF = F(1:N-1)-F(2:N);
I  = find(abs(DF)>3.5);
for ii=I
     F = F+2*%pi*sign(DF(ii))*[zeros(1,ii) ones(1,N-ii)];
end
F = F-F(1);
endfunction



// sym1
// w = dbaux(1);
// w2=dbwavf("db1");
// w2=w2/sqrt(2);
// assert_checkalmostequal ( w , w2 , %eps, %eps );

// sym2
w = symaux(2);
w2=symwavf("sym2");
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*10000 );

// sym3
N=3;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );
// sym4
N=4;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*10000 );
// sym5
N=5;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );
// sym6
N=6;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym7
N=7;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );
// sym8
N=8;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym9
N=9;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym10
N=10;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym11
N=11;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym12
N=12;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym13
N=13;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym14
N=14;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym15

N=15;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );
// sym16
N=16;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym17
N=17;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym18
N=18;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym19
N=19;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );

// sym20
N=20;
w = symaux(N);
w2=symwavf("sym"+string(N));
w2=w2/sqrt(2);
assert_checkalmostequal ( w , w2 , %eps, %eps*100000 );
