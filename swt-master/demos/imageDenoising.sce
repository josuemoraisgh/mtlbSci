mode(7)
//    Please ensure SIVP is installed and load SIVP first
//    load an image
demopath = pathconvert(get_swt_path()+"demos/");
im=imread(demopath+'/image/woman.bmp');
//    Display the image
imshow(im);
//    Convert the color to gray
G=rgb2gray(im);
//    Display the image
imshow(G);
// Generate noisy image.
x = double(G) + 15*rand(double(X),'norm');
imshow(uint8(x))
// Find default values. In this case fixed form threshold
// is used with estimation of level noise, thresholding
// mode is soft and the approximation coefficients are 
// kept.
[thr,sorh,keepapp] = ddencmp('den','wv',x);

// thr is equal to estimated_sigma*sqrt(log(prod(size(X))))

// De-noise image using global thresholding option.
xd = wdencmp('gbl',x,'sym4',2,thr,sorh,keepapp);
// Plots.
imshow(uint8(xd));
