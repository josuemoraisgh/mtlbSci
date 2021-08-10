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
// wrev2 test

a=rand(1,500,'normal');
b=wrev2([a;a],1);
b1=wrev2([a',a'],2);
ind=[1:500];
ind1=[500:-1:1];
I=eye(500,500);
II=zeros(500,500);
II(ind,:)=I(ind1,:);
expected=[a*II;a*II];


assert_checkalmostequal ( b , expected , %eps );
assert_checkalmostequal ( b1' , expected, %eps );
