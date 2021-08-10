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
// wmaxlev


l1=wmaxlev(50,'db4');
l2=wmaxlev(65,'db4');
l3=wmaxlev([50 65],'db4');
l4=wmaxlev([65 50],'db4');
l5=wmaxlev([50 65]','db4');
l6=wmaxlev([65 50]','db4');
l=min(l1,l2);

assert_checkalmostequal ( l3 , l , %eps );
assert_checkalmostequal ( l4 , l , %eps );
assert_checkalmostequal ( l5 , l , %eps );
assert_checkalmostequal ( l6 , l , %eps );
