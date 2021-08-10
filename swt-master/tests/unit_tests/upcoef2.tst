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


// dwt2d  Test

// upcoef2
a=rand(64,64,'normal');
[Lo_R,Hi_R]=wfilters('db3','r');
ya1=upcoef2('a',a,'db3');
ya11=upcoef2('a',a,Lo_R,Hi_R);
ya111=upcoef2('a',a,'db3',1);
ya1111=upcoef2('a',a,Lo_R,Hi_R,1);
yas1=upcoef2('a',a,'db3',1,[100,100]);
yas11=upcoef2('a',a,Lo_R,Hi_R,1,[100, 100]);
ya2=upcoef2('a',a,'db3',2);
ya22=upcoef2('a',a,Lo_R,Hi_R,2);
yas2=upcoef2('a',a,'db3',2,[100 100]);
yas22=upcoef2('a',a,Lo_R,Hi_R,2,[100 100]);
x1=idwt2(a,[],[],[],'db3');
xs1=idwt2(a,[],[],[],'db3',[100 100]);
x2=idwt2(x1,[],[],[],'db3');
xs2=idwt2(x1,[],[],[],'db3',[100 100]);

assert_checkalmostequal ( x1 , ya1(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , ya11(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , ya111(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , ya1111(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x2 , ya2(13:$-12,13:$-12) , %eps );
assert_checkalmostequal ( x2 , ya22(13:$-12,13:$-12) , %eps );
assert_checkalmostequal ( xs1 , yas1 , %eps );
assert_checkalmostequal ( xs1 , yas11 , %eps );
assert_checkalmostequal ( xs2 , yas2 , %eps );
assert_checkalmostequal ( xs2 , yas22 , %eps );



// h

yh1=upcoef2('h',a,'db3');
yh11=upcoef2('h',a,Lo_R,Hi_R);
yh111=upcoef2('h',a,'db3',1);
yh1111=upcoef2('h',a,Lo_R,Hi_R,1);
yhs1=upcoef2('h',a,'db3',1,[100,100]);
yhs11=upcoef2('h',a,Lo_R,Hi_R,1,[100, 100]);
yh2=upcoef2('h',a,'db3',2);
yh22=upcoef2('h',a,Lo_R,Hi_R,2);
yhs2=upcoef2('h',a,'db3',2,[100 100]);
yhs22=upcoef2('h',a,Lo_R,Hi_R,2,[100 100]);
x1=idwt2([],a,[],[],'db3');
xs1=idwt2([],a,[],[],'db3',[100 100]);
x2=idwt2(x1,[],[],[],'db3');
xs2=idwt2(x1,[],[],[],'db3',[100 100]);

assert_checkalmostequal ( x1 , yh1(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yh11(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yh111(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yh1111(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x2 , yh2(13:$-12,13:$-12) , %eps );
assert_checkalmostequal ( x2 , yh22(13:$-12,13:$-12) , %eps );
assert_checkalmostequal ( xs1 , yhs1 , %eps );
assert_checkalmostequal ( xs1 , yhs11 , %eps );
assert_checkalmostequal ( xs2 , yhs2 , %eps );
assert_checkalmostequal ( xs2 , yhs22 , %eps );


// v
yv1=upcoef2('v',a,'db3');
yv11=upcoef2('v',a,Lo_R,Hi_R);
yv111=upcoef2('v',a,'db3',1);
yv1111=upcoef2('v',a,Lo_R,Hi_R,1);
yvs1=upcoef2('v',a,'db3',1,[100,100]);
yvs11=upcoef2('v',a,Lo_R,Hi_R,1,[100, 100]);
yv2=upcoef2('v',a,'db3',2);
yv22=upcoef2('v',a,Lo_R,Hi_R,2);
yvs2=upcoef2('v',a,'db3',2,[100 100]);
yvs22=upcoef2('v',a,Lo_R,Hi_R,2,[100 100]);
x1=idwt2([],[],a,[],'db3');
xs1=idwt2([],[],a,[],'db3',[100 100]);
x2=idwt2(x1,[],[],[],'db3');
xs2=idwt2(x1,[],[],[],'db3',[100 100]);

assert_checkalmostequal ( x1 , yv1(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yv11(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yv111(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yv1111(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x2 , yv2(13:$-12,13:$-12) , %eps );
assert_checkalmostequal ( x2 , yv22(13:$-12,13:$-12) , %eps );
assert_checkalmostequal ( xs1 , yvs1 , %eps );
assert_checkalmostequal ( xs1 , yvs11 , %eps );
assert_checkalmostequal ( xs2 , yvs2 , %eps );
assert_checkalmostequal ( xs2 , yvs22 , %eps );



// d
yd1=upcoef2('d',a,'db3');
yd11=upcoef2('d',a,Lo_R,Hi_R);
yd111=upcoef2('d',a,'db3',1);
yd1111=upcoef2('d',a,Lo_R,Hi_R,1);
yds1=upcoef2('d',a,'db3',1,[100,100]);
yds11=upcoef2('d',a,Lo_R,Hi_R,1,[100, 100]);
yd2=upcoef2('d',a,'db3',2);
yd22=upcoef2('d',a,Lo_R,Hi_R,2);
yds2=upcoef2('d',a,'db3',2,[100 100]);
yds22=upcoef2('d',a,Lo_R,Hi_R,2,[100 100]);
x1=idwt2([],[],[],a,'db3');
xs1=idwt2([],[],[],a,'db3',[100 100]);
x2=idwt2(x1,[],[],[],'db3');
xs2=idwt2(x1,[],[],[],'db3',[100 100]);

assert_checkalmostequal ( x1 , yd1(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yd11(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yd111(5:$-4,5:$-4) , %eps );
assert_checkalmostequal ( x1 , yd1111(5:$-4,5:$-4), %eps );
assert_checkalmostequal ( x2 , yd2(13:$-12,13:$-12) , %eps );
assert_checkalmostequal ( x2 , yd22(13:$-12,13:$-12) , %eps );
assert_checkalmostequal ( xs1 , yds1 , %eps );
assert_checkalmostequal ( xs1 , yds11 , %eps );
assert_checkalmostequal ( xs2 , yds2 , %eps );
assert_checkalmostequal ( xs2 , yds22 , %eps );


clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear e9;
clear e10;
clear e;
clear a;
clear ya1;
clear ya11;
clear ya111;
clear ya1111;
clear ya2;
clear ya22;
clear x1;
clear xs1;
clear x2;
clear xs2;
clear Lo_R;
clear Hi_R;
clear yh1;
clear yh11;
clear yh111;
clear yh1111;
clear yh2;
clear yh22;
clear yv1;
clear yv11;
clear yv111;
clear yv1111;
clear yv2;
clear yv22;
clear yh1;
clear yd11;
clear yd111;
clear yd1111;
clear yd2;
clear yd22;
