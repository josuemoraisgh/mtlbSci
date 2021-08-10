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


// shanwavf test



function y = sinc2(x)
y = ones(x);
k = find(x);
y(k) = sin(%pi*x(k))./(%pi*x(k));
endfunction

function [psi,x] = ref_fbspwavf(LB,UB,N,m,Fb,Fc);
x = linspace(LB,UB,N);
psi = (Fb^0.5)*((sinc2(Fb*x/m).^m).*exp(2*%i*%pi*Fc*x));
endfunction


LB=-20;
UB=20;
N=1000;
Fb=1;
Fc=1.5;
M=2;

[psi,x] = ref_fbspwavf(LB,UB,N,M,Fb,Fc);
[PSI,X]=fbspwavf(LB,UB,N,M,Fc,Fb);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-9 );
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-9 );
assert_checkalmostequal ( X , x , %eps, %eps );

LB=-20;
UB=20;
N=1000;
Fb=1.5;
Fc=1;
M=2;

[psi,x] = ref_fbspwavf(LB,UB,N,M,Fb,Fc);
[PSI,X]=fbspwavf(LB,UB,N,M,Fc,Fb);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-9 );
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-9 );
assert_checkalmostequal ( X , x , %eps, %eps );

LB=-20;
UB=20;
N=1000;
Fb=1.5;
Fc=1.2;
M=3;

[psi,x] = ref_fbspwavf(LB,UB,N,M,Fb,Fc);
[PSI,X]=fbspwavf(LB,UB,N,M,Fc,Fb);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-9 );
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-9 );
assert_checkalmostequal ( X , x , %eps, %eps );
