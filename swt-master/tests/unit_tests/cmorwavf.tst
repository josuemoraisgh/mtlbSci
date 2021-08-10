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



function [psi,X] = ref_cmorwavf(LB,UB,N,Fb,Fc);
X = linspace(LB,UB,N);

psi = ((%pi*Fb)^(-0.5))*exp(2*%i*%pi*Fc*X).*exp(-(X.*X)/Fb)

endfunction


LB=-20;
UB=20;
N=1000;
Fb=1;
Fc=1.5;

[psi,x] = ref_cmorwavf(LB,UB,N,Fb,Fc);
[PSI,X]=cmorwavf(LB,UB,N,Fc,Fb);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10 );
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10 );
assert_checkalmostequal ( X , x , %eps, %eps );

LB=-20;
UB=20;
N=1000;
Fb=1.5;
Fc=1;

[psi,x] = ref_cmorwavf(LB,UB,N,Fb,Fc);
[PSI,X]=cmorwavf(LB,UB,N,Fc,Fb);

assert_checkalmostequal ( real(PSI) , real(psi) , %eps, 1e-10 );
assert_checkalmostequal ( imag(PSI) , imag(psi) , %eps, 1e-10 );
assert_checkalmostequal ( X , x , %eps, %eps );
