mode(-1);lines(0);
// dwt1d test

// dwt
// load signal
testpath = get_absolute_file_path("dwt1d_test.sce");
loadmatfile("-mat",testpath+"/Data.mat");
// type 1 input
// haar
[cA,cD]=dwt(x1,'haar');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('haar');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'haar');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'haar');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, haar, passes");
else
   error("type 1 input, haar, failes");
end
// db1
[cA,cD]=dwt(x1,'db1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db1, passes");
else
   error("type 1 input, db1, failes");
end
// db2
[cA,cD]=dwt(x1,'db2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db2, passes");
else
   error("type 1 input, db2, failes");
end

// db3
[cA,cD]=dwt(x1,'db3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db3, passes");
else
   error("type 1 input, db3, failes");
end

// db4
[cA,cD]=dwt(x1,'db4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db4, passes");
else
   error("type 1 input, db4, failes");
end

// db5
[cA,cD]=dwt(x1,'db5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db5, passes");
else
   error("type 1 input, db5, failes");
end

// db6
[cA,cD]=dwt(x1,'db6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db6, passes");
else
   error("type 1 input, db6, failes");
end

// db7
[cA,cD]=dwt(x1,'db7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db7, passes");
else
   error("type 1 input, db7, failes");
end

// db8
[cA,cD]=dwt(x1,'db8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db8, passes");
else
   error("type 1 input, db8, failes");
end

// db9
[cA,cD]=dwt(x1,'db9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db9, passes");
else
   error("type 1 input, db9, failes");
end

// db10
[cA,cD]=dwt(x1,'db10');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, db10, passes");
else
   error("type 1 input, db10, failes");
end

// coif1
[cA,cD]=dwt(x1,'coif1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'coif1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'coif1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, coif1, passes");
else
   error("type 1 input, coif1, failes");
end

// coif2
[cA,cD]=dwt(x1,'coif2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'coif2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'coif2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, coif2, passes");
else
   error("type 1 input, coif2, failes");
end

// coif3
[cA,cD]=dwt(x1,'coif3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'coif3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'coif3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, coif3, passes");
else
   error("type 1 input, coif3, failes");
end


// coif4
[cA,cD]=dwt(x1,'coif4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'coif4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'coif4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, coif4, passes");
else
   error("type 1 input, coif4, failes");
end

// coif5
[cA,cD]=dwt(x1,'coif5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'coif5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'coif5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, coif5, passes");
else
   error("type 1 input, coif5, failes");
end

// sym4
[cA,cD]=dwt(x1,'sym4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'sym4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'sym4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, sym4, passes");
else
   error("type 1 input, sym4, failes");
end

// sym5
[cA,cD]=dwt(x1,'sym5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'sym5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'sym5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, sym5, passes");
else
   error("type 1 input, sym5, failes");
end

// sym6
[cA,cD]=dwt(x1,'sym6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'sym6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'sym6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, sym6, passes");
else
   error("type 1 input, sym6, failes");
end

// sym7
[cA,cD]=dwt(x1,'sym7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'sym7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'sym7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, sym7, passes");
else
   error("type 1 input, sym7, failes");
end

// sym8
[cA,cD]=dwt(x1,'sym8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'sym8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'sym8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, sym8, passes");
else
   error("type 1 input, sym8, failes");
end

// sym9
[cA,cD]=dwt(x1,'sym9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'sym9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'sym9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, sym9, passes");
else
   error("type 1 input, sym9, failes");
end

// sym10
[cA,cD]=dwt(x1,'sym10');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym10');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'sym10');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'sym10');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, sym10, passes");
else
   error("type 1 input, sym10, failes");
end

// bior1.1
[cA,cD]=dwt(x1,'bior1.1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior1.1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior1.1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior1.1, passes");
else
   error("type 1 input, bior1.1, failes");
end

// bior1.3
[cA,cD]=dwt(x1,'bior1.3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior1.3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior1.3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior1.3, passes");
else
   error("type 1 input, bior1.3, failes");
end

// bior1.5
[cA,cD]=dwt(x1,'bior1.5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior1.5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior1.5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior1.5, passes");
else
   error("type 1 input, bior1.5, failes");
end

// bior2.2
[cA,cD]=dwt(x1,'bior2.2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior2.2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior2.2');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior2.2, passes");
else
   error("type 1 input, bior2.2, failes");
end

// bior2.4
[cA,cD]=dwt(x1,'bior2.4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior2.4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior2.4');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior2.4, passes");
else
   error("type 1 input, bior2.4, failes");
end

// bior2.6
[cA,cD]=dwt(x1,'bior2.6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior2.6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior2.6');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior2.6, passes");
else
   error("type 1 input, bior2.6, failes");
end

// bior2.8
[cA,cD]=dwt(x1,'bior2.8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior2.8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior2.8');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior2.8, passes");
else
   error("type 1 input, bior2.8, failes");
end

// bior3.1
[cA,cD]=dwt(x1,'bior3.1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior3.1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior3.1');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior3.1, passes");
else
   error("type 1 input, bior3.1, failes");
end

// bior3.3
[cA,cD]=dwt(x1,'bior3.3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior3.3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior3.3');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior3.3, passes");
else
   error("type 1 input, bior3.3, failes");
end

// bior3.5
[cA,cD]=dwt(x1,'bior3.5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior3.5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior3.5');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior3.5, passes");
else
   error("type 1 input, bior3.5, failes");
end


// bior3.7
[cA,cD]=dwt(x1,'bior3.7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior3.7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior3.7');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior3.7, passes");
else
   error("type 1 input, bior3.7, failes");
end


// bior3.9
[cA,cD]=dwt(x1,'bior3.9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'bior3.9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'bior3.9');
caa=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 1 input, bior3.9, passes");
else
   error("type 1 input, bior3.9, failes");
end

// type 2 input
Lo_D=rand(1,20,'normal');
Hi_D=rand(1,20,'normal');
[cA,cD]=dwt(x1,Lo_D,Hi_D);
caa=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,Lo_D,Hi_D);
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,Lo_D,Hi_D);
caa=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 2 input, passes");
else
   error("type 2 input, failes");
end

// type 3 input
// symw
// haar
[cA,cD]=dwt(x1,'db10','mode','symw');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'symw',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symw',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10','mode','symw');
caa=dyaddown(wkeep(conv(wextend(1,'symw',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symw',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10','mode','symw');
caa=dyaddown(wkeep(conv(wextend(1,'symw',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'symw',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 3 input, symw, passes");
else
   error("type 3 input, symw, failes");
end

// asymh
[cA,cD]=dwt(x1,'db10','mode','asymh');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'asymh',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'asymh',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10','mode','asymh');
caa=dyaddown(wkeep(conv(wextend(1,'asymh',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'asymh',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10','mode','asymh');
caa=dyaddown(wkeep(conv(wextend(1,'asymh',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'asymh',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 3 input, asymh, passes");
else
   error("type 3 input, asymh, failes");
end

// asymw
[cA,cD]=dwt(x1,'db10','mode','asymw');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'asymw',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'asymw',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10','mode','asymw');
caa=dyaddown(wkeep(conv(wextend(1,'asymw',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'asymw',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10','mode','asymw');
caa=dyaddown(wkeep(conv(wextend(1,'asymw',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'asymw',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 3 input, asymw, passes");
else
   error("type 3 input, asymw, failes");
end

// zpd
[cA,cD]=dwt(x1,'db10','mode','zpd');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'zpd',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'zpd',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10','mode','zpd');
caa=dyaddown(wkeep(conv(wextend(1,'zpd',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'zpd',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10','mode','zpd');
caa=dyaddown(wkeep(conv(wextend(1,'zpd',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'zpd',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 3 input, zpd, passes");
else
   error("type 3 input, zpd, failes");
end

// sp0
[cA,cD]=dwt(x1,'db10','mode','sp0');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'sp0',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'sp0',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10','mode','sp0');
caa=dyaddown(wkeep(conv(wextend(1,'sp0',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'sp0',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10','mode','sp0');
caa=dyaddown(wkeep(conv(wextend(1,'sp0',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'sp0',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 3 input, sp0, passes");
else
   error("type 3 input, sp0, failes");
end

// sp1
[cA,cD]=dwt(x1,'db10','mode','sp1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'sp1',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'sp1',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10','mode','sp1');
caa=dyaddown(wkeep(conv(wextend(1,'sp1',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'sp1',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10','mode','sp1');
caa=dyaddown(wkeep(conv(wextend(1,'sp1',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'sp1',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 3 input, sp1, passes");
else
   error("type 3 input, sp1, failes");
end

// ppd
[cA,cD]=dwt(x1,'db10','mode','ppd');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'ppd',x1,length(Lo_D),'b'),Lo_D),(length(x1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'ppd',x1,length(Lo_D),'b'),Hi_D),(length(x1)+length(Lo_D)-1)));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10','mode','ppd');
caa=dyaddown(wkeep(conv(wextend(1,'ppd',x2,length(Lo_D),'b'),Lo_D),(length(x2)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'ppd',x2,length(Lo_D),'b'),Hi_D),(length(x2)+length(Lo_D)-1)));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10','mode','ppd');
caa=dyaddown(wkeep(conv(wextend(1,'ppd',s1,length(Lo_D),'b'),Lo_D),(length(s1)+length(Lo_D)-1)));
cdd=dyaddown(wkeep(conv(wextend(1,'ppd',s1,length(Lo_D),'b'),Hi_D),(length(s1)+length(Lo_D)-1)));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 3 input, ppd, passes");
else
   error("type 3 input, ppd, failes");
end

// per
[cA,cD]=dwt(x1,'db10','mode','per');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
caa=dyaddown(wkeep(conv(wextend(1,'per',x1,length(Lo_D),'b'),Lo_D),(length(x1))));
cdd=dyaddown(wkeep(conv(wextend(1,'per',x1,length(Lo_D),'b'),Hi_D),(length(x1))));
e1=sum(abs(caa-cA));
e2=sum(abs(cdd-cD));
[cA,cD]=dwt(x2,'db10','mode','per');
caa=dyaddown(wkeep(conv(wextend(1,'per',x2,length(Lo_D),'b'),Lo_D),(length(x2))));
cdd=dyaddown(wkeep(conv(wextend(1,'per',x2,length(Lo_D),'b'),Hi_D),(length(x2))));
e3=sum(abs(caa-cA));
e4=sum(abs(cdd-cD));
[cA,cD]=dwt(s1,'db10','mode','per');
caa=dyaddown(wkeep(conv(wextend(1,'per',s1,length(Lo_D),'b'),Lo_D),(length(s1))));
cdd=dyaddown(wkeep(conv(wextend(1,'per',s1,length(Lo_D),'b'),Hi_D),(length(s1))));
e5=sum(abs(caa(:)-cA(:)));
e6=sum(abs(cdd(:)-cD(:)));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("type 3 input, per, passes");
else
   error("type 3 input, per, failes");
end


// idwt
// haar
[cA,cD]=dwt(x1,'haar');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('haar');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'haar');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'haar');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('haar');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'haar');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'haar');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('haar');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'haar');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, haar, idwt passes");
else
   error("type 1 input, haar, idwt fails");
end

// db1
[cA,cD]=dwt(x1,'db1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db1');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db1');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db1');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db1, idwt passes");
else
   error("type 1 input, db1, idwt fails");
end


// db2
[cA,cD]=dwt(x1,'db2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db2');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db2');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db2');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db2, idwt passes");
else
   error("type 1 input, db2, idwt fails");
end

// db3
[cA,cD]=dwt(x1,'db3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db3');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db3');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db3');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db3, idwt passes");
else
   error("type 1 input, db3, idwt fails");
end

// db4
[cA,cD]=dwt(x1,'db4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db4');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db4');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db4');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db4, idwt passes");
else
   error("type 1 input, db4, idwt fails");
end

// db5
[cA,cD]=dwt(x1,'db5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db5');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db5');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db5');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db5, idwt passes");
else
   error("type 1 input, db5, idwt fails");
end

// db6
[cA,cD]=dwt(x1,'db6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db6');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db6');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db6');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db6, idwt passes");
else
   error("type 1 input, db6, idwt fails");
end

// db7
[cA,cD]=dwt(x1,'db7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db7');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db7');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db7');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db7, idwt passes");
else
   error("type 1 input, db7, idwt fails");
end

// db8
[cA,cD]=dwt(x1,'db8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db8');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db8');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db8');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db8, idwt passes");
else
   error("type 1 input, db8, idwt fails");
end

// db9
[cA,cD]=dwt(x1,'db9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db9');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db9');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db9');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db9, idwt passes");
else
   error("type 1 input, db9, idwt fails");
end

// db10

[cA,cD]=dwt(x1,'db10');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db10');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'db10');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db10');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'db10');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('db10');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'db10');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, db10, idwt passes");
else
   error("type 1 input, db10, idwt fails");
end

// coif1
[cA,cD]=dwt(x1,'coif1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif1');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'coif1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif1');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'coif1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif1');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, coif1, idwt passes");
else
   error("type 1 input, coif1, idwt fails");
end

// coif2
[cA,cD]=dwt(x1,'coif2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif2');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'coif2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif2');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'coif2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif2');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, coif2, idwt passes");
else
   error("type 1 input, coif2, idwt fails");
end

// coif3
[cA,cD]=dwt(x1,'coif3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif3');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'coif3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif3');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'coif3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif3');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, coif3, idwt passes");
else
   error("type 1 input, coif3, idwt fails");
end

// coif4
[cA,cD]=dwt(x1,'coif4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif4');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'coif4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif4');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'coif4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif4');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, coif4, idwt passes");
else
   error("type 1 input, coif4, idwt fails");
end


// coif5
[cA,cD]=dwt(x1,'coif5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif5');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'coif5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif5');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'coif5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('coif5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'coif5');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, coif5, idwt passes");
else
   error("type 1 input, coif5, idwt fails");
end


// sym4
[cA,cD]=dwt(x1,'sym4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym4');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'sym4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym4');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'sym4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym4');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, sym4, idwt passes");
else
   error("type 1 input, sym4, idwt fails");
end

// sym5
[cA,cD]=dwt(x1,'sym5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym5');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'sym5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym5');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'sym5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym5');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, sym5, idwt passes");
else
   error("type 1 input, sym5, idwt fails");
end

// sym6
[cA,cD]=dwt(x1,'sym6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym6');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'sym6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym6');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'sym6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym6');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, sym6, idwt passes");
else
   error("type 1 input, sym6, idwt fails");
end


// sym7
[cA,cD]=dwt(x1,'sym7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym7');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'sym7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym7');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'sym7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym7');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, sym7, idwt passes");
else
   error("type 1 input, sym7, idwt fails");
end

// sym8
[cA,cD]=dwt(x1,'sym8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym8');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'sym8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym8');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'sym8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym8');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, sym8, idwt passes");
else
   error("type 1 input, sym8, idwt fails");
end

// sym9
[cA,cD]=dwt(x1,'sym9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym9');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'sym9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym9');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'sym9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym9');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, sym9, idwt passes");
else
   error("type 1 input, sym9, idwt fails");
end

// sym10
[cA,cD]=dwt(x1,'sym10');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym10');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym10');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'sym10');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym10');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym10');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'sym10');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym10');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'sym10');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, sym10, idwt passes");
else
   error("type 1 input, sym10, idwt fails");
end

// bior1.1
[cA,cD]=dwt(x1,'bior1.1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.1');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior1.1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.1');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior1.1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.1');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior1.1, idwt passes");
else
   error("type 1 input, bior1.1, idwt fails");
end

// boir1.3
[cA,cD]=dwt(x1,'bior1.3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.3');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior1.3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.3');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior1.3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.3');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior1.3, idwt passes");
else
   error("type 1 input, bior1.3, idwt fails");
end

// bior1.5
[cA,cD]=dwt(x1,'bior1.5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.5');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior1.5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.5');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior1.5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior1.5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior1.5');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior1.5, idwt passes");
else
   error("type 1 input, bior1.5, idwt fails");
end

// bior2.2
[cA,cD]=dwt(x1,'bior2.2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.2');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior2.2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.2');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior2.2');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.2');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.2');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior2.2, idwt passes");
else
   error("type 1 input, bior2.2, idwt fails");
end

// bior2.4
[cA,cD]=dwt(x1,'bior2.4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.4');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior2.4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.4');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior2.4');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.4');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.4');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior2.4, idwt passes");
else
   error("type 1 input, bior2.4, idwt fails");
end

// bior2.6
[cA,cD]=dwt(x1,'bior2.6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.6');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior2.6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.6');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior2.6');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.6');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.6');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior2.6, idwt passes");
else
   error("type 1 input, bior2.6, idwt fails");
end

// bior2.8
[cA,cD]=dwt(x1,'bior2.8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.8');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior2.8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.8');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior2.8');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior2.8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior2.8');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior2.8, idwt passes");
else
   error("type 1 input, bior2.8, idwt fails");
end

// bior3.1
[cA,cD]=dwt(x1,'bior3.1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.1');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior3.1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.1');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior3.1');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.1');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.1');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior3.1, idwt passes");
else
   error("type 1 input, bior3.1, idwt fails");
end

// bior3.3
[cA,cD]=dwt(x1,'bior3.3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.3');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior3.3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.3');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior3.3');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.3');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.3');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior3.3, idwt passes");
else
   error("type 1 input, bior3.3, idwt fails");
end

// bior3.5
[cA,cD]=dwt(x1,'bior3.5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.5');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior3.5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.5');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior3.5');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.5');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.5');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior3.5, idwt passes");
else
   error("type 1 input, bior3.5, idwt fails");
end

// bior3.7
[cA,cD]=dwt(x1,'bior3.7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.7');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior3.7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.7');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior3.7');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.7');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.7');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior3.7, idwt passes");
else
   error("type 1 input, bior3.7, idwt fails");
end

// bior3.9
[cA,cD]=dwt(x1,'bior3.9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.9');
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'bior3.9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.9');
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'bior3.9');
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.9');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
r=idwt(cA,cD,'bior3.9');
e3=sum(abs(r-x0));
e=e1+e2+e3;
if (e<1E-8)
   disp("type 1 input, bior3.9, idwt passes");
