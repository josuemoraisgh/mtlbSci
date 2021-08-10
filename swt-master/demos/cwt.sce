mode(1);lines(0);clc; figure(); clf;
//        generate sine wave
x=[1:512];
y=sin(2*%pi*x/64);
//        increase memory size
stacksize(10000000);
//        continous wavelet transform
coef=cwt(y,1:128,'DOG');
surf(coef);
halt("press enter to proceed");
cwtplot(coef,1:128);
//    Please ensure SIVP is installed and load SIVP first
halt("press enter to proceed");
//        pseduo color display, SIVP needed
//        colormap obtaining
cmap=jetcolormap(512);
//        matrix normalization
n=wcodemat(abs(coef),512);
//        encode matrix
w=ind2rgb(n,cmap);
//        display the matrix
imshow(w); 


