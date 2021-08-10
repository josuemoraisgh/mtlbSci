//wavedec demo
mode(-1);
lines(0);

my_handle = scf(100001);
clf(my_handle,"reset");
demo_viewCode("wavedec.dem.sce");

// DEMO START

my_plot_desc          = "wavedec";
my_handle.figure_name = my_plot_desc;

n = x_choose_modeless(['A Sum of Sines';' A Frequency Breakdown';'Uniform White Noise';...
'Colored AR(3) Noise';'Polynomial + White Noise';' A Step Signal';'Two Proximal Discontinuities';...
'A Second-Derivative Discontinuity';'A Ramp + White Noise';'A Ramp + Colored Noise';'A Sine + White Noise';...
'A Triangle + A Sine';'A Triangle + A Sine + Noise'],['Wavelet decomposition using wavedec()'],'Return');

if n>0

N=1000;
t=1:N;
select n
case 1
  s=sin(3*t)+sin(0.3*t)+sin(0.03*t);
  wname='db3';
  lvl=5;
case 2
   wname='db5';
  lvl=5;
   s=[sin(0.03*(1:500)), sin(0.3*(501:1000))];
case 3
    wname='db3';
  lvl=5;
   s=rand(1,N)-0.5;
case 4
     wname='db3';
  lvl=5;
   b=rand(1,N)-0.5;
   s=b;
   for i=4:N
     s(i)=-1.5*s(i-1)-0.75*s(i-2)-0.125*s(i-3)+b(i)+0.5;
   end
case 5
    wname='db2';
  lvl=3;
   t=1:N;
   s=t.^2-t+1+rand(1,N)-0.5;;
case 6
    wname='db2';
  lvl=5;
  s=[zeros(1,500),20*ones(1,500)];
case 7
  wname='db2';
  lvl=5;
  s=[3*(1:499),1500*ones(1,11),3*(511:1000)-30];
case 8
  wname='db1';
  lvl=2;
  t=-.5:0.001:0.5-0.001;
  s=zeros(1,N);
  for i=1:1000
    if t(i)<0 then
      s(i)=exp(-4*t(i)^2);
    else
      s(i)=exp(-t(i)^2);
    end
  end
case 9
   wname='db3';
  lvl=6;
  s=[3*(1:499)/500,3*ones(1,501)]+rand(1,N)-0.5;
case 10
 wname='db3';
  lvl=6; 
  b=rand(1,N)-0.5;
  b2=b;
   for i=4:N
     b2(i)=-1.5*b2(i-1)-0.75*b2(i-2)-0.125*b2(i-3)+b(i)+0.5;
   end
 s=[1*(1:499)/500,1*ones(1,501)]+b2;
case 11
wname='db5';
  lvl=5;  
  t=1:N;
   s=sin(0.03*t)+rand(1,N)-0.5;
case 12
wname='db5';
  lvl=6;  
    t=1:N;
  s=[((1:500)-1)/500,(1000-(501:1000))/500]+sin(0.3*t);
case 13
wname='db5';
  lvl=7;  
    t=1:N;
  s=[((1:500)-1)/500,(1000-(501:1000))/500]+sin(0.3*t)+rand(1,N)-0.5;
end


// Perform the decomposition of s at level lvl using wavelet wname

    [c,l] = wavedec(s,lvl,wname);

A=zeros(lvl,length(s));D=zeros(A);
for i = 1:lvl
    A(i,:) = wrcoef('a',c,l,wname,i);
    D(i,:) = wrcoef('d',c,l,wname,i);
end

// Plot 
    //scf(1);clf(1);
    t = 100:900; 
    subplot(lvl+1,2,1); plot(t,s(t),'r'); 
    title('Orig. signal and approx. 1 to '+string(lvl)+'.'); 
    subplot(lvl+1,2,2); plot(t,s(t),'r'); 
    title('Orig. signal and details 1 to '+string(lvl)+'.'); 
    for i = 1:lvl, 
        subplot(lvl+1,2,2*i+1); plot(t,A(lvl-i+1,t),'b'); 
        subplot(lvl+1,2,2*i+2); plot(t,D(lvl-i+1,t),'g'); 
    end





end