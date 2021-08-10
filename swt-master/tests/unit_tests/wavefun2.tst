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


// wavefun2  Test
version = getversion("scilab");
if (version(1)<6) then
sz = stacksize();
stacksize(1e8);
end;

ITER=4;
// dwt
// type 1 input
// haar
accuracy1 = 1e-10;
accuracy2 = 1e-10;

[S,W1,W2,W3,XYVAL]=wavefun2('haar',ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );

//db family
accuracy1 = 1e-10;
accuracy2 = 1e-10;
db_fam=["db1","db2", "db3", "db4", "db5", "db6","db7", "db8", "db9", "db10", "db11",...
"db12", "db13", "db14", "db15", "db16","db17", "db18", "db19", "db20", "db21", "db22",...
 "db23", "db24", "db25", "db26", "db27", "db28", "db29", "db30", "db31", "db32", "db33",..
 "db34", "db35", "db36"];
// db1
for i=1:max(size(db_fam))
  [S,W1,W2,W3,XYVAL]=wavefun2(db_fam(i),ITER);
    assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
    assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W1) , 0 , %eps,accuracy2 );
    assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
    assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );
end;

//coif family
accuracy1 = 1e-10;
accuracy2 = 1e-10;
coif_fam=["coif1","coif2","coif3","coif4","coif5","coif6","coif7","coif8","coif9","coif10","coif11",...
"coif12","coif13","coif14","coif15","coif16","coif17"];

for i=1:max(size(coif_fam))

  [S,W1,W2,W3,XYVAL]=wavefun2(coif_fam(i),ITER);
    assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
    assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy1 );
    assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy1 );
    assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy1 );
end;

//symlets family
accuracy1 = 1e-8;
accuracy2 = 1e-8;
sym_fam=["sym2", "sym3", "sym4", "sym5", "sym6","sym7", "sym8", "sym9", "sym10", "sym11",...
"sym12", "sym13", "sym14", "sym15", "sym16","sym17", "sym18", "sym19", "sym20"];

for i=1:max(size(sym_fam))
  [S,W1,W2,W3,XYVAL]=wavefun2(sym_fam(i),ITER);
    assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
    assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy1 );
    assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy1 );
    assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
    assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy1 );
end;




//beylkin
accuracy1 = 1e-8;
accuracy2 = 1e-5;
  [S,W1,W2,W3,XYVAL]=wavefun2("beylkin",ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );

accuracy1 = 1e-6;
accuracy2 = 1e-5;
  //vaidyanathan
    [S,W1,W2,W3,XYVAL]=wavefun2("vaidyanathan",ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
// assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
// assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
// assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );
  //dmey
    [S,W1,W2,W3,XYVAL]=wavefun2("dmey",ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, 1e-1 );
 assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, 1e-1  );
// assert_checkalmostequal ( sum(W1) , 0 , %eps, 1e-1 );
 assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, 1e-1  );
// assert_checkalmostequal ( sum(W2) , 0 , %eps, 1e-1 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, 1e-1  );
// assert_checkalmostequal ( sum(W3) , 0 , %eps, 1e-1 );
  //bath
  accuracy1 = 1e-2;
  accuracy2 = 1e-1;
  bath_fam=["bath4.0", "bath4.1", "bath4.2", "bath4.3", "bath4.4", "bath4.5",...
"bath4.6", "bath4.7", "bath4.8", "bath4.9", "bath4.10", ...
"bath4.11", "bath4.12", "bath4.13", "bath4.14", "bath4.15", ...
"bath6.0", "bath6.1", "bath6.2", "bath6.3", "bath6.4", ...
"bath6.5", "bath6.6", "bath6.7", "bath6.8", "bath6.9", ...
"bath6.10", "bath6.11", "bath6.12", "bath6.13", "bath6.14", ...
"bath6.15"];
for i=1:max(size(bath_fam))

  [S,W1,W2,W3,XYVAL]=wavefun2(bath_fam(i),ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1);
assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps,accuracy1 );
assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps,accuracy1 );
assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );
end;
  //legd
  accuracy1 = 1e-8;
  accuracy2 = 1e-5;
legd_fam=["legd1", "legd2", "legd3", "legd4", "legd5", "legd6", "legd7", "legd8", "legd9"];

for i=1:max(size(legd_fam))

  [S,W1,W2,W3,XYVAL]=wavefun2(legd_fam(i),ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy2 );
//assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, 1e-4  );
assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
//assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, 1e-4  );
assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
//assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, 1e-4  );
assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );
end;

  //fa
  accuracy1 = 1e-8;
  accuracy2 = 1e-5;
  [S,W1,W2,W3,XYVAL]=wavefun2("fa1",ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );
   [S,W1,W2,W3,XYVAL]=wavefun2("fa2",ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );
  //  ksq
  accuracy1 = 1e-7;
  accuracy2 = 1e-5;
    [S,W1,W2,W3,XYVAL]=wavefun2("ksq1",ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );

      [S,W1,W2,W3,XYVAL]=wavefun2("ksq2",ITER);
assert_checkalmostequal ( sum(S)/(2^ITER)^2 , 1 , %eps, accuracy1 );
assert_checkalmostequal ( sum(W1.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W1) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W2.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W2) , 0 , %eps, accuracy2 );
assert_checkalmostequal ( sum(W3.^2)/(2^ITER)^2 , 1 , %eps, accuracy1  );
assert_checkalmostequal ( sum(W3) , 0 , %eps, accuracy2 );

if (version(1)<6) then
stacksize(sz(1));
clear sz;
end;
