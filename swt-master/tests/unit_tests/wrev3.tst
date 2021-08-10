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
// wrev test

aa=rand(1,500,'normal');
a=zeros(2,2,500);
a(1,1,:)=aa;
a(1,2,:)=aa;
a(2,1,:)=aa;
a(2,2,:)=aa;
b=wrev3(a,3);
//b1=wrev2([a',a'],2);
ind=[1:500];
ind1=[500:-1:1];
I=eye(500,500);
II=zeros(500,500);
II(ind,:)=I(ind1,:);
expected=zeros(2,2,500);
expected(1,1,:)=aa*II;
expected(1,2,:)=aa*II;
expected(2,1,:)=aa*II;
expected(2,2,:)=aa*II;


assert_checkalmostequal ( b , expected , %eps );
//assert_checkalmostequal ( b1' , expected , %eps );
