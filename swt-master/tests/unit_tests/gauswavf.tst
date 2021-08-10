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


// gauswavf test
function [psi,X] = ref_gauswavf(LB,UB,N,NumWAW);

X = linspace(LB,UB,N);  // wavelet support.
if or(NumWAW==(1:8))
  X2 = X.^2;
  F0 = (2/%pi)^(1/4)*exp(-X2);
end

select NumWAW
  case 1
    psi = -2*X.*F0;

  case 2
    psi = 2/(3^(1/2)) * (-1+2*X2).*F0;

  case 3
    psi = 4/(15^(1/2)) * X.* (3-2*X2).*F0;

  case 4
    psi = 4/(105^(1/2)) * (3-12*X2+4*X2.^2).*F0;

  case 5
    psi = 8/(3*(105^(1/2))) * X.* (-15+20*X2-4*X2.^2).*F0;

  case 6
    psi = 8/(3*(1155^(1/2))) * (-15+90*X2-60*X2.^2+8*X2.^3).*F0;

  case 7
    psi = 16/(3*(15015^(1/2))) *X.*(105-210*X2+84*X2.^2-8*X2.^3).*F0;

  case 8
    psi = 16/(45*(1001^(1/2))) * (105-840*X2+840*X2.^2-224*X2.^3+16*X2.^4).*F0;

  else
    error("1-8");
 end

endfunction



LB=-5;
UB=5;
N=1000;


[psi,x] = ref_gauswavf(LB,UB,N,1);
[PSI,X]=gauswavf(LB,UB,N,1);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-11);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-11);
assert_checkalmostequal ( X , x , %eps, %eps );


[psi,x] = ref_gauswavf(LB,UB,N,2);
[PSI,X]=gauswavf(LB,UB,N,2);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-11);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-11);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_gauswavf(LB,UB,N,3);
[PSI,X]=gauswavf(LB,UB,N,3);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-11);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-11);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_gauswavf(LB,UB,N,4);
[PSI,X]=gauswavf(LB,UB,N,4);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-11);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-11);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_gauswavf(LB,UB,N,5);
[PSI,X]=gauswavf(LB,UB,N,5);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-11);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-11);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_gauswavf(LB,UB,N,6);
[PSI,X]=gauswavf(LB,UB,N,6);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-11);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-11);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_gauswavf(LB,UB,N,7);
[PSI,X]=gauswavf(LB,UB,N,7);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-11);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-11);
assert_checkalmostequal ( X , x , %eps, %eps );

[psi,x] = ref_gauswavf(LB,UB,N,8);
[PSI,X]=gauswavf(LB,UB,N,8);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-11);
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-11);
assert_checkalmostequal ( X , x , %eps, %eps );
