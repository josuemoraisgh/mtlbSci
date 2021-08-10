function A=appcoef2(c,s,wname,[N])
// 2-D approximation coefficients extraction
// Calling Sequence
// A=appcoef2(C,S,wname,[N])
// A=appcoef2(C,S,Lo_R,Hi_R,[N])
// Parameters
// wname  : wavelet name, haar( "haar"), daubechies ("db1" to "db36"), coiflets ("coif1" to "coif17"), symlets ("sym2" to "sym20"), legendre ("leg1" to "leg9"), bathlets("bath4.0" to "bath4.15" and "bath6.0" to "bath6.15"), dmey ("dmey"), beyklin ("beylkin"), vaidyanathan ("vaidyanathan"), biorthogonal B-spline wavelets ("bior1.1" to "bior6.8"), "rbior1.1" to "rbior6.8"
// A : extracted approximation coefficients
// Lo_R : lowpass synthesis filter
// Hi_R : highpass syntheis filter
// C : coefficent array
// S : size array
// N : restruction level with N<=length(L)-2
// Description
// appcoef2 can be used for extraction or reconstruction of approximation coeffient 
// at  level N  after a multiple level decompostion. Extension mode is stored as a global variable and 
// could be changed with dwtmode. If N is omitted, the maximum level (length(L)-2) is used.
// 
// The length of A depends on the level N.
// 
// C and L can be generated using wavedec2.
// Examples
// load(get_swt_path()+"demos/image/woman.dat");
// [C,S]=wavedec2(X,3,'db2');
// A1=appcoef2(C,S,'db2',1);
// A2=appcoef2(C,S,'db2',2);
// A3=appcoef2(C,S,'db2',3);
// scf();clf();
// f=gcf();f.color_map=graycolormap(256);
// subplot(221)
// Matplot(X);
// a=gca();a.tight_limits="on";
// title("original");
// subplot(222)
// Matplot(A1);
// a=gca();a.tight_limits="on";
// title("approximation level 1");
// subplot(223)
// Matplot(A2);
// a=gca();a.tight_limits="on";
// title("approximation level 2");
// subplot(224)
// Matplot(A3);
// a=gca();a.tight_limits="on";
// title("approximation level 3");
// 
//  
// 
// Authors
// Roger Liu and Isaac Zhi
// Copyright (C) 2010-2015 - Holger Nahrstaedt
// See Also
// wavedec2
// waverec2
// detcoef2
