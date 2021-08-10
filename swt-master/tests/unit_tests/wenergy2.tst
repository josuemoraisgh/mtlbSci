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

// wenergy2
a=rand(500,501,'normal');

[c,s]=wavedec2(a,3,'db2');
[cA1,cH1,cV1,cD1]=dwt2(a,'db2');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db2');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db2');
en=sum(c.*c);
ea=sum(cA3.*cA3)*100/en;
eh1=sum(cH1.*cH1)*100/en;
eh2=sum(cH2.*cH2)*100/en;
eh3=sum(cH3.*cH3)*100/en;
ev1=sum(cV1.*cV1)*100/en;
ev2=sum(cV2.*cV2)*100/en;
ev3=sum(cV3.*cV3)*100/en;
ed1=sum(cD1.*cD1)*100/en;
ed2=sum(cD2.*cD2)*100/en;
ed3=sum(cD3.*cD3)*100/en;
[Ea,Eh,Ev,Ed]=wenergy2(c,s);
[Eaa,Edetail]=wenergy2(c,s);
eed1=eh1+ev1+ed1;
eed2=eh2+ev2+ed2;
eed3=eh3+ev3+ed3;

assert_checkalmostequal ( Ea , ea , %eps,1e-10 );
assert_checkalmostequal ( Eh , [eh3 eh2 eh1] , %eps,1e-10 );
assert_checkalmostequal ( Ev , [ev3 ev2 ev1] , %eps, 1e-10 );
assert_checkalmostequal ( Ed , [ed3 ed2 ed1] , %eps, 1e-10);
assert_checkalmostequal ( Eaa , ea , %eps, 1e-10 );
assert_checkalmostequal ( Edetail , [eed3 eed2 eed1] , %eps, 1e-10);



clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear c;
clear s;
clear eed1;
clear eed2;
clear eed3;
clear eh1;
clear eh2;
clear eh3;
clear ev1;
clear ev2;
clear ev3;
clear ed1;
clear ed2;
clear ed3;
