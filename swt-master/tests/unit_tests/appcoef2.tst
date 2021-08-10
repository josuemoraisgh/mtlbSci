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

// appcoef2
version = getversion("scilab");
if (version(1)<6) then
	sz=stacksize();
	stacksize(1e7);
end;
a=rand(500,501,'normal');

[c,s]=wavedec2(a,3,'sym5');
[Lo_R,Hi_R]=wfilters('sym5','r');
[cA1,cH1,cV1,cD1]=dwt2(a,'sym5');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym5');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym5');
ca3=cA3;
ca2=idwt2(cA3,cH3,cV3,cD3,'sym5',size(cA2));
ca1=idwt2(ca2,cH2,cV2,cD2,'sym5',size(cA1));
ca0=idwt2(ca1,cH1,cV1,cD1,'sym5',size(a));
A0=appcoef2(c,s,'sym5',0);
A00=appcoef2(c,s,Lo_R,Hi_R,0);
A1=appcoef2(c,s,'sym5',1);
A11=appcoef2(c,s,Lo_R,Hi_R,1);
A2=appcoef2(c,s,'sym5',2);
A22=appcoef2(c,s,Lo_R,Hi_R,2);
A3=appcoef2(c,s,'sym5',3);
A33=appcoef2(c,s,Lo_R,Hi_R,3);
A333=appcoef2(c,s,'sym5');
A3333=appcoef2(c,s,Lo_R,Hi_R);


assert_checkalmostequal ( ca0 , A0 , %eps );
assert_checkalmostequal ( ca0 , A00 , %eps );
assert_checkalmostequal ( ca1 , A1 , %eps );
assert_checkalmostequal ( ca1 , A11 , %eps );
assert_checkalmostequal ( ca2 , A2 , %eps );
assert_checkalmostequal ( ca2 , A22 , %eps );
assert_checkalmostequal ( ca3 , A3 , %eps );
assert_checkalmostequal ( ca3 , A33 , %eps );
assert_checkalmostequal ( ca3 , A333 , %eps );


clear ca1;
clear ca2;
clear ca3;
clear A1;
clear A11;
clear A2;
clear A22;
clear A3;
clear A33;
clear A333;
clear A0;
clear A00;
clear ca0;
clear c;
clear s;
clear Lo_R;
clear Hi_R;
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
if (version(1)<6) then
	stacksize(sz(1));
	clear sz;
end;
