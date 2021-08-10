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
// Convolution

a=rand(1,100,'normal');
b=rand(1,51,'uniform');
c=conv(a,b);
c1=conv(a',b)';
c2=conv(a,b');
c3=conv(a',b')';

expected=convol(a,b);

assert_checkalmostequal ( c , expected , %eps*1000 );
assert_checkalmostequal ( c1 , expected , %eps*1000 );
assert_checkalmostequal ( c2 , expected , %eps*1000 );
assert_checkalmostequal ( c3 , expected , %eps*1000 );
