//scale2freq demo
mode(-1);
lines(0);

my_handle = scf(100001);
clf(my_handle,"reset");
demo_viewCode("scale2freq.dem.sce");

// DEMO START

my_plot_desc          = "scale2freq";
my_handle.figure_name = my_plot_desc;

// Set sampling period and wavelet name.
delta = 0.1; wname = 'coif3';
// Set scales.
amax = 5;
a = 2 .^[1:amax];
// Compute associated pseudo-frequencies.
f = scal2frq(a,wname,delta);
// Compute associated pseudo-periods.
per = 1 ./f;
// Plot pseudo-periods versus scales.
subplot(211), plot(a,per)
title(['Wavelet: ',wname, ', Sampling period: ',string(delta)])
xlabel('Scale')
ylabel('Computed pseudo-period')
// For each scale 2^i:
// - generate a sine function of period per(i);
// - perform a wavelet decomposition;
// - identify the highest energy level;
// - compute the detected pseudo-period.
for i = 1:5
// Generate sine function of period
// per(i) at sampling period delta.

t = 0:delta:100;
x = sin((t.*2*%pi)/per(i));
// Decompose x at level 9.
[c,l] = wavedec(x,5,wname);
// Estimate standard deviation of detail coefficients.
stdc = wnoisest(c,l,[1:amax]);
// Compute identified period.
[y,jmax] = max(stdc);
idper(i) = per(jmax);
end
// Compare the detected and computed pseudo-periods.
subplot(212), plot(per,idper,'o',per,per)
title('Detected vs computed pseudo-period')
xlabel('Computed pseudo-period')
ylabel('Detected pseudo-period')