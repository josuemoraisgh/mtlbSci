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


// Utility Function Test
// dyadup test

//disp("-->Vector Input, Odd Length<--");
a=rand(1,51,'normal');
b=dyadup(a);
b1=dyadup(a,0);
b2=dyadup(a,1);
b3=dyadup(a');
b4=dyadup(a',0);
b5=dyadup(a',1);
ind=[1:51];
c=zeros(1,103);
c(2*ind)=a(ind);
c1=zeros(1,101);
c1(2*ind-1)=a(ind);


assert_checkalmostequal ( b , b2 , %eps );
assert_checkalmostequal ( b1 , c1 , %eps );
assert_checkalmostequal ( b2 , c , %eps );
assert_checkalmostequal ( b3 , b' , %eps );
assert_checkalmostequal ( b4 , b1' , %eps );
assert_checkalmostequal ( b5 , c' , %eps );



//disp("-->Vector Input, Even Length<--");
a=rand(1,50,'normal');
b=dyadup(a);
b1=dyadup(a,0);
b2=dyadup(a,1);
b3=dyadup(a');
b4=dyadup(a',0);
b5=dyadup(a',1);
ind=[1:50];
c=zeros(1,101);
c(2*ind)=a(ind);
c1=zeros(1,99);
c1(2*ind-1)=a(ind);

assert_checkalmostequal ( b , b2 , %eps );
assert_checkalmostequal ( b , c , %eps );
assert_checkalmostequal ( b1 , c1 , %eps );
assert_checkalmostequal ( b3 , c' , %eps );
assert_checkalmostequal ( b4 , c1' , %eps );
assert_checkalmostequal ( b5 , b3 , %eps );

//disp("-->Matrix Input<--");
a=rand(50,51,'normal');
b=dyadup(a);
b1=dyadup(a,0);
b2=dyadup(a,1);
b3=dyadup(a,'r');
b4=dyadup(a,'c');
b5=dyadup(a,'m');
b6=dyadup(a,0,'r');
b7=dyadup(a,0,'c');
b8=dyadup(a,0,'m');
b9=dyadup(a,1,'r');
b10=dyadup(a,1,'c');
b11=dyadup(a,1,'m');
ind=[1:50];
ind1=[1:51];
c=zeros(99,51);
c(2*ind-1,:)=a(ind,:);
c1=zeros(101,51);
c1(2*ind,:)=a(ind,:);
c2=zeros(50,101);
c2(:,2*ind1-1)=a(:,ind1);
c3=zeros(50,103);
c3(:,2*ind1)=a(:,ind1);
c4=zeros(99,101);
c4(2*ind-1,2*ind1-1)=a(ind,ind1);
c5=zeros(101,103);
c5(2*ind,2*ind1)=a(ind,ind1);


assert_checkalmostequal ( b , b10 , %eps );
assert_checkalmostequal ( b , c3 , %eps );
assert_checkalmostequal ( b1 , c2 , %eps );
assert_checkalmostequal ( b2 , b , %eps );
assert_checkalmostequal ( b3 , c1 , %eps );
assert_checkalmostequal ( b4 , b2 , %eps );
assert_checkalmostequal ( b5 , c5 , %eps );
assert_checkalmostequal ( b6 , c , %eps );
assert_checkalmostequal ( b7 , c2 , %eps );
assert_checkalmostequal ( b8 , c4 , %eps );
assert_checkalmostequal ( b9 , c1 , %eps );
assert_checkalmostequal ( b10 , c3 , %eps );
assert_checkalmostequal ( b11 , b5 , %eps );