else
   error("type 1 input, bior3.9, idwt fails");
end

// // type 2
// [cA,cD]=dwt(x1,'bior3.9');
// Lo_R=rand(1,50,'normal');
// Hi_R=rand(1,50,'normal');
// a0=conv(dyadup(cA),Lo_R);
// d0=conv(dyadup(cD),Hi_R);
// x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
// r=idwt(cA,cD,Lo_R,Hi_R);
// e1=sum(abs(r-x0));
// [cA,cD]=dwt(x2,'bior3.9');
// Lo_R=rand(1,50,'normal');
// Hi_R=rand(1,50,'normal');
// a0=conv(dyadup(cA),Lo_R);
// d0=conv(dyadup(cD),Hi_R);
// x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
// r=idwt(cA,cD,Lo_R,Hi_R);
// e2=sum(abs(r-x0));
// [cA,cD]=dwt(s1,'bior3.9');
// Lo_R=rand(1,50,'normal');
// Hi_R=rand(1,50,'normal');
// a0=conv(dyadup(cA),Lo_R);
// d0=conv(dyadup(cD),Hi_R);
// x0=wkeep(a0+d0,2*length(cA)-length(Lo_R)+2);
// r=idwt(cA,cD,Lo_R,Hi_R);
// e3=sum(abs(r-x0));
// e=e1+e2+e3;
// if (e<1E-8)
//    disp("type 2 input, idwt passes");
// else
//    error("type 2 input, idwt fails");
// end

