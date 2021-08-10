//diff cwt demo
mode(-1);
lines(0);

my_handle = scf(100001);
clf(my_handle,"reset");
demo_viewCode("diff_cwt.dem.sce");

// DEMO START

my_plot_desc          = "Differentiation of Sampled Data Based on cwt";
my_handle.figure_name = my_plot_desc;


k=1/(2*sqrt(log(2)));
x=0:30/1999:30; 
dx=x(2)-x(1);
a1=1.0; t1=5; w1=1.3;
y1=a1*exp(-((x-t1)/(w1*k)).^2);
a2=1.0; t2=15.0; w2=1.3;
y2=a2*(1+4*((x-t2)/w2).^2).^(-1);
a3=1.0; t3=25;
y3=a3*ones(x)./(1+exp(-3.0*(x-t3)));
y=y1+y2+y3;
noise=rand(y);
y=y+(noise-0.5)*0.01;


trt_flag=1;
u=y;
wt_name='gaus1';
wt_scale=16;


if trt_flag
    x=(1:max(size(u)))*dx;
    a=(u($)-u(1))/(x($)-x(1));
    b=u(1)-a*x(1);
    u=u-a*x-repmat(b,1,length(u));
else
    a=0;
end

wt_name=convstr(wt_name);

dudx=cwt(u,wt_scale,wt_name);

if (wt_name=='gaus1')
    dudx=-dudx/wt_scale^(3/2)/(2*%pi)^(1/4);
elseif (wt_name=='haar')
    dudx=-dudx/wt_scale^(3/2)*4;
// elseif (wt_name=='spl')
//     dudx=-dudx/wt_scale^(3/2);
elseif (wt_name=='db1')
    dudx=-dudx/wt_scale^(3/2)*4;
elseif (wt_name=='bior1.1')
    dudx=-dudx/wt_scale^(3/2)*4;
elseif (wt_name=='bior1.3')
    dudx=-dudx/wt_scale^(3/2)*4;
elseif (wt_name=='bior1.5')
    dudx=-dudx/wt_scale^(3/2)*4;
elseif (wt_name=='sym1')
    dudx=-dudx/wt_scale^(3/2)*4;
end

dudx=dudx/dx+a;








scf(my_handle);
subplot(2,2,1)
plot(x,y);
title('noisy data');

subplot(2,2,3)
plot(x(1:$-1)+(x(2)-x(1)),diff(y)/dx);
title('differentiation (diff)');

subplot(2,2,2)
plot(x,dudx);
title('differentiation (cwt)');

u=y;
trt_flag=1;

wt_name='haar';
wt_level=4;

if trt_flag
    x=(1:length(u))*dx;
    a=(u($)-u(1))/(x($)-x(1));
    b=u(1)-a*x(1);
    u=u-a*x-b;
else
    a=0;
end

wt_name=convstr(wt_name);

if (wt_name=='haar')    
    h0=[sqrt(2)/2 sqrt(2)/2];  //the decomposition low-pass filter
    h1=[-sqrt(2)/2 sqrt(2)/2]; //the decomposition high-pass filter    
elseif (wt_name=='spl')
    h0=[0.125 0.375 0.375 0.125]*sqrt(2);
    h1=[-2 2]*sqrt(2);
else
    error('wavelet name error');
end

y0=u;

// Algorithme a Trous
for n=1:wt_level    
    h0_atrous=[h0' zeros(length(h0),2^(n-1)-1)]';
    h0_atrous=h0_atrous(1:(length(h0)-1)*(2^(n-1)-1)+length(h0));
    
    h1_atrous=[h1' zeros(length(h1),2^(n-1)-1)]';
    h1_atrous=h1_atrous(1:(length(h1)-1)*(2^(n-1)-1)+length(h1));
        
    y1=conv(y0,h1_atrous);
    y0=conv(y0,h0_atrous);    
end

index=round(length(y1)/2-length(u)/2)+[1:length(u)];
dudx=y1(index);

wt_scale=2^wt_level;

if (wt_name=='haar')
    dudx=-dudx/wt_scale^(3/2)*4;
elseif (wt_name=='spl')
    dudx=-dudx/wt_scale^(3/2);   
else
    error('wavelet name error');
end

dudx=dudx/dx+a;





subplot(2,2,4)
plot(x,dudx);
title('differentiation (dwt)');
