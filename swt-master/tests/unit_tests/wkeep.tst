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
// wkeep test

//disp("Vector Input, Even Length");

a=rand(1,50,'normal');
b=wkeep(a,27);
b1=wkeep(a,27,'c');
b2=wkeep(a,27,'l');
b3=wkeep(a,27,'r');
b4=wkeep(a',27);
b5=wkeep(a',27,'c');
b6=wkeep(a',27,'l');
b7=wkeep(a',27,'r');
b8=wkeep(a,27,2);
b9=wkeep(a',27,2);
c=a(12:38);
c1=a(1:27);
c2=a($-26:$);
c3=a(2:28);


assert_checkalmostequal ( b , b1 , %eps );
assert_checkalmostequal ( b1 , c , %eps );
assert_checkalmostequal ( b2 , c1 , %eps );
assert_checkalmostequal ( b3 , c2 , %eps );
assert_checkalmostequal ( b4 , b1' , %eps );
assert_checkalmostequal ( b5 , b1' , %eps );
assert_checkalmostequal ( b6 , b2' , %eps );
assert_checkalmostequal ( b7 , b3' , %eps );
assert_checkalmostequal ( b8 , c3 , %eps );
assert_checkalmostequal ( b9 , c3', %eps );


//disp("-->Vector Input, Odd Length<--");
a=rand(1,51,'normal');
b=wkeep(a,26);
b1=wkeep(a,26,'c');
b2=wkeep(a,26,'l');
b3=wkeep(a,26,'r');
b4=wkeep(a,26,2);
b5=wkeep(a',26);
b6=wkeep(a',26,'c');
b7=wkeep(a',26,'l');
b8=wkeep(a',26,'r');
b9=wkeep(a',26,2);
c=a(13:38);
c1=a(1:26);
c2=a($-25:$);
c3=a(2:27);

assert_checkalmostequal ( b , b1 , %eps );
assert_checkalmostequal ( b , c , %eps );
assert_checkalmostequal ( b2 , c1 , %eps );
assert_checkalmostequal ( b3 , c2 , %eps );
assert_checkalmostequal ( b4 , c3 , %eps );
assert_checkalmostequal ( b5 , b' , %eps );
assert_checkalmostequal ( b6 , b' , %eps );
assert_checkalmostequal ( b7 , b2' , %eps );
assert_checkalmostequal ( b8 , b3' , %eps );
assert_checkalmostequal ( b9 , c3', %eps );


//disp("-->Matrix Input<--");
a=rand(50,51,'normal');
b=wkeep(a,[27 26]);
b1=wkeep(a,[27 26]');
b2=wkeep(a,[27 26],[2 3]);
b3=wkeep(a,[27 26]',[2 3]);
b4=wkeep(a,[27 26],[2 3]');
b5=wkeep(a,[27 26]',[2 3]');
c=a(12:38,13:38);
c1=a(2:28,3:28);

assert_checkalmostequal ( b , c , %eps );
assert_checkalmostequal ( b1 , c , %eps );
assert_checkalmostequal ( b2 , c1 , %eps );
assert_checkalmostequal ( b3 , c1 , %eps );
assert_checkalmostequal ( b4 , c1 , %eps );
assert_checkalmostequal ( b5 , c1 , %eps );