// type 3
[cA,cD]=dwt(x1,'sym8');
r=idwt(cA,cD,'sym8',50);
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,50);
e1=sum(abs(r-x0));
[cA,cD]=dwt(x2,'sym8');
r=idwt(cA,cD,'sym8',50);
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,50);
e2=sum(abs(r-x0));
[cA,cD]=dwt(s1,'sym8');
r=idwt(cA,cD,'sym8',50);
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('sym8');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,50);
e3=sum(abs(r-x0));
Lo_R=rand(1,50,'normal');
Hi_R=rand(1,50,'normal');
a0=conv(dyadup(cA),Lo_R);
d0=conv(dyadup(cD),Hi_R);
x0=wkeep(a0+d0,50);
r=idwt(cA,cD,Lo_R,Hi_R,50);
e4=sum(abs(r-x0));
e=e1+e2+e3+e4;
if (e<1E-8)
   disp("type 3 input, idwt passes");
else
   error("type 3 input, idwt fails");
end


// type 4
[cA,cD]=dwt(x1,'db7');
a0=idwt(cA,cD,'db7','mode','symh');
a1=idwt(cA,cD,'db7','mode','symw');
a2=idwt(cA,cD,'db7','mode','asymh');
a3=idwt(cA,cD,'db7','mode','asymw');
a4=idwt(cA,cD,'db7','mode','sp0');
a5=idwt(cA,cD,'db7','mode','sp1');
a6=idwt(cA,cD,'db7','mode','zpd');
a7=idwt(cA,cD,'db7','mode','ppd');
a8=idwt(cA,cD,'db7','mode','per');
[Lo_R,Hi_R]=wfilters('db7','r');
aa0=conv(dyadup(cA),Lo_R);
dd0=conv(dyadup(cD),Hi_R);
x0=wkeep(aa0+dd0,2*length(cA)-length(Lo_R)+2);
xx1=wkeep(aa0+dd0,2*length(cA));
e1=sum(abs(x0-a0));
e2=sum(abs(x0-a1));
e3=sum(abs(x0-a3));
e4=sum(abs(x0-a4));
e5=sum(abs(x0-a5));
e6=sum(abs(x0-a6));
e7=sum(abs(x0-a7));
e8=sum(abs(xx1-a8));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
   disp("type 4 input, idwt passes");
else
   error("type 4 input, idwt fails");
end


// type 5
[cA,cD]=dwt(x1,'db7');
a0=idwt(cA,cD,'db7',50,'mode','symh');
a1=idwt(cA,cD,'db7',50,'mode','symw');
a2=idwt(cA,cD,'db7',50,'mode','asymh');
a3=idwt(cA,cD,'db7',50,'mode','asymw');
a4=idwt(cA,cD,'db7',50,'mode','sp0');
a5=idwt(cA,cD,'db7',50,'mode','sp1');
a6=idwt(cA,cD,'db7',50,'mode','zpd');
a7=idwt(cA,cD,'db7',50,'mode','ppd');
a8=idwt(cA,cD,'db7',50,'mode','per');
[Lo_R,Hi_R]=wfilters('db7','r');
aa0=conv(dyadup(cA),Lo_R);
dd0=conv(dyadup(cD),Hi_R);
x0=wkeep(aa0+dd0,50);
e1=sum(abs(x0-a0));
e2=sum(abs(x0-a1));
e3=sum(abs(x0-a3));
e4=sum(abs(x0-a4));
e5=sum(abs(x0-a5));
e6=sum(abs(x0-a6));
e7=sum(abs(x0-a7));
e8=sum(abs(x0-a8));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
   disp("type 5 input, idwt passes");
else
   error("type 5 input, idwt fails");
end

// type 6
// [cA,cD]=dwt(x1,'db7');
// Lo_R=rand(1,50,'normal');
// Hi_R=rand(1,50,'normal');
// a0=idwt(cA,cD,Lo_R,Hi_R,50,'mode','symh');
// a1=idwt(cA,cD,Lo_R,Hi_R,50,'mode','symw');
// a2=idwt(cA,cD,Lo_R,Hi_R,50,'mode','asymh');
// a3=idwt(cA,cD,Lo_R,Hi_R,50,'mode','asymw');
// a4=idwt(cA,cD,Lo_R,Hi_R,50,'mode','sp0');
// a5=idwt(cA,cD,Lo_R,Hi_R,50,'mode','sp1');
// a6=idwt(cA,cD,Lo_R,Hi_R,50,'mode','zpd');
// a7=idwt(cA,cD,Lo_R,Hi_R,50,'mode','ppd');
// a8=idwt(cA,cD,Lo_R,Hi_R,50,'mode','per');
// aa0=conv(dyadup(cA),Lo_R);
// dd0=conv(dyadup(cD),Hi_R);
// x0=wkeep(aa0+dd0,50);
// e1=sum(abs(x0-a0));
// e2=sum(abs(x0-a1));
// e3=sum(abs(x0-a3));
// e4=sum(abs(x0-a4));
// e5=sum(abs(x0-a5));
// e6=sum(abs(x0-a6));
// e7=sum(abs(x0-a7));
// e8=sum(abs(x0-a8));
// e=e1+e2+e3+e4+e5+e6+e7+e8;
// if (e<1E-8)
//    disp("type 6 input, idwt passes");
// else
//    error("type 6 input, idwt fails");
// end

// column vector
[cA,cD]=dwt(x1','sym9');
[cA1,cD1]=dwt(x1,'sym9');
a0=idwt(cA,cD,'sym9');
a1=idwt(cA',cD,'sym9');
a2=idwt(cA,cD','sym9');
a3=idwt(cA',cD','sym9');
e1=sum(abs(cA-cA1))+sum(abs(cD-cD1));
e2=sum(abs(a0-a1));
e3=sum(abs(a0-a2));
e4=sum(abs(a0-a3));
e=e1+e2+e3+e4;
if (e<1E-8)
   disp("column vector passes");
else
   error("column vector fails");
end

// void coef
[cA,cD]=dwt(x1,'sym9');
a0=idwt(cA,[],'sym9');
d0=idwt([],cD,'sym9');
[Lo_R,Hi_R]=wfilters('sym9','r');
aa0=wkeep(conv(dyadup(cA),Lo_R),2*length(cA)-length(Lo_R)+2);
dd0=wkeep(conv(dyadup(cD),Hi_R),2*length(cA)-length(Lo_R)+2);
e1=sum(abs(a0-aa0));
e2=sum(abs(d0-dd0));
e=e1+e2;
if (e<1E-8)
   disp("void coef passes");
else
   error("void coef fails");
end

// wavedec
// haar
[cA1,cD1]=dwt(s1,'haar');
[cA2,cD2]=dwt(cA1,'haar');
[cA3,cD3]=dwt(cA2,'haar');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'haar');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec haar passes");
else
   error("wavedec haar fails");
end

// db1
[cA1,cD1]=dwt(s1,'db1');
[cA2,cD2]=dwt(cA1,'db1');
[cA3,cD3]=dwt(cA2,'db1');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db1');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db1 passes");
else
   error("wavedec db1 fails");
end

// db2
[cA1,cD1]=dwt(s1,'db2');
[cA2,cD2]=dwt(cA1,'db2');
[cA3,cD3]=dwt(cA2,'db2');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db2');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db2 passes");
else
   error("wavedec db2 fails");
end

// db3
[cA1,cD1]=dwt(s1,'haar');
[cA2,cD2]=dwt(cA1,'haar');
[cA3,cD3]=dwt(cA2,'haar');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'haar');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec haar passes");
else
   error("wavedec haar fails");
end

// db4
[cA1,cD1]=dwt(s1,'db4');
[cA2,cD2]=dwt(cA1,'db4');
[cA3,cD3]=dwt(cA2,'db4');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db4');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db4 passes");
else
   error("wavedec db4 fails");
end


// db5
[cA1,cD1]=dwt(s1,'db5');
[cA2,cD2]=dwt(cA1,'db5');
[cA3,cD3]=dwt(cA2,'db5');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db5');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db5 passes");
else
   error("wavedec db5 fails");
end

// db6
[cA1,cD1]=dwt(s1,'db6');
[cA2,cD2]=dwt(cA1,'db6');
[cA3,cD3]=dwt(cA2,'db6');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db6');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db6 passes");
else
   error("wavedec db6 fails");
end

// db7
[cA1,cD1]=dwt(s1,'db7');
[cA2,cD2]=dwt(cA1,'db7');
[cA3,cD3]=dwt(cA2,'db7');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db7');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db7 passes");
else
   error("wavedec db7 fails");
end

// db8
[cA1,cD1]=dwt(s1,'db8');
[cA2,cD2]=dwt(cA1,'db8');
[cA3,cD3]=dwt(cA2,'db8');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db8');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db8 passes");
else
   error("wavedec db8 fails");
end

// db9
[cA1,cD1]=dwt(s1,'db9');
[cA2,cD2]=dwt(cA1,'db9');
[cA3,cD3]=dwt(cA2,'db9');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db9');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db9 passes");
else
   error("wavedec db9 fails");
end

// db10
[cA1,cD1]=dwt(s1,'db10');
[cA2,cD2]=dwt(cA1,'db10');
[cA3,cD3]=dwt(cA2,'db10');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'db10');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec db10 passes");
else
   error("wavedec db10 fails");
