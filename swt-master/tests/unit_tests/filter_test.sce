mode(-1);lines(0);
a=rand(1,50,'normal');
lo_r=a;
lo_d=wrev(lo_r);
hi_r=qmf(lo_r);
hi_d=wrev(hi_r);
[Lo_D,Hi_D,Lo_R,Hi_R]=orthfilt(a);
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("orthfilt test pass!");
else
  error("orthfilt test fails!");
end
clear Lo_D;
clear Hi_D;
clear Lo_R;
clear Hi_R;
clear lo_d;
clear hi_d;
clear hi_r;
clear lo_r;
clear a;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;

df=rand(1,50,'normal');
rf=rand(1,50,'normal');
df_lo_r=df;
df_lo_d=wrev(df_lo_r);
df_hi_r=qmf(df_lo_r);
df_hi_d=wrev(df_hi_r);
rf_lo_r=rf;
rf_lo_d=wrev(rf_lo_r);
rf_hi_r=qmf(rf_lo_r);
rf_hi_d=wrev(rf_hi_r);
[Lo_D,Hi_D,Lo_R,Hi_R]=biorfilt(df,rf);
e1=sum(abs(Hi_R-df_hi_r));
e2=sum(abs(Lo_D-df_lo_d));
e3=sum(abs(Hi_D-rf_hi_d));
e4=sum(abs(Lo_R-rf_lo_r));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("biorfilt test pass!");
else
  error("biorfilt test fails!");
end
clear df;
clear rf;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear Lo_D;
clear Hi_D;
clear Lo_R;
clear Hi_R;
clear df_lo_r;
clear df_lo_d;
clear df_hi_r;
clear df_hi_d;
clear rf_lo_r;
clear rf_lo_d;
clear rf_hi_r;
clear rf_hi_d;

