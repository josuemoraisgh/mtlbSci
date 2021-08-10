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

// detcoef2
a=rand(500,501,'normal');

[c,s]=wavedec2(a,3,'sym5');
[cA1,cH1,cV1,cD1]=dwt2(a,'sym5');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym5');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym5');
ch1=detcoef2('h',c,s,1);
ch2=detcoef2('h',c,s,2);
ch3=detcoef2('h',c,s,3);
cv1=detcoef2('v',c,s,1);
cv2=detcoef2('v',c,s,2);
cv3=detcoef2('v',c,s,3);
cd1=detcoef2('d',c,s,1);
cd2=detcoef2('d',c,s,2);
cd3=detcoef2('d',c,s,3);
[h1,v1,d1]=detcoef2('all',c,s,1);
[h2,v2,d2]=detcoef2('all',c,s,2);
[h3,v3,d3]=detcoef2('all',c,s,3);


assert_checkalmostequal ( h1 , cH1 , %eps );
assert_checkalmostequal ( ch1 , cH1 , %eps );
assert_checkalmostequal ( h2 , cH2 , %eps );
assert_checkalmostequal ( ch2 , cH2 , %eps );
assert_checkalmostequal ( h3 , cH3 , %eps );
assert_checkalmostequal ( ch3 , cH3 , %eps );
assert_checkalmostequal ( v1 , cV1 , %eps );
assert_checkalmostequal ( cv1 , cV1 , %eps );
assert_checkalmostequal ( v2 , cV2 , %eps );
assert_checkalmostequal ( cv2 , cV2 , %eps );
assert_checkalmostequal ( v3 , cV3 , %eps );
assert_checkalmostequal ( cv3 , cV3 , %eps );
assert_checkalmostequal ( d1 , cD1 , %eps );
assert_checkalmostequal ( cd1 , cD1 , %eps );
assert_checkalmostequal ( d2 , cD2 , %eps );
assert_checkalmostequal ( cd2 , cD2 , %eps );
assert_checkalmostequal ( d3 , cD3 , %eps );
assert_checkalmostequal ( cd3 , cD3 , %eps );


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
clear cd1;
clear cd2;
clear cd3;
clear ch1;
clear ch2;
clear ch3;
clear cv1;
clear cv2;
clear cv3;
clear d1;
clear d2;
clear d3;
clear v1;
clear v2;
clear v3;
clear h1;
clear h2;
clear h3;
clear c;
clear s;