end

// coif1
[cA1,cD1]=dwt(s1,'coif1');
[cA2,cD2]=dwt(cA1,'coif1');
[cA3,cD3]=dwt(cA2,'coif1');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'coif1');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec coif1 passes");
else
   error("wavedec coif1 fails");
end

// coif2
[cA1,cD1]=dwt(s1,'coif2');
[cA2,cD2]=dwt(cA1,'coif2');
[cA3,cD3]=dwt(cA2,'coif2');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'coif2');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec coif2 passes");
else
   error("wavedec coif2 fails");
end


// coif3
[cA1,cD1]=dwt(s1,'coif3');
[cA2,cD2]=dwt(cA1,'coif3');
[cA3,cD3]=dwt(cA2,'coif3');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'coif3');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec coif3 passes");
else
   error("wavedec coif3 fails");
end

// coif4
[cA1,cD1]=dwt(s1,'coif4');
[cA2,cD2]=dwt(cA1,'coif4');
[cA3,cD3]=dwt(cA2,'coif4');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'coif4');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec coif4 passes");
else
   error("wavedec coif4 fails");
end

// coif5
[cA1,cD1]=dwt(s1,'coif5');
[cA2,cD2]=dwt(cA1,'coif5');
[cA3,cD3]=dwt(cA2,'coif5');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'coif5');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec coif5 passes");
else
   error("wavedec coif5 fails");
end

// sym4
[cA1,cD1]=dwt(s1,'sym4');
[cA2,cD2]=dwt(cA1,'sym4');
[cA3,cD3]=dwt(cA2,'sym4');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'sym4');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sym4 passes");
else
   error("wavedec sym4 fails");
end

// sym5
[cA1,cD1]=dwt(s1,'sym5');
[cA2,cD2]=dwt(cA1,'sym5');
[cA3,cD3]=dwt(cA2,'sym5');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'sym5');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sym5 passes");
else
   error("wavedec sym5 fails");
end

// sym6
[cA1,cD1]=dwt(s1,'sym6');
[cA2,cD2]=dwt(cA1,'sym6');
[cA3,cD3]=dwt(cA2,'sym6');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'sym6');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sym6 passes");
else
   error("wavedec sym6 fails");
end

// sym7
[cA1,cD1]=dwt(s1,'sym7');
[cA2,cD2]=dwt(cA1,'sym7');
[cA3,cD3]=dwt(cA2,'sym7');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'sym7');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sym7 passes");
else
   error("wavedec sym7 fails");
end

// sym8
[cA1,cD1]=dwt(s1,'sym8');
[cA2,cD2]=dwt(cA1,'sym8');
[cA3,cD3]=dwt(cA2,'sym8');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'sym8');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sym8 passes");
else
   error("wavedec sym8 fails");
end

// sym9
[cA1,cD1]=dwt(s1,'sym9');
[cA2,cD2]=dwt(cA1,'sym9');
[cA3,cD3]=dwt(cA2,'sym9');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'sym9');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sym9 passes");
else
   error("wavedec sym9 fails");
end

// sym10
[cA1,cD1]=dwt(s1,'sym10');
[cA2,cD2]=dwt(cA1,'sym10');
[cA3,cD3]=dwt(cA2,'sym10');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'sym10');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sym10 passes");
else
   error("wavedec sym10 fails");
end

// bior1.1
[cA1,cD1]=dwt(s1,'bior1.1');
[cA2,cD2]=dwt(cA1,'bior1.1');
[cA3,cD3]=dwt(cA2,'bior1.1');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior1.1');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior1.1 passes");
else
   error("wavedec bior1.1 fails");
end

// bior1.3
[cA1,cD1]=dwt(s1,'bior1.3');
[cA2,cD2]=dwt(cA1,'bior1.3');
[cA3,cD3]=dwt(cA2,'bior1.3');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior1.3');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior1.3 passes");
else
   error("wavedec bior1.3 fails");
end

// bior1.5
[cA1,cD1]=dwt(s1,'bior1.5');
[cA2,cD2]=dwt(cA1,'bior1.5');
[cA3,cD3]=dwt(cA2,'bior1.5');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior1.5');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior1.5 passes");
else
   error("wavedec bior1.5 fails");
end

// bior2.2
[cA1,cD1]=dwt(s1,'bior2.2');
[cA2,cD2]=dwt(cA1,'bior2.2');
[cA3,cD3]=dwt(cA2,'bior2.2');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior2.2');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior2.2 passes");
else
   error("wavedec bior2.2 fails");
end

// bior2.4
[cA1,cD1]=dwt(s1,'bior2.4');
[cA2,cD2]=dwt(cA1,'bior2.4');
[cA3,cD3]=dwt(cA2,'bior2.4');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior2.4');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior2.4 passes");
else
   error("wavedec bior2.4 fails");
end

// bior2.6
[cA1,cD1]=dwt(s1,'bior2.6');
[cA2,cD2]=dwt(cA1,'bior2.6');
[cA3,cD3]=dwt(cA2,'bior2.6');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior2.6');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior2.6 passes");
else
   error("wavedec bior2.6 fails");
end

// bior2.8
[cA1,cD1]=dwt(s1,'bior2.8');
[cA2,cD2]=dwt(cA1,'bior2.8');
[cA3,cD3]=dwt(cA2,'bior2.8');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior2.8');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior2.8 passes");
else
   error("wavedec bior2.8 fails");
end

// bior3.1
[cA1,cD1]=dwt(s1,'bior3.1');
[cA2,cD2]=dwt(cA1,'bior3.1');
[cA3,cD3]=dwt(cA2,'bior3.1');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior3.1');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior3.1 passes");
else
   error("wavedec bior3.1 fails");
end

// bior3.3
[cA1,cD1]=dwt(s1,'bior3.3');
[cA2,cD2]=dwt(cA1,'bior3.3');
[cA3,cD3]=dwt(cA2,'bior3.3');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior3.3');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior3.3 passes");
else
   error("wavedec bior3.3 fails");
end

// bior3.5
[cA1,cD1]=dwt(s1,'bior3.5');
[cA2,cD2]=dwt(cA1,'bior3.5');
[cA3,cD3]=dwt(cA2,'bior3.5');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior3.5');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior3.5 passes");
else
   error("wavedec bior3.5 fails");
end

// bior3.7
[cA1,cD1]=dwt(s1,'bior3.7');
[cA2,cD2]=dwt(cA1,'bior3.7');
[cA3,cD3]=dwt(cA2,'bior3.7');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior3.7');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior3.7 passes");
else
   error("wavedec bior3.7 fails");
end

// bior3.9
[cA1,cD1]=dwt(s1,'bior3.9');
[cA2,cD2]=dwt(cA1,'bior3.9');
[cA3,cD3]=dwt(cA2,'bior3.9');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,'bior3.9');
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec bior3.9 passes");
else
   error("wavedec bior3.9 fails");
end

// wavedec type 2 iput
Lo_D=rand(1,20,'normal');
Hi_D=rand(1,20,'normal');
[cA1,cD1]=dwt(s1,Lo_D,Hi_D);
[cA2,cD2]=dwt(cA1,Lo_D,Hi_D);
[cA3,cD3]=dwt(cA2,Lo_D,Hi_D);
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
[cA1,cD1]=dwt(s1,'bior3.9');
[cA2,cD2]=dwt(cA1,'bior3.9');
[cA3,cD3]=dwt(cA2,'bior3.9');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e3=sum(abs(c-c0));
e4=sum(abs(l-l0));
e=e1+e2+e3+e4;
if (e<1E-8)
   disp("wavedec type 2 passes");
else
   error("wavedec type 2 fails");
end


// type 3
// asymh
dwtmode('asymh');
[cA1,cD1]=dwt(s1,'bior3.9','mode','asymh');
[cA2,cD2]=dwt(cA1,'bior3.9','mode','asymh');
[cA3,cD3]=dwt(cA2,'bior3.9','mode','asymh');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec asymh passes");
else
   error("wavedec asymh fails");
end

// symw
dwtmode('symw');
[cA1,cD1]=dwt(s1,'bior3.9','mode','symw');
[cA2,cD2]=dwt(cA1,'bior3.9','mode','symw');
[cA3,cD3]=dwt(cA2,'bior3.9','mode','symw');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec symw passes");
else
   error("wavedec symw fails");
end

