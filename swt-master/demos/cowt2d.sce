mode(7)
// cowt2d
// generate random matrix
x=rand(256,256);
// generate first stage filters
[Faf,Fsf]=FSfarras('f');
// generate second stage filters
[af,sf]=dualfilt1('f');
// real dual tree composition
[c,s]=dualtree2D(x,3,Faf,af);
// reconstruction
x0=idualtree2D(c,s,Fsf,sf);
//calculate the error
sum(abs(x-x0))
// complex dual tree composition
// four matrix combined into 2 complex matrix
[c1,c2,s]=cplxdual2D(x,3,Faf,af);
// reconstruction
x0=icplxdual2D(c1,c2,s,Fsf,sf);
// calculate the error
sum(abs(x-x0))