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


// cgauwavf test
function [psi,X] = ref_cgauwavf(LB,UB,N,NumWAW);

X = linspace(LB,UB,N);  // wavelet support.
if or(NumWAW==(1:8))
  X2 = X.^2;
  F0 = exp(-X2);
  F1 = exp(-%i*X);
  F2 = (F1.*F0)/(exp(-1/2)*2^(1/2)*%pi^(1/2))^(1/2);
end

select NumWAW
case 1
    psi = F2.*(-%i-2*X)*2^(1/2);

  case 2
    psi = 1/3*F2.*(-3+4*%i*X+4*X2)*6^(1/2);

  case 3
    psi = 1/15*F2.*(7*%i+18*X-12*%i*X.^2-8*X.^3)*30^(1/2);

  case 4
    psi = 1/105*F2.*(25-56*%i*X-72*X.^2+32*%i*X.^3+16*X.^4)*210^(1/2);

  case 5
    psi = 1/315*F2.*(-81*%i-250*X+280*%i*X.^2+240*X.^3-80*%i*X.^4-32*X.^5)*210^(1/2);

  case 6
    psi = 1/3465*F2.*(-331+972*%i*X+1500*X.^2-1120*%i*X.^3-720*X.^4+192*%i*X.^5+64*X.^6)*2310^(1/2);

  case 7
    psi = 1/45045*F2.*(1303*%i+4634*X-6804*%i*X.^2-7000*X.^3+3920*%i*X.^4+2016*X.^5-448*%i*X.^6-128*X.^7)*30030^(1/2);

  case 8
    psi = 1/45045*F2.*(5937-20848*%i*X-37072*X.^2+36288*%i*X.^3+28000*X.^4-12544*%i*X.^5-5376*X.^6+1024*%i*X.^7+256*X.^8)*2002^(1/2);

  else
    error("1-8");
 end
  intL2 = real(sum(psi.*conj(psi)));
  norL2 = intL2($)*(X(2)-X(1));
  psi   = psi/real(sqrt(norL2));
endfunction



LB=-5;
UB=5;
N=1000;


[psi,x] = ref_cgauwavf(LB,UB,N,1);
[PSI,X]=cgauwavf(LB,UB,N,1);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10);
assert_checkalmostequal ( X , x , %eps, %eps );


[psi,x] = ref_cgauwavf(LB,UB,N,2);
[PSI,X]=cgauwavf(LB,UB,N,2);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_cgauwavf(LB,UB,N,3);
[PSI,X]=cgauwavf(LB,UB,N,3);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_cgauwavf(LB,UB,N,4);
[PSI,X]=cgauwavf(LB,UB,N,4);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_cgauwavf(LB,UB,N,5);
[PSI,X]=cgauwavf(LB,UB,N,5);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_cgauwavf(LB,UB,N,6);
[PSI,X]=cgauwavf(LB,UB,N,6);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_cgauwavf(LB,UB,N,7);
[PSI,X]=cgauwavf(LB,UB,N,7);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_cgauwavf(LB,UB,N,8);
[PSI,X]=cgauwavf(LB,UB,N,8);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10);
assert_checkalmostequal ( X , x , %eps, %eps );