// asymw
dwtmode('asymw');
[cA1,cD1]=dwt(s1,'bior3.9','mode','asymw');
[cA2,cD2]=dwt(cA1,'bior3.9','mode','asymw');
[cA3,cD3]=dwt(cA2,'bior3.9','mode','asymw');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec asymw passes");
else
   error("wavedec asymw fails");
end

// zpd
dwtmode('zpd');
[cA1,cD1]=dwt(s1,'bior3.9','mode','zpd');
[cA2,cD2]=dwt(cA1,'bior3.9','mode','zpd');
[cA3,cD3]=dwt(cA2,'bior3.9','mode','zpd');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec zpd passes");
else
   error("wavedec zpd fails");
end

// sp0
dwtmode('sp0');
[cA1,cD1]=dwt(s1,'bior3.9','mode','sp0');
[cA2,cD2]=dwt(cA1,'bior3.9','mode','sp0');
[cA3,cD3]=dwt(cA2,'bior3.9','mode','sp0');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sp0 passes");
else
   error("wavedec sp0 fails");
end

// sp1
dwtmode('sp1');
[cA1,cD1]=dwt(s1,'bior3.9','mode','sp1');
[cA2,cD2]=dwt(cA1,'bior3.9','mode','sp1');
[cA3,cD3]=dwt(cA2,'bior3.9','mode','sp1');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec sp1 passes");
else
   error("wavedec sp1 fails");
end

// ppd
dwtmode('ppd');
[cA1,cD1]=dwt(s1,'bior3.9','mode','ppd');
[cA2,cD2]=dwt(cA1,'bior3.9','mode','ppd');
[cA3,cD3]=dwt(cA2,'bior3.9','mode','ppd');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec ppd passes");
else
   error("wavedec ppd fails");
end

// per
dwtmode('per');
[cA1,cD1]=dwt(s1,'bior3.9','mode','per');
[cA2,cD2]=dwt(cA1,'bior3.9','mode','per');
[cA3,cD3]=dwt(cA2,'bior3.9','mode','per');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
c0=[cA3 cD3 cD2 cD1];
l0=[length(cA3) length(cD3) length(cD2) length(cD1) length(s1)];
[c,l]=wavedec(s1,3,Lo_D,Hi_D);
e1=sum(abs(c-c0));
e2=sum(abs(l-l0));
e=e1+e2;
if (e<1E-8)
   disp("wavedec per passes");
else
   error("wavedec per fails");
end
dwtmode("symh");

// waverec
//haar
[c,l]=wavedec(s1,3,'haar');
[cA1,cD1]=dwt(s1,'haar');
[cA2,cD2]=dwt(cA1,'haar');
[cA3,cD3]=dwt(cA2,'haar');
ca2=idwt(cA3,cD3,'haar',length(cA2));
ca1=idwt(ca2,cD2,'haar',length(cA1));
a0=idwt(ca1,cD1,'haar',length(s1));
s0=waverec(c,l,'haar');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, haar, passes");
else
   error("waverec type 1, haar, fails");
end

// db1
[c,l]=wavedec(s1,3,'db1');
[cA1,cD1]=dwt(s1,'db1');
[cA2,cD2]=dwt(cA1,'db1');
[cA3,cD3]=dwt(cA2,'db1');
ca2=idwt(cA3,cD3,'db1',length(cA2));
ca1=idwt(ca2,cD2,'db1',length(cA1));
a0=idwt(ca1,cD1,'db1',length(s1));
s0=waverec(c,l,'db1');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db1, passes");
else
   error("waverec type 1, db1, fails");
end

// db2
[c,l]=wavedec(s1,3,'db2');
[cA1,cD1]=dwt(s1,'db2');
[cA2,cD2]=dwt(cA1,'db2');
[cA3,cD3]=dwt(cA2,'db2');
ca2=idwt(cA3,cD3,'db2',length(cA2));
ca1=idwt(ca2,cD2,'db2',length(cA1));
a0=idwt(ca1,cD1,'db2',length(s1));
s0=waverec(c,l,'db2');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db2, passes");
else
   error("waverec type 1, db2, fails");
end

// db3
[c,l]=wavedec(s1,3,'db3');
[cA1,cD1]=dwt(s1,'db3');
[cA2,cD2]=dwt(cA1,'db3');
[cA3,cD3]=dwt(cA2,'db3');
ca2=idwt(cA3,cD3,'db3',length(cA2));
ca1=idwt(ca2,cD2,'db3',length(cA1));
a0=idwt(ca1,cD1,'db3',length(s1));
s0=waverec(c,l,'db3');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db3, passes");
else
   error("waverec type 1, db3, fails");
end

// db4
[c,l]=wavedec(s1,3,'db4');
[cA1,cD1]=dwt(s1,'db4');
[cA2,cD2]=dwt(cA1,'db4');
[cA3,cD3]=dwt(cA2,'db4');
ca2=idwt(cA3,cD3,'db4',length(cA2));
ca1=idwt(ca2,cD2,'db4',length(cA1));
a0=idwt(ca1,cD1,'db4',length(s1));
s0=waverec(c,l,'db4');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db4, passes");
else
   error("waverec type 1, db4, fails");
end

// db5
[c,l]=wavedec(s1,3,'db5');
[cA1,cD1]=dwt(s1,'db5');
[cA2,cD2]=dwt(cA1,'db5');
[cA3,cD3]=dwt(cA2,'db5');
ca2=idwt(cA3,cD3,'db5',length(cA2));
ca1=idwt(ca2,cD2,'db5',length(cA1));
a0=idwt(ca1,cD1,'db5',length(s1));
s0=waverec(c,l,'db5');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db5, passes");
else
   error("waverec type 1, db5, fails");
end

// db6
[c,l]=wavedec(s1,3,'db6');
[cA1,cD1]=dwt(s1,'db6');
[cA2,cD2]=dwt(cA1,'db6');
[cA3,cD3]=dwt(cA2,'db6');
ca2=idwt(cA3,cD3,'db6',length(cA2));
ca1=idwt(ca2,cD2,'db6',length(cA1));
a0=idwt(ca1,cD1,'db6',length(s1));
s0=waverec(c,l,'db6');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db6, passes");
else
   error("waverec type 1, db6, fails");
end

// db7
[c,l]=wavedec(s1,3,'db7');
[cA1,cD1]=dwt(s1,'db7');
[cA2,cD2]=dwt(cA1,'db7');
[cA3,cD3]=dwt(cA2,'db7');
ca2=idwt(cA3,cD3,'db7',length(cA2));
ca1=idwt(ca2,cD2,'db7',length(cA1));
a0=idwt(ca1,cD1,'db7',length(s1));
s0=waverec(c,l,'db7');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db7, passes");
else
   error("waverec type 1, db7, fails");
end

// db8
[c,l]=wavedec(s1,3,'db8');
[cA1,cD1]=dwt(s1,'db8');
[cA2,cD2]=dwt(cA1,'db8');
[cA3,cD3]=dwt(cA2,'db8');
ca2=idwt(cA3,cD3,'db8',length(cA2));
ca1=idwt(ca2,cD2,'db8',length(cA1));
a0=idwt(ca1,cD1,'db8',length(s1));
s0=waverec(c,l,'db8');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db8, passes");
else
   error("waverec type 1, db8, fails");
end

// db9
[c,l]=wavedec(s1,3,'db9');
[cA1,cD1]=dwt(s1,'db9');
[cA2,cD2]=dwt(cA1,'db9');
[cA3,cD3]=dwt(cA2,'db9');
ca2=idwt(cA3,cD3,'db9',length(cA2));
ca1=idwt(ca2,cD2,'db9',length(cA1));
a0=idwt(ca1,cD1,'db9',length(s1));
s0=waverec(c,l,'db9');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db9, passes");
else
   error("waverec type 1, db9, fails");
end

// db10
[c,l]=wavedec(s1,3,'db10');
[cA1,cD1]=dwt(s1,'db10');
[cA2,cD2]=dwt(cA1,'db10');
[cA3,cD3]=dwt(cA2,'db10');
ca2=idwt(cA3,cD3,'db10',length(cA2));
ca1=idwt(ca2,cD2,'db10',length(cA1));
a0=idwt(ca1,cD1,'db10',length(s1));
s0=waverec(c,l,'db10');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, db10, passes");
else
   error("waverec type 1, db10, fails");
end

// coif1
[c,l]=wavedec(s1,3,'coif1');
[cA1,cD1]=dwt(s1,'coif1');
[cA2,cD2]=dwt(cA1,'coif1');
[cA3,cD3]=dwt(cA2,'coif1');
ca2=idwt(cA3,cD3,'coif1',length(cA2));
ca1=idwt(ca2,cD2,'coif1',length(cA1));
a0=idwt(ca1,cD1,'coif1',length(s1));
s0=waverec(c,l,'coif1');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, coif1, passes");
else
   error("waverec type 1, coif1, fails");
end

// coif2
[c,l]=wavedec(s1,3,'coif2');
[cA1,cD1]=dwt(s1,'coif2');
[cA2,cD2]=dwt(cA1,'coif2');
[cA3,cD3]=dwt(cA2,'coif2');
ca2=idwt(cA3,cD3,'coif2',length(cA2));
ca1=idwt(ca2,cD2,'coif2',length(cA1));
a0=idwt(ca1,cD1,'coif2',length(s1));
s0=waverec(c,l,'coif2');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, coif2, passes");
else
   error("waverec type 1, coif2, fails");
end

