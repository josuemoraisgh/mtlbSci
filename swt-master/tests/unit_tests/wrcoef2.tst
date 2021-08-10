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


// dwt2d  Test 2

// wrcoef2
a=rand(50,51,'normal');
[c,s]=wavedec2(a,3,'db3');
[cA1,cH1,cV1,cD1]=dwt2(a,'db3');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db3');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db3');
[Lo_R,Hi_R]=wfilters('db3','r');
a3=wrcoef2('a',c,s,'db3',3);
a33=wrcoef2('a',c,s,'db3');
a333=wrcoef2('a',c,s,Lo_R,Hi_R,3);
a3333=wrcoef2('a',c,s,Lo_R,Hi_R);
a2=wrcoef2('a',c,s,'db3',2);
a22=wrcoef2('a',c,s,Lo_R,Hi_R,2);
a1=wrcoef2('a',c,s,'db3',1);
a11=wrcoef2('a',c,s,Lo_R,Hi_R,1);
d3=wrcoef2('d',c,s,'db3',3);
d33=wrcoef2('d',c,s,'db3');
d333=wrcoef2('d',c,s,Lo_R,Hi_R,3);
d3333=wrcoef2('d',c,s,Lo_R,Hi_R);
d2=wrcoef2('d',c,s,'db3',2);
d22=wrcoef2('d',c,s,Lo_R,Hi_R,2);
d1=wrcoef2('d',c,s,'db3',1);
d11=wrcoef2('d',c,s,Lo_R,Hi_R,1);
h3=wrcoef2('h',c,s,'db3',3);
h33=wrcoef2('h',c,s,'db3');
h333=wrcoef2('h',c,s,Lo_R,Hi_R,3);
h3333=wrcoef2('h',c,s,Lo_R,Hi_R);
h2=wrcoef2('h',c,s,'db3',2);
h22=wrcoef2('h',c,s,Lo_R,Hi_R,2);
h1=wrcoef2('h',c,s,'db3',1);
h11=wrcoef2('h',c,s,Lo_R,Hi_R,1);
v3=wrcoef2('v',c,s,'db3',3);
v33=wrcoef2('v',c,s,'db3');
v333=wrcoef2('v',c,s,Lo_R,Hi_R,3);
v3333=wrcoef2('v',c,s,Lo_R,Hi_R);
v2=wrcoef2('v',c,s,'db3',2);
v22=wrcoef2('v',c,s,Lo_R,Hi_R,2);
v1=wrcoef2('v',c,s,'db3',1);
v11=wrcoef2('v',c,s,Lo_R,Hi_R,1);
A3=waverec2([matrix(cA3,1,length(cA3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');
A2=waverec2([matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))  zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');
A1=waverec2([matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))  matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');

H3=waverec2([zeros(1,length(cH3)) matrix(cH3,1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');
H2=waverec2([zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) matrix(cH2,1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');
H1=waverec2([zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) matrix(cH1,1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');

V3=waverec2([zeros(1,length(cH3)) zeros(1,length(cH3)) matrix(cV3,1,length(cV3)) zeros(1,length(cH3)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');
V2=waverec2([zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH2)) matrix(cV2,1,length(cV2))  zeros(1,length(cH2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');
V1=waverec2([zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH1)) matrix(cV1,1,length(cV1)) zeros(1,length(cH1))],s,'db3');

D3=waverec2([zeros(1,length(cH3)) zeros(1,length(cH3))  zeros(1,length(cH3)) matrix(cD3,1,length(cD3)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');
D2=waverec2([zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH2))   zeros(1,length(cH2)) matrix(cD2,1,length(cD2)) zeros(1,length(cH1)) zeros(1,length(cH1)) zeros(1,length(cH1))],s,'db3');
D1=waverec2([zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH3)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH2)) zeros(1,length(cH1))  zeros(1,length(cH1)) matrix(cD1,1,length(cD1))],s,'db3');

assert_checkalmostequal ( a3 , A3 , %eps );
assert_checkalmostequal ( a33 , A3 , %eps );
assert_checkalmostequal ( a333 , A3 , %eps );
assert_checkalmostequal ( a333 , A3 , %eps );
assert_checkalmostequal ( a2 , A2 , %eps );
assert_checkalmostequal ( a22 , A2 , %eps );
assert_checkalmostequal ( a1 , A1 , %eps );
assert_checkalmostequal ( a11 , A1 , %eps );


assert_checkalmostequal ( h3 , H3 , %eps );
assert_checkalmostequal ( h33 , H3 , %eps );
assert_checkalmostequal ( h333 , H3 , %eps );
assert_checkalmostequal ( h333 , H3 , %eps );
assert_checkalmostequal ( h2 , H2 , %eps );
assert_checkalmostequal ( h22 , H2 , %eps );
assert_checkalmostequal ( h1 , H1 , %eps );
assert_checkalmostequal ( h11 , H1 , %eps );

assert_checkalmostequal ( v3 , V3 , %eps );
assert_checkalmostequal ( v33 , V3 , %eps );
assert_checkalmostequal ( v333 , V3 , %eps );
assert_checkalmostequal ( v333 , V3 , %eps );
assert_checkalmostequal ( v2 , V2 , %eps );
assert_checkalmostequal ( v22 , V2 , %eps );
assert_checkalmostequal ( v1 , V1 , %eps );
assert_checkalmostequal ( v11 , V1 , %eps );

assert_checkalmostequal ( d3 , D3 , %eps );
assert_checkalmostequal ( d33 , D3 , %eps );
assert_checkalmostequal ( d333 , D3 , %eps );
assert_checkalmostequal ( d333 , D3 , %eps );
assert_checkalmostequal ( d2 , D2 , %eps );
assert_checkalmostequal ( d22 , D2 , %eps );
assert_checkalmostequal ( d1 , D1 , %eps );
assert_checkalmostequal ( d11 , D1 , %eps );


clear a3;
clear a33;
clear a333;
clear a3333;
clear a2;
clear a22;
clear a1;
clear a11;
clear d3;
clear d33;
clear d333;
clear d3333;
clear d2;
clear d22;
clear d1;
clear d11;
clear h3;
clear h33;
clear h333;
clear h3333;
clear h2;
clear h22;
clear h1;
clear h11;
clear v3;
clear v33;
clear v333;
clear v3333;
clear v2;
clear v22;
clear v1;
clear v11;
clear cA1;
clear cA2;
clear cA3;
clear cH1;
clear cH2;
clear cH3;
clear cV1;
clear cV2;
clear cV3;
clear cD1;
clear cD2;
clear cD3;
clear Lo_R;
clear Hi_R;
clear A3;
clear A2;
clear A1;
clear H3;
clear H2;
clear H1;
clear V3;
clear V2;
clear V1;
clear D3;
clear D2;
clear D1;
clear c;
clear s;
