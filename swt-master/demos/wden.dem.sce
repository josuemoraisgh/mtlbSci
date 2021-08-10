//wavedec demo
mode(-1);
lines(0);

my_handle = scf(100001);
clf(my_handle,"reset");
demo_viewCode("wden.dem.sce");

// DEMO START

my_plot_desc          = "wden";
my_handle.figure_name = my_plot_desc;

// init rand and set snr
snr = 3; init = 2055615866; 

// generate test signal 
[xref,x] = wnoise(3,11,snr,init);

// de-noise test signal
level = 5;
xd = wden(x,'heursure','s','one',level,'sym8');

// Plot signals. 
subplot(611), plot(xref); 
a=gca();a.data_bounds=[1 2048 -10 10];
title('Original signal'); 
subplot(612), plot(x), a=gca();a.data_bounds=[1 2048 -10 10];
title(['Noisy signal - Signal to noise ratio = ',... 
string(fix(snr))]); 
subplot(613), plot(xd), a=gca();a.data_bounds=[1 2048 -10 10];
title('De-noised signal - heuristic SURE'); 

// de-noise test signal
xd = wden(x,'heursure','s','one',level,'sym8');

// Plot signal. 
subplot(614), plot(xd), a=gca();a.data_bounds=[1 2048 -10 10];
title('De-noised signal - SURE');

// de-noise test signal
xd = wden(x,'sqtwolog','s','sln',level,'sym8');

// Plot signal. 
subplot(615), plot(xd), a=gca();a.data_bounds=[1 2048 -10 10];
title('De-noised signal - Fixed form threshold');

// de-noise test signal
xd = wden(x,'minimaxi','s','sln',level,'sym8');

// Plot signal. 
subplot(616), plot(xd), a=gca();a.data_bounds=[1 2048 -10 10];
title('De-noised signal - Minimax');



