mode(7)
// cowt1d
// generate random signal
x=rand(1,256);
// generate first stage filters
[Faf,Fsf]=FSfarras('f');
// generate second stage filters
[af,sf]=dualfilt1('f');
// decomposition
[c,l]=dualtree(x,3,Faf,af);
// reconstruction
x0 = idualtree(c,l,Fsf,sf);
// calculate the error
sum(abs(x-x0))