// coif3
[c,l]=wavedec(s1,3,'coif3');
[cA1,cD1]=dwt(s1,'coif3');
[cA2,cD2]=dwt(cA1,'coif3');
[cA3,cD3]=dwt(cA2,'coif3');
ca2=idwt(cA3,cD3,'coif3',length(cA2));
ca1=idwt(ca2,cD2,'coif3',length(cA1));
a0=idwt(ca1,cD1,'coif3',length(s1));
s0=waverec(c,l,'coif3');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, coif3, passes");
else
   error("waverec type 1, coif3, fails");
end

// coif4
[c,l]=wavedec(s1,3,'coif4');
[cA1,cD1]=dwt(s1,'coif4');
[cA2,cD2]=dwt(cA1,'coif4');
[cA3,cD3]=dwt(cA2,'coif4');
ca2=idwt(cA3,cD3,'coif4',length(cA2));
ca1=idwt(ca2,cD2,'coif4',length(cA1));
a0=idwt(ca1,cD1,'coif4',length(s1));
s0=waverec(c,l,'coif4');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, coif4, passes");
else
   error("waverec type 1, coif4, fails");
end

// coif5
[c,l]=wavedec(s1,3,'coif5');
[cA1,cD1]=dwt(s1,'coif5');
[cA2,cD2]=dwt(cA1,'coif5');
[cA3,cD3]=dwt(cA2,'coif5');
ca2=idwt(cA3,cD3,'coif5',length(cA2));
ca1=idwt(ca2,cD2,'coif5',length(cA1));
a0=idwt(ca1,cD1,'coif5',length(s1));
s0=waverec(c,l,'coif5');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, coif5, passes");
else
   error("waverec type 1, coif5, fails");
end

// sym4
[c,l]=wavedec(s1,3,'sym4');
[cA1,cD1]=dwt(s1,'sym4');
[cA2,cD2]=dwt(cA1,'sym4');
[cA3,cD3]=dwt(cA2,'sym4');
ca2=idwt(cA3,cD3,'sym4',length(cA2));
ca1=idwt(ca2,cD2,'sym4',length(cA1));
a0=idwt(ca1,cD1,'sym4',length(s1));
s0=waverec(c,l,'sym4');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, sym4, passes");
else
   error("waverec type 1, sym4, fails");
end

// sym5
[c,l]=wavedec(s1,3,'sym5');
[cA1,cD1]=dwt(s1,'sym5');
[cA2,cD2]=dwt(cA1,'sym5');
[cA3,cD3]=dwt(cA2,'sym5');
ca2=idwt(cA3,cD3,'sym5',length(cA2));
ca1=idwt(ca2,cD2,'sym5',length(cA1));
a0=idwt(ca1,cD1,'sym5',length(s1));
s0=waverec(c,l,'sym5');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, sym5, passes");
else
   error("waverec type 1, sym5, fails");
end

// sym6
[c,l]=wavedec(s1,3,'sym6');
[cA1,cD1]=dwt(s1,'sym6');
[cA2,cD2]=dwt(cA1,'sym6');
[cA3,cD3]=dwt(cA2,'sym6');
ca2=idwt(cA3,cD3,'sym6',length(cA2));
ca1=idwt(ca2,cD2,'sym6',length(cA1));
a0=idwt(ca1,cD1,'sym6',length(s1));
s0=waverec(c,l,'sym6');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, sym6, passes");
else
   error("waverec type 1, sym6, fails");
end

// sym7
[c,l]=wavedec(s1,3,'sym7');
[cA1,cD1]=dwt(s1,'sym7');
[cA2,cD2]=dwt(cA1,'sym7');
[cA3,cD3]=dwt(cA2,'sym7');
ca2=idwt(cA3,cD3,'sym7',length(cA2));
ca1=idwt(ca2,cD2,'sym7',length(cA1));
a0=idwt(ca1,cD1,'sym7',length(s1));
s0=waverec(c,l,'sym7');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, sym7, passes");
else
   error("waverec type 1, sym7, fails");
end

// sym8
[c,l]=wavedec(s1,3,'sym8');
[cA1,cD1]=dwt(s1,'sym8');
[cA2,cD2]=dwt(cA1,'sym8');
[cA3,cD3]=dwt(cA2,'sym8');
ca2=idwt(cA3,cD3,'sym8',length(cA2));
ca1=idwt(ca2,cD2,'sym8',length(cA1));
a0=idwt(ca1,cD1,'sym8',length(s1));
s0=waverec(c,l,'sym8');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, sym8, passes");
else
   error("waverec type 1, sym8, fails");
end

// sym9
[c,l]=wavedec(s1,3,'sym9');
[cA1,cD1]=dwt(s1,'sym9');
[cA2,cD2]=dwt(cA1,'sym9');
[cA3,cD3]=dwt(cA2,'sym9');
ca2=idwt(cA3,cD3,'sym9',length(cA2));
ca1=idwt(ca2,cD2,'sym9',length(cA1));
a0=idwt(ca1,cD1,'sym9',length(s1));
s0=waverec(c,l,'sym9');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, sym9, passes");
else
   error("waverec type 1, sym9, fails");
end

// sym10
[c,l]=wavedec(s1,3,'sym10');
[cA1,cD1]=dwt(s1,'sym10');
[cA2,cD2]=dwt(cA1,'sym10');
[cA3,cD3]=dwt(cA2,'sym10');
ca2=idwt(cA3,cD3,'sym10',length(cA2));
ca1=idwt(ca2,cD2,'sym10',length(cA1));
a0=idwt(ca1,cD1,'sym10',length(s1));
s0=waverec(c,l,'sym10');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, sym10, passes");
else
   error("waverec type 1, sym10, fails");
end

// bior1.1
[c,l]=wavedec(s1,3,'bior1.1');
[cA1,cD1]=dwt(s1,'bior1.1');
[cA2,cD2]=dwt(cA1,'bior1.1');
[cA3,cD3]=dwt(cA2,'bior1.1');
ca2=idwt(cA3,cD3,'bior1.1',length(cA2));
ca1=idwt(ca2,cD2,'bior1.1',length(cA1));
a0=idwt(ca1,cD1,'bior1.1',length(s1));
s0=waverec(c,l,'bior1.1');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior1.1, passes");
else
   error("waverec type 1, bior1.1, fails");
end

// bior1.3
[c,l]=wavedec(s1,3,'bior1.3');
[cA1,cD1]=dwt(s1,'bior1.3');
[cA2,cD2]=dwt(cA1,'bior1.3');
[cA3,cD3]=dwt(cA2,'bior1.3');
ca2=idwt(cA3,cD3,'bior1.3',length(cA2));
ca1=idwt(ca2,cD2,'bior1.3',length(cA1));
a0=idwt(ca1,cD1,'bior1.3',length(s1));
s0=waverec(c,l,'bior1.3');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior1.3, passes");
else
   error("waverec type 1, bior1.3, fails");
end

// bior1.5
[c,l]=wavedec(s1,3,'bior1.5');
[cA1,cD1]=dwt(s1,'bior1.5');
[cA2,cD2]=dwt(cA1,'bior1.5');
[cA3,cD3]=dwt(cA2,'bior1.5');
ca2=idwt(cA3,cD3,'bior1.5',length(cA2));
ca1=idwt(ca2,cD2,'bior1.5',length(cA1));
a0=idwt(ca1,cD1,'bior1.5',length(s1));
s0=waverec(c,l,'bior1.5');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior1.5, passes");
else
   error("waverec type 1, bior1.5, fails");
end

// bior2.2
[c,l]=wavedec(s1,3,'bior2.2');
[cA1,cD1]=dwt(s1,'bior2.2');
[cA2,cD2]=dwt(cA1,'bior2.2');
[cA3,cD3]=dwt(cA2,'bior2.2');
ca2=idwt(cA3,cD3,'bior2.2',length(cA2));
ca1=idwt(ca2,cD2,'bior2.2',length(cA1));
a0=idwt(ca1,cD1,'bior2.2',length(s1));
s0=waverec(c,l,'bior2.2');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior2.2, passes");
else
   error("waverec type 1, bior2.2, fails");
end

// bior2.4
[c,l]=wavedec(s1,3,'bior2.4');
[cA1,cD1]=dwt(s1,'bior2.4');
[cA2,cD2]=dwt(cA1,'bior2.4');
[cA3,cD3]=dwt(cA2,'bior2.4');
ca2=idwt(cA3,cD3,'bior2.4',length(cA2));
ca1=idwt(ca2,cD2,'bior2.4',length(cA1));
a0=idwt(ca1,cD1,'bior2.4',length(s1));
s0=waverec(c,l,'bior2.4');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior2.4, passes");
else
   error("waverec type 1, bior2.4, fails");
end

// bior2.6
[c,l]=wavedec(s1,3,'bior2.6');
[cA1,cD1]=dwt(s1,'bior2.6');
[cA2,cD2]=dwt(cA1,'bior2.6');
[cA3,cD3]=dwt(cA2,'bior2.6');
ca2=idwt(cA3,cD3,'bior2.6',length(cA2));
ca1=idwt(ca2,cD2,'bior2.6',length(cA1));
a0=idwt(ca1,cD1,'bior2.6',length(s1));
s0=waverec(c,l,'bior2.6');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior2.6, passes");
else
   error("waverec type 1, bior2.6, fails");
end

