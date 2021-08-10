//dwtmode demo
mode(-1);
lines(0);

my_handle = scf(100001);
clf(my_handle,"reset");
demo_viewCode("dwtmode.dem.sce");

// DEMO START

my_plot_desc          = "dwtmode";
my_handle.figure_name = my_plot_desc;

// init rand and set snr
snr = 3; init = 2055615866; 
// init rand and get filters.
//x = [sin(0.3*[1:451]), sin(0.3*[452:500])+0.1, sin(0.3*[501:1000]);];
 x=[zeros(1,200),20*ones(1,200)];
w = 'db2';

subplot(311), plot(1:length(x),x), title('Original signal')

disp("plotting wavelet coeffients using Zero Padding mode (subplot 2)");

dwtmode('zpd');
[C,L]=wavedec(x,5,w);
subplot(312)
wavedecplot(C,L,%f,my_handle);
xtitle('dwtmode: Zero Padding mode');

disp("plotting wavelet coeffients using order 1 smooth padding (subplot 3)");

dwtmode('spd');
[C,L]=wavedec(x,5,w);
// Reconstruction.
subplot(313)
wavedecplot(C,L,%f,my_handle);
xtitle('dwtmode: order 1 smooth padding');
dwtmode('sym');