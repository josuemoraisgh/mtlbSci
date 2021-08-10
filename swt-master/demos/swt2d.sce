mode(7)
//        generate random matrix
a=rand(256,256);
//        perform one level decomposition
[cA,cH,cV,cD]=dwt2(a,'sym9');
//        reconstruction
a0=idwt2(cA,cH,cV,cD,'sym9',size(a));
//        calculate the eror
sum(abs(a-a0))
//        multiple level decomposition
[C,S]=wavedec2(a,3,'db4');
//        reconstruction
a0=waverec2(C,S,'db4');
//        calculate the error
sum(abs(a-a0))
