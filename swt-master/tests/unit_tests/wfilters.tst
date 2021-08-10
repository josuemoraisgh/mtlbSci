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


// wfilter  Test

[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('haar');
w=dbwavf('db1');
[lo_d,hi_d,lo_r,hi_r]=orthfilt(w);
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );

[Lo_D,Hi_D]=wfilters('haar','d');
[Lo_R,Hi_R]=wfilters('haar','r');
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );

[Lo_D,Lo_R]=wfilters('haar','l');
[Hi_D,Hi_R]=wfilters('haar','h');
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );

for N=1:36
wname="db"+sprintf("%d",N);
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters(wname);
w=dbwavf(wname);
[lo_d,hi_d,lo_r,hi_r]=orthfilt(w);
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );

[Lo_D,Hi_D]=wfilters(wname,'d');
[Lo_R,Hi_R]=wfilters(wname,'r');
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );

[Lo_D,Lo_R]=wfilters(wname,'l');
[Hi_D,Hi_R]=wfilters(wname,'h');
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );
end;

bior_fam=["bior1.1","bior1.3", "bior1.5", "bior2.2", "bior2.4", "bior2.6",...
"bior2.8", "bior3.1", "bior3.3", "bior3.5", "bior3.7",...
"bior3.9", "bior4.4", "bior5.5", "bior6.8"];
// bior1.1
for N=1:max(size(bior_fam))
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters(bior_fam(N));
[rf,df]=biorwavf(bior_fam(N));
[lo_d,hi_d,lo_r,hi_r]=biorfilt(df,rf);
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );

[Lo_D,Hi_D]=wfilters(bior_fam(N),'d');
[Lo_R,Hi_R]=wfilters(bior_fam(N),'r');
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );

[Lo_D,Lo_R]=wfilters(bior_fam(N),'l');
[Hi_D,Hi_R]=wfilters(bior_fam(N),'h');
assert_checkalmostequal ( lo_d , Lo_D , %eps );
assert_checkalmostequal ( lo_r , Lo_R , %eps );
assert_checkalmostequal ( hi_d , Hi_D , %eps );
assert_checkalmostequal ( hi_r , Hi_R , %eps );
end;


clear Lo_D;
clear Lo_R;
clear Hi_R;
clear Hi_D;
clear lo_d;
clear lo_r;
clear hi_r;
clear hi_d;