// bior2.8
[c,l]=wavedec(s1,3,'bior2.8');
[cA1,cD1]=dwt(s1,'bior2.8');
[cA2,cD2]=dwt(cA1,'bior2.8');
[cA3,cD3]=dwt(cA2,'bior2.8');
ca2=idwt(cA3,cD3,'bior2.8',length(cA2));
ca1=idwt(ca2,cD2,'bior2.8',length(cA1));
a0=idwt(ca1,cD1,'bior2.8',length(s1));
s0=waverec(c,l,'bior2.8');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior2.8, passes");
else
   error("waverec type 1, bior2.8, fails");
end

// bior3.1
[c,l]=wavedec(s1,3,'bior3.1');
[cA1,cD1]=dwt(s1,'bior3.1');
[cA2,cD2]=dwt(cA1,'bior3.1');
[cA3,cD3]=dwt(cA2,'bior3.1');
ca2=idwt(cA3,cD3,'bior3.1',length(cA2));
ca1=idwt(ca2,cD2,'bior3.1',length(cA1));
a0=idwt(ca1,cD1,'bior3.1',length(s1));
s0=waverec(c,l,'bior3.1');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior3.1, passes");
else
   error("waverec type 1, bior3.1, fails");
end

// bior3.3
[c,l]=wavedec(s1,3,'bior3.3');
[cA1,cD1]=dwt(s1,'bior3.3');
[cA2,cD2]=dwt(cA1,'bior3.3');
[cA3,cD3]=dwt(cA2,'bior3.3');
ca2=idwt(cA3,cD3,'bior3.3',length(cA2));
ca1=idwt(ca2,cD2,'bior3.3',length(cA1));
a0=idwt(ca1,cD1,'bior3.3',length(s1));
s0=waverec(c,l,'bior3.3');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior3.3, passes");
else
   error("waverec type 1, bior3.3, fails");
end

// bior3.5
[c,l]=wavedec(s1,3,'bior3.5');
[cA1,cD1]=dwt(s1,'bior3.5');
[cA2,cD2]=dwt(cA1,'bior3.5');
[cA3,cD3]=dwt(cA2,'bior3.5');
ca2=idwt(cA3,cD3,'bior3.5',length(cA2));
ca1=idwt(ca2,cD2,'bior3.5',length(cA1));
a0=idwt(ca1,cD1,'bior3.5',length(s1));
s0=waverec(c,l,'bior3.5');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior3.5, passes");
else
   error("waverec type 1, bior3.5, fails");
end

// bior3.7
[c,l]=wavedec(s1,3,'bior3.7');
[cA1,cD1]=dwt(s1,'bior3.7');
[cA2,cD2]=dwt(cA1,'bior3.7');
[cA3,cD3]=dwt(cA2,'bior3.7');
ca2=idwt(cA3,cD3,'bior3.7',length(cA2));
ca1=idwt(ca2,cD2,'bior3.7',length(cA1));
a0=idwt(ca1,cD1,'bior3.7',length(s1));
s0=waverec(c,l,'bior3.7');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior3.7, passes");
else
   error("waverec type 1, bior3.7, fails");
end

// bior3.9
[c,l]=wavedec(s1,3,'bior3.9');
[cA1,cD1]=dwt(s1,'bior3.9');
[cA2,cD2]=dwt(cA1,'bior3.9');
[cA3,cD3]=dwt(cA2,'bior3.9');
ca2=idwt(cA3,cD3,'bior3.9',length(cA2));
ca1=idwt(ca2,cD2,'bior3.9',length(cA1));
a0=idwt(ca1,cD1,'bior3.9',length(s1));
s0=waverec(c,l,'bior3.9');
e=sum(abs(a0-s0));
if (e<1E-8)
   disp("waverec type 1, bior3.9, passes");
else
   error("waverec type 1, bior3.9, fails");
end

// type 2
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('bior3.9');
[c,l]=wavedec(s1,3,'bior3.9');
s0=waverec(c,l,Lo_R,Hi_R);
[cA1,cD1]=dwt(s1,'bior3.9');
[cA2,cD2]=dwt(cA1,'bior3.9');
[cA3,cD3]=dwt(cA2,'bior3.9');
ca2=idwt(cA3,cD3,'bior3.9',length(cA2));
ca1=idwt(ca2,cD2,'bior3.9',length(cA1));
a0=idwt(ca1,cD1,'bior3.9',length(s1));
e1=sum(abs(a0-s0));
Lo_R=rand(1,length(Lo_D),'normal');
Hi_R=rand(1,length(Lo_D),'normal');
ca2=idwt(cA3,cD3,Lo_R,Hi_R,length(cA2));
ca1=idwt(ca2,cD2,Lo_R,Hi_R,length(cA1));
a0=idwt(ca1,cD1,Lo_R,Hi_R,length(s1));
s0=waverec(c,l,Lo_R,Hi_R);
e2=sum(abs(a0-s0));
e=e1+e2;
if (e<1E-8)
   disp("waverec type 2, passes");
else
   error("waverec type 2, fails");
end


// type 3
dwtmode("symh");
[c,l]=wavedec(s1,3,'bior3.9');
a0=waverec(c,l,'bior3.9');
dwtmode("symw");
a1=waverec(c,l,'bior3.9');
dwtmode("asymh");
a2=waverec(c,l,'bior3.9');
dwtmode("asymw");
a3=waverec(c,l,'bior3.9');
dwtmode("zpd");
a4=waverec(c,l,'bior3.9');
dwtmode("sp0");
a5=waverec(c,l,'bior3.9');
dwtmode("sp1");
a6=waverec(c,l,'bior3.9');
dwtmode("ppd");
a7=waverec(c,l,'bior3.9');
dwtmode("per");
a8=waverec(c,l,'bior3.9');
dwtmode("symh");
e1=sum(abs(a0-a1));
e2=sum(abs(a0-a2));
e3=sum(abs(a0-a3));
e4=sum(abs(a0-a4));
e5=sum(abs(a0-a5));
e6=sum(abs(a0-a6));
e7=sum(abs(a0-a7));
e8=sum(abs(a0-a8));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
   disp("waverec type 3, passes");
else
   error("waverec type 3, fails");
end

// detcoef
[c,l]=wavedec(s1,3,'sym10');
[cA1,cD1]=dwt(s1,'sym10');
[cA2,cD2]=dwt(cA1,'sym10');
[cA3,cD3]=dwt(cA2,'sym10');
cdd3=detcoef(c,l);
cd3=detcoef(c,l,3);
cd2=detcoef(c,l,2);
cd1=detcoef(c,l,1);
e1=sum(abs(cdd3-cD3));
e2=sum(abs(cd3-cD3));
e3=sum(abs(cd2-cD2));
e4=sum(abs(cd1-cD1));
e=e1+e2+e3+e4;
if (e<1E-8)
   disp("detcoef passes");
else
   error("detcoef fails");
end

// appcoef
[c,l]=wavedec(s1,3,'sym10');
[cA1,cD1]=dwt(s1,'sym10');
[cA2,cD2]=dwt(cA1,'sym10');
[cA3,cD3]=dwt(cA2,'sym10');
[Lo_R,Hi_R]=wfilters('sym10','r');
cAA2=idwt(cA3,cD3,'sym10',length(cA2));
cAA1=idwt(cAA2,cD2,'sym10',length(cA1));
ca31=appcoef(c,l,'sym10');
ca32=appcoef(c,l,'sym10',3);
ca33=appcoef(c,l,Lo_R,Hi_R);
ca34=appcoef(c,l,Lo_R,Hi_R,3);
ca21=appcoef(c,l,'sym10',2);
ca22=appcoef(c,l,Lo_R,Hi_R,2);
ca11=appcoef(c,l,'sym10',1);
ca12=appcoef(c,l,Lo_R,Hi_R,1);
e1=sum(abs(ca31-cA3));
e2=sum(abs(ca32-cA3));
e3=sum(abs(ca33-cA3));
e4=sum(abs(ca21-cAA2));
e5=sum(abs(ca22-cAA2));
e6=sum(abs(ca11-cAA1));
e7=sum(abs(ca12-cAA1));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
   disp("appcoef passes");
else
   error("appcoef fails");
end

// wenergy
[c,l]=wavedec(s1,3,'db10');
[cA1,cD1]=dwt(s1,'db10');
[cA2,cD2]=dwt(cA1,'db10');
[cA3,cD3]=dwt(cA2,'db10');
ea=sum(cA3.*cA3);
ed1=sum(cD1.*cD1);
ed2=sum(cD2.*cD2);
ed3=sum(cD3.*cD3);
energy=sum(c.*c);
ea=ea*100/energy;
ed1=ed1*100/energy;
ed2=ed2*100/energy;
ed3=ed3*100/energy;
[Ea,Ed]=wenergy(c,l);
e=sum(abs(ea-Ea))+sum(abs(Ed-[ed3 ed2 ed1]));
if (e<1E-8)
   disp("wenergy passes");
else
   error("wenergy fails");
end
clear c;
clear l;
clear cA1;
clear cD1;
clear cA2;
clear cD2;
clear cA3;
clear cD3;
clear ea;
clear ed1;
clear ed2;
clear ed3;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear Lo_D;
clear Lo_R;
clear Hi_D;
clear Hi_R;
clear energy;
clear x1;
clear x2;
clear s1;
clear ca11;
clear ca12;
clear ca21;
clear ca22;
clear ca31;
clear ca32;
clear ca33;
clear energy;
clear a0;
clear a1;
clear a2;
clear a3;
clear a4;
clear a5;
clear a6;
clear a7;
clear a8;
clear s0;
clear Ea;
clear Ed;
clear ca34;
clear cAA1;
clear cAA2;
clear cd1;
clear cd2;
clear cd3;
clear cdd3;
clear ca1;
clear ca2;
clear c0;
clear l0;
clear cA;
clear cD;
clear xx1;
clear r;
clear cdd;
clear caa;
clear aa0;
clear dd0;
clear d1;
clear d2;
clear d0;
clear x0;

