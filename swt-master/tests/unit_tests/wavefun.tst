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


// wavefun  Test
ITER=12;
// dwt
// type 1 input
// haar

[phi,psi,xval]=wavefun('haar',ITER);
assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-10 );
assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-10  );
assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-10 );
// tmp=fft(psi);
// assert_checkalmostequal ( real(tmp(1)) , 0 , %eps);

//db family
//db1 - db36
for N=1:36
  wname="db"+sprintf("%d",N);

  [phi,psi,xval]=wavefun(wname,ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-10 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-10  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-10 );
  tmp=fft(psi);
  assert_checkalmostequal ( real(tmp(1)) , 0 , %eps,1e-10);

end;

//coif family
// coif1 - coif17
for N=1:17
  wname="coif"+sprintf("%d",N);
  [phi,psi,xval]=wavefun(wname,ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-10 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-10  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-10 );
  tmp=fft(psi);
  assert_checkalmostequal ( real(tmp(1)) , 0 , %eps,1e-10);
end;

//symlets family
// sym2 - sym20
for N=2:20
  wname="sym"+sprintf("%d",N);
  [phi,psi,xval]=wavefun(wname,ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-8 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-8  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-8	 );
end;

//bior family
bior_fam=["bior1.1","bior1.3", "bior1.5", "bior2.2", "bior2.4", "bior2.6",...
"bior2.8", "bior3.1", "bior3.3", "bior3.5", "bior3.7",...
"bior3.9", "bior4.4", "bior5.5", "bior6.8"];

for i=1:max(size(bior_fam))
[phi1,psi1,phi2,psi2,xval]=wavefun(bior_fam(i),ITER);
assert_checkalmostequal ( sum(phi1)/(2^ITER) , 1 , %eps, 1e-7 );
// assert_checkalmostequal ( sum(psi1.^2)/(2^ITER) , 1 , %eps, 1e-7  );
assert_checkalmostequal ( sum(psi1) , 0 , %eps, 1e-8 );
assert_checkalmostequal ( sum(phi2)/(2^ITER) , 1 , %eps, 1e-7 );
// assert_checkalmostequal ( sum(psi2.^2)/(2^ITER) , 1 , %eps, 1e-7  );
assert_checkalmostequal ( sum(psi2) , 0 , %eps, 1e-8 );
end

rbior_fam=["rbior1.1","rbior1.3", "rbior1.5", "rbior2.2", "rbior2.4", "rbior2.6",...
"rbior2.8", "rbior3.1", "rbior3.3", "rbior3.5", "rbior3.7",...
"rbior3.9", "rbior4.4", "rbior5.5", "rbior6.8"];

for i=1:max(size(rbior_fam))
[phi1,psi1,phi2,psi2,xval]=wavefun(rbior_fam(i),ITER);
assert_checkalmostequal ( sum(phi1)/(2^ITER) , 1 , %eps, 1e-7 );
// assert_checkalmostequal ( sum(psi1.^2)/(2^ITER) , 1 , %eps, 1e-7  );
assert_checkalmostequal ( sum(psi1) , 0 , %eps, 1e-8 );
assert_checkalmostequal ( sum(phi2)/(2^ITER) , 1 , %eps, 1e-7 );
// assert_checkalmostequal ( sum(psi2.^2)/(2^ITER) , 1 , %eps, 1e-7  );
assert_checkalmostequal ( sum(psi2) , 0 , %eps, 1e-8 );
end

//beylkin
  [phi,psi,xval]=wavefun("beylkin",ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-7 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-7  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-8);

  //vaidyanathan
    [phi,psi,xval]=wavefun("vaidyanathan",ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-7 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-7  );
  //assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-8);
  //dmey
    [phi,psi,xval]=wavefun("dmey",ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-7 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-1  );
  //assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-8);
  //bath
  bath_fam=["bath4.0", "bath4.1", "bath4.2", "bath4.3", "bath4.4", "bath4.5",...
"bath4.6", "bath4.7", "bath4.8", "bath4.9", "bath4.10", ...
"bath4.11", "bath4.12", "bath4.13", "bath4.14", "bath4.15", ...
"bath6.0", "bath6.1", "bath6.2", "bath6.3", "bath6.4", ...
"bath6.5", "bath6.6", "bath6.7", "bath6.8", "bath6.9", ...
"bath6.10", "bath6.11", "bath6.12", "bath6.13", "bath6.14", ...
"bath6.15"];
for i=1:max(size(bath_fam))

  [phi,psi,xval]=wavefun(bath_fam(i),ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-2);
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-2  );
//   assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-2);
end;
  //legd
legd_fam=["legd1", "legd2", "legd3", "legd4", "legd5", "legd6", "legd7", "legd8", "legd9"];

for i=1:max(size(legd_fam))

  [phi,psi,xval]=wavefun(legd_fam(i),ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-5 );
  //assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-5  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-5 );
end;

  //fa
  [phi,psi,xval]=wavefun("fa1",ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-7 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-7  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-8);
    [phi,psi,xval]=wavefun("fa2",ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-7 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-7  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-8);
  //  ksq
    [phi,psi,xval]=wavefun("ksq1",ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-5 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-5  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-4);
      [phi,psi,xval]=wavefun("ksq2",ITER);
  assert_checkalmostequal ( sum(phi)/(2^ITER) , 1 , %eps, 1e-5 );
  assert_checkalmostequal ( sum(psi.^2)/(2^ITER) , 1 , %eps, 1e-5  );
  assert_checkalmostequal ( sum(psi) , 0 , %eps, 1e-4);



  //cwt
  //sinus
  [psi,xval]=wavefun("sinus",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
  tmp=fft(psi);
  assert_checkalmostequal ( real(tmp(1)) , 0 , %eps,1e-12);
  //poisson
  [psi,xval]=wavefun("poisson",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//     tmp=fft(psi);
   assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-12);
// mexh
  [psi,xval]=wavefun("mexh",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//     tmp=fft(psi);
 assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-12);
// morl
  [psi,xval]=wavefun("morl",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//     tmp=fft(psi);
 assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-12);
// DOG
  [psi,xval]=wavefun("DOG",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//     tmp=fft(psi);
 assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-12);
// cmor
  [psi,xval]=wavefun("cmor",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//     tmp=fft(psi);
 assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-12);
// shan
  [psi,xval]=wavefun("shan",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//     tmp=fft(psi);
 assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-12);
// fbsp
  [psi,xval]=wavefun("fbsp",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//     tmp=fft(psi);
 assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-12);
// cauchy
  [psi,xval]=wavefun("cauchy",ITER);
  assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//     tmp=fft(psi);
 assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-12);

gaus_fam=["gaus1", "gaus2", "gaus3", "gaus4","gaus5","gaus6","gaus7", "gaus8"];
for i=1:max(size(gaus_fam))

  [psi,xval]=wavefun(gaus_fam(i),ITER);
   assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//      tmp=fft(psi);
 assert_checkalmostequal ( sum(diff(psi)) , 0 , %eps,1e-5);
end;

cgaus_fam=["cgau1", "cgau2", "cgau3", "cgau4","cgau5","cgau6","cgau7", "cgau8"];
for i=1:max(size(cgaus_fam))

  [psi,xval]=wavefun(cgaus_fam(i),ITER);
   assert_checkalmostequal ( max(size(psi))/(2^ITER) , 1 , %eps, %eps*10);
//      tmp=fft(psi);
 assert_checkalmostequal ( real(sum(diff(psi))) , 0 , %eps,1e-7);
end;
