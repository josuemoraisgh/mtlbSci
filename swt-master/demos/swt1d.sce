mode(7)
//     generate sine wave
x=[1:100];
a=sin(2*%pi*x/100);
//     perform one dimensional discrete wavelet transform
[cA,cD]=dwt(a,'db3');
//     reconstruct the original signal
a0=idwt(cA,cD,'db3',length(a));
//     calculate the error
sum(abs(a-a0))
//     generate filter coefs
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.4');
//     one dimensional discrete wavelet transform
[cA,cD]=dwt(a,Lo_D,Hi_D);
//     reconstruct the original signal
a0=idwt(cA,cD,Lo_R,Hi_R,length(a));
//     calculate the error
sum(abs(a-a0))
//     multiple leve decomposition
[c,l]=wavedec(a,3,'db3');
//     multiple level reconstruction
a0=waverec(c,l,'db3');
//     calculate the error
sum(abs(a-a0))