[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('haar');
w=dbwavf('db1');
[lo_d,hi_d,lo_r,hi_r]=orthfilt(w);
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 1 test pass!");
else
  error("wfilters input pattern 1 test fails!");
end
[Lo_D,Hi_D]=wfilters('haar','d');
[Lo_R,Hi_R]=wfilters('haar','r');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 2 test pass!");
else
  error("wfilters input pattern 2 test fails!");
end
[Lo_D,Lo_R]=wfilters('haar','l');
[Hi_D,Hi_R]=wfilters('haar','h');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 3 test pass!");
else
  error("wfilters input pattern 3 test fails!");
end

[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db1');
w=dbwavf('db1');
[lo_d,hi_d,lo_r,hi_r]=orthfilt(w);
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 1 test pass!");
else
  error("wfilters input pattern 1 test fails!");
end
[Lo_D,Hi_D]=wfilters('db1','d');
[Lo_R,Hi_R]=wfilters('db1','r');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 2 test pass!");
else
  error("wfilters input pattern 2 test fails!");
end
[Lo_D,Lo_R]=wfilters('db1','l');
[Hi_D,Hi_R]=wfilters('db1','h');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 3 test pass!");
else
  error("wfilters input pattern 3 test fails!");
end


[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db2');
w=dbwavf('db2');
[lo_d,hi_d,lo_r,hi_r]=orthfilt(w);
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 1 test pass!");
else
  error("wfilters input pattern 1 test fails!");
end
[Lo_D,Hi_D]=wfilters('db2','d');
[Lo_R,Hi_R]=wfilters('db2','r');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 2 test pass!");
else
  error("wfilters input pattern 2 test fails!");
end
[Lo_D,Lo_R]=wfilters('db2','l');
[Hi_D,Hi_R]=wfilters('db2','h');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 3 test pass!");
else
  error("wfilters input pattern 3 test fails!");
end

[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db3');
w=dbwavf('db3');
[lo_d,hi_d,lo_r,hi_r]=orthfilt(w);
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 1 test pass!");
else
  error("wfilters input pattern 1 test fails!");
end
[Lo_D,Hi_D]=wfilters('db3','d');
[Lo_R,Hi_R]=wfilters('db3','r');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 2 test pass!");
else
  error("wfilters input pattern 2 test fails!");
end
[Lo_D,Lo_R]=wfilters('db3','l');
[Hi_D,Hi_R]=wfilters('db3','h');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 3 test pass!");
else
  error("wfilters input pattern 3 test fails!");
end

[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.1');
[rf,df]=biorwavf('bior1.1');
[lo_d,hi_d,lo_r,hi_r]=biorfilt(df,rf);
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 1 test pass!");
else
  error("wfilters input pattern 1 test fails!");
end
[Lo_D,Hi_D]=wfilters('bior1.1','d');
[Lo_R,Hi_R]=wfilters('bior1.1','r');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 2 test pass!");
else
  error("wfilters input pattern 2 test fails!");
end
[Lo_D,Lo_R]=wfilters('bior1.1','l');
[Hi_D,Hi_R]=wfilters('bior1.1','h');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 3 test pass!");
else
  error("wfilters input pattern 3 test fails!");
end

[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.5');
[rf,df]=biorwavf('bior1.5');
[lo_d,hi_d,lo_r,hi_r]=biorfilt(df,rf);
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 1 test pass!");
else
  error("wfilters input pattern 1 test fails!");
end
[Lo_D,Hi_D]=wfilters('bior1.5','d');
[Lo_R,Hi_R]=wfilters('bior1.5','r');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 2 test pass!");
else
  error("wfilters input pattern 2 test fails!");
end
[Lo_D,Lo_R]=wfilters('bior1.5','l');
[Hi_D,Hi_R]=wfilters('bior1.5','h');
e1=sum(abs(lo_d-Lo_D));
e2=sum(abs(lo_r-Lo_R));
e3=sum(abs(hi_d-Hi_D));
e4=sum(abs(hi_r-Hi_R));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wfilters input pattern 3 test pass!");
else
  error("wfilters input pattern 3 test fails!");
end

clear Lo_D;
clear Lo_R;
clear Hi_R;
clear Hi_D;
clear lo_d;
clear lo_r;
clear hi_r;
clear hi_d;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;

l1=wmaxlev(50,'db4');
l2=wmaxlev(65,'db4');
l3=wmaxlev([50 65],'db4');
l4=wmaxlev([65 50],'db4');
l5=wmaxlev([50 65]','db4');
l6=wmaxlev([65 50]','db4');
l=min(l1,l2);
e1=abs(l3-l);
e2=abs(l4-l);
e3=abs(l5-l);
e4=abs(l6-l);
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("wmaxlev test pass!");
else
  error("wmaxlev input pattern 3 test fails!");
end

clear l;
clear l1;
clear l2;
clear l3;
clear l4;
clear l5;
clear l6;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;


a='asymh';
dwtmode(a);
ST=dwtmode('status','nodisp');
b=mtlb_strcmp(ST,a);
x=rand(1,50,'normal');
[cA,cD]=dwt(x,'db2');
[caa,cdd]=dwt(x,'db2','mode',a);
x0=idwt(cA,cD,'db2',length(x));
e=sum(abs(cA-caa))+sum(abs(cD-cdd))+sum(abs(x-x0));
if ((b==%T) & (e<1E-8))
  disp("dwtmode OK");
else
  error("dwtmode fails");
end

a='sp1';
dwtmode(a);
ST=dwtmode('status','nodisp');
b=mtlb_strcmp(ST,a);
x=rand(1,50,'normal');
[cA,cD]=dwt(x,'db2');
[caa,cdd]=dwt(x,'db2','mode',a);
x0=idwt(cA,cD,'db2',length(x));
e=sum(abs(cA-caa))+sum(abs(cD-cdd))+sum(abs(x-x0));
if ((b==%T) & (e<1E-8))
  disp("dwtmode OK");
else
  error("dwtmode fails");
end


dwtmode("symh");