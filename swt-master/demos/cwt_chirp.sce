mode(1);lines(0);clc; figure(); clf;
//        generate chirp

n = 256;
t   = 1024*(1:n)/n;
sig = sin(2*%pi*t/30 ./(1+t/1000)); 

wav = cwt((sig), 1:60,'morl'); 

cwtplot(wav,1:60);