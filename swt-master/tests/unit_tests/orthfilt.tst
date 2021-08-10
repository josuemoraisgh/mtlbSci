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
// orthfilt


a=rand(1,50,'normal');
lo_r=a;
lo_d=wrev(lo_r);
hi_r=qmf(lo_r);
hi_d=wrev(hi_r);
[Lo_D,Hi_D,Lo_R,Hi_R]=orthfilt(a);

assert_checkalmostequal ( Hi_R , hi_r , %eps );
assert_checkalmostequal ( Lo_D , lo_d , %eps );
assert_checkalmostequal ( Hi_D , hi_d , %eps );
assert_checkalmostequal ( Lo_R , lo_r , %eps );
