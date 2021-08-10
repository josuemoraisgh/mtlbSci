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


// filter Test
// dwtmode


a='asymh';
dwtmode(a,'nodisp');
ST=dwtmode('status','nodisp');
b=(ST==a);
x=rand(1,50,'normal');
[cA,cD]=dwt(x,'db2');
[caa,cdd]=dwt(x,'db2','mode',a);
x0=idwt(cA,cD,'db2',length(x));

assert_checkalmostequal ( cA , caa , %eps );
assert_checkalmostequal ( cD , cdd , %eps );
assert_checkalmostequal ( x , x0 , %eps*1000 );

assert_checktrue(b);


a='sp1';
dwtmode(a,'nodisp');
ST=dwtmode('status','nodisp');
b=(ST==a);
x=rand(1,50,'normal');
[cA,cD]=dwt(x,'db2');
[caa,cdd]=dwt(x,'db2','mode',a);
x0=idwt(cA,cD,'db2',length(x));

assert_checkalmostequal ( cA , caa , %eps );
assert_checkalmostequal ( cD , cdd , %eps );
assert_checkalmostequal ( x , x0 , %eps*1000 );

assert_checktrue(b);


dwtmode("symh",'nodisp');