// wrcoef
loadmatfile("-mat",testpath+"/Data.mat");;
[c,l]=wavedec(s1,3,'sym10');
a3=wrcoef('a',c,l,'sym10');
aa3=wrcoef('a',c,l,'sym10',3);
a2=wrcoef('a',c,l,'sym10',2);
a1=wrcoef('a',c,l,'sym10',1);
d3=wrcoef('d',c,l,'sym10');
dd3=wrcoef('d',c,l,'sym10',3);
d2=wrcoef('d',c,l,'sym10',2);
d1=wrcoef('d',c,l,'sym10',1);
[cA1,cD1]=dwt(s1,'sym10');
[cA2,cD2]=dwt(cA1,'sym10');
[cA3,cD3]=dwt(cA2,'sym10');
A3=waverec([cA3,zeros(1,length(cA3)+length(cD2)+length(cD1))],l,'sym10');
A2=waverec([cA3,cD3,zeros(1,length(cD2)+length(cD1))],l,'sym10');
A1=waverec([cA3,cD3,cD2,zeros(1,length(cD1))],l,'sym10');
D3=waverec([zeros(1,length(cA3)),cD3,zeros(1,length(cD2)+length(cD1))],l,'sym10');
D2=waverec([zeros(1,length(cA3)+length(cD3)),cD2,zeros(1,length(cD1))],l,'sym10');
D1=waverec([zeros(1,length(cA3)+length(cD3)+length(cD2)),cD1],l,'sym10');
e1=sum(abs(a3-A3));
e2=sum(abs(aa3-A3));
e3=sum(abs(a2-A2));
e4=sum(abs(a1-A1));
e5=sum(abs(d3-D3));
e6=sum(abs(dd3-D3));
e7=sum(abs(d2-D2));
e8=sum(abs(d1-D1));
e=e1+e2+e3+e4+e5+e6+e7+e8;
[Lo_R,Hi_R]=wfilters('sym10','r');
a3=wrcoef('a',c,l,Lo_R,Hi_R);
aa3=wrcoef('a',c,l,Lo_R,Hi_R,3);
a2=wrcoef('a',c,l,Lo_R,Hi_R,2);
a1=wrcoef('a',c,l,Lo_R,Hi_R,1);
d3=wrcoef('d',c,l,Lo_R,Hi_R);
dd3=wrcoef('d',c,l,Lo_R,Hi_R,3);
d2=wrcoef('d',c,l,Lo_R,Hi_R,2);
d1=wrcoef('d',c,l,Lo_R,Hi_R,1);
[cA1,cD1]=dwt(s1,'sym10');
[cA2,cD2]=dwt(cA1,'sym10');
[cA3,cD3]=dwt(cA2,'sym10');
A3=waverec([cA3,zeros(1,length(cA3)+length(cD2)+length(cD1))],l,'sym10');
A2=waverec([cA3,cD3,zeros(1,length(cD2)+length(cD1))],l,'sym10');
A1=waverec([cA3,cD3,cD2,zeros(1,length(cD1))],l,'sym10');
D3=waverec([zeros(1,length(cA3)),cD3,zeros(1,length(cD2)+length(cD1))],l,'sym10');
D2=waverec([zeros(1,length(cA3)+length(cD3)),cD2,zeros(1,length(cD1))],l,'sym10');
D1=waverec([zeros(1,length(cA3)+length(cD3)+length(cD2)),cD1],l,'sym10');
e1=sum(abs(a3-A3));
e2=sum(abs(aa3-A3));
e3=sum(abs(a2-A2));
e4=sum(abs(a1-A1));
e5=sum(abs(d3-D3));
e6=sum(abs(dd3-D3));
e7=sum(abs(d2-D2));
e8=sum(abs(d1-D1));
e=e1+e2+e3+e4+e5+e6+e7+e8+e;
if (e<1E-8)
   disp("wrcoef passes");
else
   error("wrcoef fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear cA1;
clear cA2;
clear cA3;
clear cD1;
clear cD2;
clear cD3;
clear A1;
clear A2;
clear A3;
clear D1;
clear D2;
clear D3;
clear a3;
clear aa3;
clear a2;
clear a1;
clear dd;
clear d3;
clear d2;
clear d1;
clear c;
clear l;
clear x1;
clear x2;
clear s1;
clear d1;
clear d2;


// upwlev
loadmatfile("-mat",testpath+"/Data.mat");
[c,l]=wavedec(s1,3,'sym10');
[cA1,cD1]=dwt(s1,'sym10');
[cA2,cD2]=dwt(cA1,'sym10');
[cA3,cD3]=dwt(cA2,'sym10');
[c2,l2,ca3]=upwlev(c,l,'sym10');
a3=c(1:length(cA3));
aa2=idwt(cA3,cD3,'sym10',length(cA2));
cc2=[aa2,c(length(cA3)+length(cD3)+1:$)];
ll2=[l(3),l(3:$)];
e1=sum(abs(a3-ca3));
e2=sum(abs(cc2-c2));
e3=sum(abs(ll2-l2));
[Lo_R,Hi_R]=wfilters('sym10','r');
[c2,l2,ca3]=upwlev(c,l,Lo_R,Hi_R);
e4=sum(abs(a3-ca3));
e5=sum(abs(cc2-c2));
e6=sum(abs(ll2-l2));
e=e1+e2+e3+e4+e5+e6;
if (e<1E-8)
   disp("upwlev passes");
else
   error("upwlev fails");
end
clear x1;
clear x2;
clear s1;
clear d1;
clear d2;
clear Lo_R;
clear Hi_R;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear c;
clear l;
clear cA1;
clear cA2;
clear cA3;
clear cD1;
clear cD2;
clear cD3;
clear a3;
clear aa2;
clear ll2;
clear l2;
clear cc2;
clear a3;
clear c2;
clear l2;
clear ca3;

// upcoef
 a=rand(1,50,'normal');
 [Lo_R,Hi_R]=wfilters('sym10','r');
x1=idwt(a,[],'sym10');
x2=idwt(a,[],'sym10',25);
x22=idwt(x1,[],'sym10');
x3=idwt(x22,[],'sym10');
x33=idwt(x22,[],'sym10',25);
y1=upcoef('a',a,'sym10');
y2=upcoef('a',a,Lo_R,Hi_R);
y3=upcoef('a',a,'sym10',1,25);
y4=upcoef('a',a,Lo_R,Hi_R,1,25);
y5=upcoef('a',a,'sym10',1);
y6=upcoef('a',a,Lo_R,Hi_R,1);
y7=upcoef('a',a,'sym10',3);
y8=upcoef('a',a,Lo_R,Hi_R,3);
y9=upcoef('a',a,'sym10',3,25);
y10=upcoef('a',a,Lo_R,Hi_R,3,25);
e1=sum(abs(x1-y1));
e2=sum(abs(x1-y2));
e3=sum(abs(x2-y3));
e4=sum(abs(x2-y4));
e5=sum(abs(x1-y5));
e6=sum(abs(x1-y6));
e7=sum(abs(x3-y7));
e8=sum(abs(x3-y8));
e9=sum(abs(x33-y9));
e10=sum(abs(x33-y10));
e=e1+e2+e3+e4+e5+e6+e7+e8+e9+e10;
if (e<1E-8)
   disp("upcoef approximation passes");
else
   error("upcoef approximiation fails");
end

d=rand(1,50,'normal');
x1=idwt([],d,'sym10');
x2=idwt([],d,'sym10',25);
x22=idwt(x1,[],'sym10');
x3=idwt(x22,[],'sym10');
x33=idwt(x22,[],'sym10',25);
y1=upcoef('d',d,'sym10');
y2=upcoef('d',d,Lo_R,Hi_R);
y3=upcoef('d',d,'sym10',1,25);
y4=upcoef('d',d,Lo_R,Hi_R,1,25);
y5=upcoef('d',d,'sym10',1);
y6=upcoef('d',d,Lo_R,Hi_R,1);
y7=upcoef('d',d,'sym10',3);
y8=upcoef('d',d,Lo_R,Hi_R,3);
y9=upcoef('d',d,'sym10',3,25);
y10=upcoef('d',d,Lo_R,Hi_R,3,25);
e1=sum(abs(x1-y1));
e2=sum(abs(x1-y2));
e3=sum(abs(x2-y3));
e4=sum(abs(x2-y4));
e5=sum(abs(x1-y5));
e6=sum(abs(x1-y6));
e7=sum(abs(x3-y7));
e8=sum(abs(x3-y8));
e9=sum(abs(x33-y9));
e10=sum(abs(x33-y10));
e=e1+e2+e3+e4+e5+e6+e7+e8+e9+e10;
if (e<1E-8)
   disp("upcoef detail passes");
else
   error("upcoef detail fails");
end

clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear e9;
clear e10;
clear a;
clear d;
clear x1;
clear x2;
clear x3;
clear x22;
clear x33;
clear y1;
clear y2;
clear y3;
clear y4;
clear y5;
clear y6;
clear y7;
clear y8;
clear y9;
clear y10;

disp("one dimensional dwt test finish!");
