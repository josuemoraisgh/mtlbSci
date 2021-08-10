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
// biorfilt

function [Rf,Df] = ref_biorwavf(Nr,Nd)


if isempty(find(Nr == [1:5 6], 1))
    error("Nr 1 - 6");
end
select Nr
  case 1
      if ~or(Nd == (1:2:5))
          error("Nd 1,3,5");
      end
  case 2
      if ~or(Nd == (2:2:8))
          error("Nd 2,4,6,8");
      end
  case 3
      if ~or(Nd == (1:2:9))
           error("Nd 1,3,5,7,9");
      end
  case 4 , if Nd ~= 4 , error("Nd 4"); end
  case 5 , if Nd ~= 5 , error("Nd 5"); end
  case 6 , if Nd ~= 8 , error("Nd 8"); end
end

select Nr
  case 1
    Rf = 1/2;
    if Nd == 1
       Df = 1/2;
    elseif Nd == 3
       Df = [-1/16 1/16 1/2];
    elseif Nd == 5
       Df = [3/256 -3/256 -11/128 11/128 1/2];
    end
    Rf = [Rf Rf(:,$:-1:1)];
    Df = [Df Df(:,$:-1:1)];

  case 2
    Rf = [1/4 1/2 1/4];
    if Nd == 2
       Df = [-1/8 1/4];
       Df = [Df 3/4 Df(:,$:-1:1)];
    elseif Nd == 4
       Df = [3/128 -3/64 -1/8 19/64];
       Df = [Df 45/64 Df(:,$:-1:1)];
    elseif Nd == 6
       Df = [-5/1024 5/512 17/512 -39/512 -123/1024 81/256];
       Df = [Df 175/256 Df(:,$:-1:1)];
    elseif Nd == 8
       Df = [35 -70 -300 670 1228 -3126 -3796 10718];
       Df = [Df 22050 Df(:,$:-1:1)]/(2^15);
    end

  case 3
    Rf = [1 3]/8;
    if Nd == 1
       Df = [-1 3]/4;
    elseif Nd == 3
       Df = [3 -9 -7 45]/64;
    elseif Nd == 5
       Df = [-5 15 19 -97 -26 350]/512;
    elseif Nd == 7
       Df = [35 -105 -195 865 363 -3489 -307 11025]/(2^14);
    elseif Nd == 9
       Df = [-63 189 469 -1911 -1308 9188 1140 -29676 190 87318]/(2^17);
    end
    Rf = [Rf Rf(:,$:-1:1)];
    Df = [Df Df(:,$:-1:1)];

  case 4
    if Nd == 4
       Rf = [-.045635881557,-.028771763114,.295635881557];
       Rf = [Rf .557543526229 Rf(:,$:-1:1)];
       Df = [.026748757411,-.016864118443,-.078223266529,.266864118443];
       Df = [Df .602949018236 Df(:,$:-1:1)];
    end

  case 5
    if Nd == 5
       Rf = [.009515330511,-.001905629356,-.096666153049,...
                                 -.066117805605,.337150822538];
       Rf = [Rf .636046869922 Rf(:,$:-1:1)];
       Df = [.028063009296,.005620161515,-.038511714155,.244379838485];
       Df = [Df .520897409718 Df(:,$:-1:1)];
    end

  case 6
    if Nd == 8
       Rf = [...
           -0.01020092218704  ...
           -0.01023007081937  0.05566486077996  0.02854447171515  -0.29546393859292 ...
                 ];
       Rf = [Rf -0.53662880179157 Rf(:,$:-1:1)];
       Df = [...
            0.00134974786501 -0.00135360470301 -0.01201419666708   0.00843901203981 ...
            0.03516647330654 -0.05463331368252 -0.06650990062484   0.29754790634571 ...
                 ];
       Df = [Df 0.58401575224075 Df(:,$:-1:1)];
//         Df = -Df;
    end
end
endfunction

// sym1
// w = dbaux(1);
// w2=dbwavf("db1");
// w2=w2/sum(w2);
// assert_checkalmostequal ( w , w2 , %eps, %eps );

// sym2

// bior1.1
//
[Rf,Df] = ref_biorwavf(1,1);
[Rf2,Df2] = biorwavf("bior1.1");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior1.3
//
[Rf,Df] = ref_biorwavf(1,3);
[Rf2,Df2] = biorwavf("bior1.3");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior1.5
//
[Rf,Df] = ref_biorwavf(1,5);
[Rf2,Df2] = biorwavf("bior1.5");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior2.2
//
[Rf,Df] = ref_biorwavf(2,2);
[Rf2,Df2] = biorwavf("bior2.2");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior2.4
//
[Rf,Df] = ref_biorwavf(2,4);
[Rf2,Df2] = biorwavf("bior2.4");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior2.6
//
[Rf,Df] = ref_biorwavf(2,6);
[Rf2,Df2] = biorwavf("bior2.6");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior2.8
//
[Rf,Df] = ref_biorwavf(2,8);
[Rf2,Df2] = biorwavf("bior2.8");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior3.1
//
[Rf,Df] = ref_biorwavf(3,1);
[Rf2,Df2] = biorwavf("bior3.1");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior3.3
//
[Rf,Df] = ref_biorwavf(3,3);
[Rf2,Df2] = biorwavf("bior3.3");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior3.5
//
[Rf,Df] = ref_biorwavf(3,5);
[Rf2,Df2] = biorwavf("bior3.5");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior3.7
//
[Rf,Df] = ref_biorwavf(3,7);
[Rf2,Df2] = biorwavf("bior3.7");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
//
// bior3.9
//
[Rf,Df] = ref_biorwavf(3,9);
[Rf2,Df2] = biorwavf("bior3.9");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior4.4
//
[Rf,Df] = ref_biorwavf(4,4);
[Rf2,Df2] = biorwavf("bior4.4");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps*10000 );
assert_checkalmostequal ( Df2 , Df , %eps, %eps*10000 );
// bior5.5
//
[Rf,Df] = ref_biorwavf(5,5);
[Rf2,Df2] = biorwavf("bior5.5");
Rf2=Rf2*(1/sqrt(2));
Rf2=Rf2(find(Rf2~=0));
Df2=Df2*(1/sqrt(2));
Df2=Df2(find(Df2~=0));

assert_checkalmostequal ( Rf2 , Rf , %eps, %eps );
assert_checkalmostequal ( Df2 , Df , %eps, %eps );
// bior6.8
//[Rf,Df] = ref_biorwavf(6,8);
//[Rf2,Df2] = biorwavf("bior6.8");
//Rf2=Rf2*(1/sqrt(2));
//Rf2=Rf2(find(Rf2~=0));
//Df2=Df2*(1/sqrt(2));
//Df2=Df2(find(Df2~=0));

//assert_checkalmostequal ( Rf2 , -Rf , %eps, %eps*100 );
//assert_checkalmostequal ( Df2 , Df , %eps, %eps*100 );
