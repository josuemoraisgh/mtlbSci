mode(7)
//     generate sine wave
x=[1:100];
a=sin(2*%pi*x/100);
//     perform one dimensional discrete stationary wavelet transform
[SWA,SWD]=swt(a,2,'db3');
//     reconstruct the original signal
a0=iswt(SWA,SWD,'db3');
//     calculate the error
sum(abs(a-a0))
//     generate random matrix
X=rand(64,64);
//     decomposition
[A,H,V,D]=swt2(X,3,'db2');
//     reconstruction
X0=iswt2(A,H,V,D,'db2');
//     calculate the error
sum(abs(X-X0))
