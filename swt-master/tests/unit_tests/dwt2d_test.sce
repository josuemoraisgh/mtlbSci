mode(-1);lines(0);
// 2d test
disp("dwt 2d test!");
testpath = get_absolute_file_path("dwt2d_test.sce");
// dwt2 test
loadmatfile("-mat",testpath+"/Data.mat");
clear row_low;
clear row_hi;	
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
// haar
[cA,cH,cV,cD]=dwt2(d1,'haar');
[Lo_D,Hi_D]=wfilters('haar','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input haar passes");
else
  error("type 1 input haar fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db1
[cA,cH,cV,cD]=dwt2(d1,'db1');
[Lo_D,Hi_D]=wfilters('db1','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db1 passes");
else
  error("type 1 input db1 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db2
[cA,cH,cV,cD]=dwt2(d1,'db2');
[Lo_D,Hi_D]=wfilters('db2','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db2 passes");
else
  error("type 1 input db2 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db3
[cA,cH,cV,cD]=dwt2(d1,'db3');
[Lo_D,Hi_D]=wfilters('db3','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db3 passes");
else
  error("type 1 input db3 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db4
[cA,cH,cV,cD]=dwt2(d1,'db4');
[Lo_D,Hi_D]=wfilters('db4','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db4 passes");
else
  error("type 1 input db4 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db5
[cA,cH,cV,cD]=dwt2(d1,'db5');
[Lo_D,Hi_D]=wfilters('db5','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db5 passes");
else
  error("type 1 input db5 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db6
[cA,cH,cV,cD]=dwt2(d1,'db6');
[Lo_D,Hi_D]=wfilters('db6','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db6 passes");
else
  error("type 1 input db6 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db7
[cA,cH,cV,cD]=dwt2(d1,'db7');
[Lo_D,Hi_D]=wfilters('db7','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db7 passes");
else
  error("type 1 input db7 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db8
[cA,cH,cV,cD]=dwt2(d1,'db8');
[Lo_D,Hi_D]=wfilters('db8','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db8 passes");
else
  error("type 1 input db8 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db9
[cA,cH,cV,cD]=dwt2(d1,'db9');
[Lo_D,Hi_D]=wfilters('db9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db9 passes");
else
  error("type 1 input db9 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// db10
[cA,cH,cV,cD]=dwt2(d1,'db10');
[Lo_D,Hi_D]=wfilters('db10','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input db10 passes");
else
  error("type 1 input db10 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// coif1
[cA,cH,cV,cD]=dwt2(d1,'coif1');
[Lo_D,Hi_D]=wfilters('coif1','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input coif1 passes");
else
  error("type 1 input coif1 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;


// coif2
[cA,cH,cV,cD]=dwt2(d1,'coif2');
[Lo_D,Hi_D]=wfilters('coif2','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input coif2 passes");
else
  error("type 1 input coif2 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// coif3
[cA,cH,cV,cD]=dwt2(d1,'coif3');
[Lo_D,Hi_D]=wfilters('coif3','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input coif3 passes");
else
  error("type 1 input coif3 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// coif4
[cA,cH,cV,cD]=dwt2(d1,'coif4');
[Lo_D,Hi_D]=wfilters('coif4','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input coif4 passes");
else
  error("type 1 input coif4 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// coif5
[cA,cH,cV,cD]=dwt2(d1,'coif5');
[Lo_D,Hi_D]=wfilters('coif5','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input coif5 passes");
else
  error("type 1 input coif5 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sym4
[cA,cH,cV,cD]=dwt2(d1,'sym4');
[Lo_D,Hi_D]=wfilters('sym4','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sym4 passes");
else
  error("type 1 input sym4 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sym5
[cA,cH,cV,cD]=dwt2(d1,'sym5');
[Lo_D,Hi_D]=wfilters('sym5','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sym5 passes");
else
  error("type 1 input sym5 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sym6
[cA,cH,cV,cD]=dwt2(d1,'sym6');
[Lo_D,Hi_D]=wfilters('sym6','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sym6 passes");
else
  error("type 1 input sym6 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sym7
[cA,cH,cV,cD]=dwt2(d1,'sym7');
[Lo_D,Hi_D]=wfilters('sym7','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sym7 passes");
else
  error("type 1 input sym7 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sym8
[cA,cH,cV,cD]=dwt2(d1,'sym8');
[Lo_D,Hi_D]=wfilters('sym8','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sym8 passes");
else
  error("type 1 input sym8 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sym9
[cA,cH,cV,cD]=dwt2(d1,'sym9');
[Lo_D,Hi_D]=wfilters('sym9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sym9 passes");
else
  error("type 1 input sym9 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sym10
[cA,cH,cV,cD]=dwt2(d1,'sym10');
[Lo_D,Hi_D]=wfilters('sym10','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sym10 passes");
else
  error("type 1 input sym10 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior1.1
[cA,cH,cV,cD]=dwt2(d1,'bior1.1');
[Lo_D,Hi_D]=wfilters('bior1.1','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior1.1 passes");
else
  error("type 1 input bior1.1 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior1.3
[cA,cH,cV,cD]=dwt2(d1,'bior1.3');
[Lo_D,Hi_D]=wfilters('bior1.3','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior1.3 passes");
else
  error("type 1 input bior1.3 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior1.5
[cA,cH,cV,cD]=dwt2(d1,'bior1.5');
[Lo_D,Hi_D]=wfilters('bior1.5','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior1.5 passes");
else
  error("type 1 input bior1.5 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior2.2
[cA,cH,cV,cD]=dwt2(d1,'bior2.2');
[Lo_D,Hi_D]=wfilters('bior2.2','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior2.2 passes");
else
  error("type 1 input bior2.2 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior2.4
[cA,cH,cV,cD]=dwt2(d1,'bior2.4');
[Lo_D,Hi_D]=wfilters('bior2.4','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior2.4 passes");
else
  error("type 1 input bior2.4 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior2.6
[cA,cH,cV,cD]=dwt2(d1,'bior2.6');
[Lo_D,Hi_D]=wfilters('bior2.6','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior2.6 passes");
else
  error("type 1 input bior2.6 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior2.8
[cA,cH,cV,cD]=dwt2(d1,'bior2.8');
[Lo_D,Hi_D]=wfilters('bior2.8','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior2.8 passes");
else
  error("type 1 input bior2.8 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior3.1
[cA,cH,cV,cD]=dwt2(d1,'bior3.1');
[Lo_D,Hi_D]=wfilters('bior3.1','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior3.1 passes");
else
  error("type 1 input bior3.1 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior3.3
[cA,cH,cV,cD]=dwt2(d1,'bior3.3');
[Lo_D,Hi_D]=wfilters('bior3.3','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior3.3 passes");
else
  error("type 1 input bior3.3 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior3.5
[cA,cH,cV,cD]=dwt2(d1,'bior3.5');
[Lo_D,Hi_D]=wfilters('bior3.5','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior3.5 passes");
else
  error("type 1 input bior3.5 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior3.7
[cA,cH,cV,cD]=dwt2(d1,'bior3.7');
[Lo_D,Hi_D]=wfilters('bior3.7','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior3.7 passes");
else
  error("type 1 input bior3.7 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// bior3.9
[cA,cH,cV,cD]=dwt2(d1,'bior3.9');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D);
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input bior3.9 passes");
else
  error("type 1 input bior3.9 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// symh

[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','symh');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','symh');
m_ex=wextend(2,'symh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input symh passes");
else
  error("type 1 input symh fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// symw
[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','symw');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','symw');
m_ex=wextend(2,'symw',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input symw passes");
else
  error("type 1 input symw fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// asymh
[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','asymh');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','asymh');
m_ex=wextend(2,'asymh',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input asymh passes");
else
  error("type 1 input asymh fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// asymw
[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','asymw');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','asymw');
m_ex=wextend(2,'asymw',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input asymw passes");
else
  error("type 1 input asymw fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// zpd
[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','zpd');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','zpd');
m_ex=wextend(2,'zpd',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input zpd passes");
else
  error("type 1 input zpd fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sp0
[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','sp0');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','sp0');
m_ex=wextend(2,'sp0',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sp0 passes");
else
  error("type 1 input sp0 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// sp1
[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','sp1');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','sp1');
m_ex=wextend(2,'sp1',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input sp1 passes");
else
  error("type 1 input sp1 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// ppd
[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','ppd');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','ppd');
m_ex=wextend(2,'ppd',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+length(Lo_D)-1 c+length(Lo_D)-1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input ppd passes");
else
  error("type 1 input ppd fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

// per
[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','per');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(d1,Lo_D,Hi_D,'mode','per');
m_ex=wextend(2,'per',d1,length(Lo_D));
[r,c]=size(d1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r c]),'m');
cch=dyaddown(wkeep(col_low_hi,[r c]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r c]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r c]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input per passes");
else
  error("type 1 input per fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;

dd1=rand(51,51,'normal');
[cA,cH,cV,cD]=dwt2(dd1,'bior3.9','mode','per');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[ccA,ccH,ccV,ccD]=dwt2(dd1,Lo_D,Hi_D,'mode','per');
m_ex=wextend(2,'per',dd1,length(Lo_D));
[r,c]=size(dd1);
[rex,cex]=size(m_ex);
for i=1:rex,
  row_low(i,:)=conv(Lo_D,m_ex(i,:));
  row_hi(i,:)=conv(Hi_D,m_ex(i,:));
end
[rrex,ccex]=size(row_low);
for i=1:ccex,
  col_low_low(:,i)=conv(Lo_D,row_low(:,i));
  col_low_hi(:,i)=(conv(Hi_D,row_low(:,i)));
  col_hi_low(:,i)=(conv(Lo_D,row_hi(:,i)));
  col_hi_hi(:,i)=(conv(Hi_D,row_hi(:,i)));
end
cca=dyaddown(wkeep(col_low_low,[r+1 c+1]),'m');
cch=dyaddown(wkeep(col_low_hi,[r+1 c+1]),'m');
ccv=dyaddown(wkeep(col_hi_low,[r+1 c+1]),'m');
ccd=dyaddown(wkeep(col_hi_hi,[r+1 c+1]),'m');
e1=sum(abs(cA-cca));
e2=sum(abs(cH-cch));
e3=sum(abs(cV-ccv));
e4=sum(abs(cD-ccd));
e5=sum(abs(ccA-cca));
e6=sum(abs(ccH-cch));
e7=sum(abs(ccV-ccv));
e8=sum(abs(ccD-ccd));
e=e1+e2+e3+e4+e5+e6+e7+e8;
if (e<1E-8)
  disp("type 1 input per passes");
else
  error("type 1 input per fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear e5;
clear e6;
clear e7;
clear e8;
clear m_ex;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear cca;
clear cch;
clear ccv;
clear ccd;
clear r;
clear c;
clear rex;
clear cex;
clear rrex;
clear ccex;
clear dd1;
clear x1;
clear x2;
clear d1;
clear d2;

clear row_low_r;
clear row_hi_r;
// idwt2
//loadmatfile("-mat","Data.mat");
d1=rand(64,65,'normal');
// haar
[cA,cH,cV,cD]=dwt2(d1,'haar');
[Lo_R,Hi_R]=wfilters('haar','r');
dd0=idwt2(cA,cH,cV,cD,'haar');
dd1=idwt2(cA,cH,cV,cD,'haar',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 haar passes");
else
  error("idwt2 haar fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// db1
[cA,cH,cV,cD]=dwt2(d1,'db1');
[Lo_R,Hi_R]=wfilters('db1','r');
dd0=idwt2(cA,cH,cV,cD,'db1');
dd1=idwt2(cA,cH,cV,cD,'db1',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db1 passes");
else
  error("idwt2 db1 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear row_low_r;
clear row_hi_r;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;


// db2
[cA,cH,cV,cD]=dwt2(d1,'db2');
[Lo_R,Hi_R]=wfilters('db2','r');
dd0=idwt2(cA,cH,cV,cD,'db2');
dd1=idwt2(cA,cH,cV,cD,'db2',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db2 passes");
else
  error("idwt2 db2 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// db3
[cA,cH,cV,cD]=dwt2(d1,'db3');
[Lo_R,Hi_R]=wfilters('db3','r');
dd0=idwt2(cA,cH,cV,cD,'db3');
dd1=idwt2(cA,cH,cV,cD,'db3',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db3 passes");
else
  error("idwt2 db3 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// db4
[cA,cH,cV,cD]=dwt2(d1,'db4');
[Lo_R,Hi_R]=wfilters('db4','r');
dd0=idwt2(cA,cH,cV,cD,'db4');
dd1=idwt2(cA,cH,cV,cD,'db4',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db4 passes");
else
  error("idwt2 db4 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// db5
[cA,cH,cV,cD]=dwt2(d1,'db5');
[Lo_R,Hi_R]=wfilters('db5','r');
dd0=idwt2(cA,cH,cV,cD,'db5');
dd1=idwt2(cA,cH,cV,cD,'db5',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db5 passes");
else
  error("idwt2 db5 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// db6
[cA,cH,cV,cD]=dwt2(d1,'db6');
[Lo_R,Hi_R]=wfilters('db6','r');
dd0=idwt2(cA,cH,cV,cD,'db6');
dd1=idwt2(cA,cH,cV,cD,'db6',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db6 passes");
else
  error("idwt2 db6 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// db7
[cA,cH,cV,cD]=dwt2(d1,'db7');
[Lo_R,Hi_R]=wfilters('db7','r');
dd0=idwt2(cA,cH,cV,cD,'db7');
dd1=idwt2(cA,cH,cV,cD,'db7',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db7 passes");
else
  error("idwt2 db7 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// db8
[cA,cH,cV,cD]=dwt2(d1,'db8');
[Lo_R,Hi_R]=wfilters('db8','r');
dd0=idwt2(cA,cH,cV,cD,'db8');
dd1=idwt2(cA,cH,cV,cD,'db8',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db8 passes");
else
  error("idwt2 db8 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// db9
[cA,cH,cV,cD]=dwt2(d1,'db9');
[Lo_R,Hi_R]=wfilters('db9','r');
dd0=idwt2(cA,cH,cV,cD,'db9');
dd1=idwt2(cA,cH,cV,cD,'db9',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db9 passes");
else
  error("idwt2 db9 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;



// db10
[cA,cH,cV,cD]=dwt2(d1,'db10');
[Lo_R,Hi_R]=wfilters('db10','r');
dd0=idwt2(cA,cH,cV,cD,'db10');
dd1=idwt2(cA,cH,cV,cD,'db10',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 db10 passes");
else
  error("idwt2 db10 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// coif1
[cA,cH,cV,cD]=dwt2(d1,'coif1');
[Lo_R,Hi_R]=wfilters('coif1','r');
dd0=idwt2(cA,cH,cV,cD,'coif1');
dd1=idwt2(cA,cH,cV,cD,'coif1',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 coif1 passes");
else
  error("idwt2 coif1 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// coif2
[cA,cH,cV,cD]=dwt2(d1,'coif2');
[Lo_R,Hi_R]=wfilters('coif2','r');
dd0=idwt2(cA,cH,cV,cD,'coif2');
dd1=idwt2(cA,cH,cV,cD,'coif2',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 coif2 passes");
else
  error("idwt2 coif2 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// coif3
[cA,cH,cV,cD]=dwt2(d1,'coif3');
[Lo_R,Hi_R]=wfilters('coif3','r');
dd0=idwt2(cA,cH,cV,cD,'coif3');
dd1=idwt2(cA,cH,cV,cD,'coif3',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 coif3 passes");
else
  error("idwt2 coif3 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// coif4
[cA,cH,cV,cD]=dwt2(d1,'coif4');
[Lo_R,Hi_R]=wfilters('coif4','r');
dd0=idwt2(cA,cH,cV,cD,'coif4');
if exists('dd0')
dd1=idwt2(cA,cH,cV,cD,'coif4',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 coif4 passes");
else
  error("idwt2 coif4 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;
end

// coif5
[cA,cH,cV,cD]=dwt2(d1,'coif5');
[Lo_R,Hi_R]=wfilters('coif5','r');
dd0=idwt2(cA,cH,cV,cD,'coif5');
if exists('dd0')
dd1=idwt2(cA,cH,cV,cD,'coif5',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 coif5 passes");
else
  error("idwt2 coif5 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;
end

// sym4
[cA,cH,cV,cD]=dwt2(d1,'sym4');
[Lo_R,Hi_R]=wfilters('sym4','r');
dd0=idwt2(cA,cH,cV,cD,'sym4');
if exists('dd0')
dd1=idwt2(cA,cH,cV,cD,'sym4',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 sym4 passes");
else
  error("idwt2 sym4 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;
end

// sym5
[cA,cH,cV,cD]=dwt2(d1,'sym5');
[Lo_R,Hi_R]=wfilters('sym5','r');
dd0=idwt2(cA,cH,cV,cD,'sym5');
if exists('dd0')
dd1=idwt2(cA,cH,cV,cD,'sym5',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 sym5 passes");
else
  error("idwt2 sym5 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;
end

// sym6
[cA,cH,cV,cD]=dwt2(d1,'sym6');
[Lo_R,Hi_R]=wfilters('sym6','r');
dd0=idwt2(cA,cH,cV,cD,'sym6');
if exists('dd0')
dd1=idwt2(cA,cH,cV,cD,'sym6',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 sym6 passes");
else
  error("idwt2 sym6 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;
end

// sym7
[cA,cH,cV,cD]=dwt2(d1,'sym7');
[Lo_R,Hi_R]=wfilters('sym7','r');
dd0=idwt2(cA,cH,cV,cD,'sym7');
if exists('dd0')
dd1=idwt2(cA,cH,cV,cD,'sym7',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 sym7 passes");
else
  error("idwt2 sym7 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;
end

// sym8
[cA,cH,cV,cD]=dwt2(d1,'sym8');
[Lo_R,Hi_R]=wfilters('sym8','r');
dd0=idwt2(cA,cH,cV,cD,'sym8');
dd1=idwt2(cA,cH,cV,cD,'sym8',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 sym8 passes");
else
  error("idwt2 sym8 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// sym9
[cA,cH,cV,cD]=dwt2(d1,'sym9');
[Lo_R,Hi_R]=wfilters('sym9','r');
dd0=idwt2(cA,cH,cV,cD,'sym9');
dd1=idwt2(cA,cH,cV,cD,'sym9',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 sym9 passes");
else
  error("idwt2 sym9 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// sym10
[cA,cH,cV,cD]=dwt2(d1,'sym10');
[Lo_R,Hi_R]=wfilters('sym10','r');
dd0=idwt2(cA,cH,cV,cD,'sym10');
dd1=idwt2(cA,cH,cV,cD,'sym10',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 sym10 passes");
else
  error("idwt2 sym10 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior1.1
[cA,cH,cV,cD]=dwt2(d1,'bior1.1');
[Lo_R,Hi_R]=wfilters('bior1.1','r');
dd0=idwt2(cA,cH,cV,cD,'bior1.1');
dd1=idwt2(cA,cH,cV,cD,'bior1.1',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior1.1 passes");
else
  error("idwt2 bior1.1 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// bior1.3
[cA,cH,cV,cD]=dwt2(d1,'bior1.3');
[Lo_R,Hi_R]=wfilters('bior1.3','r');
dd0=idwt2(cA,cH,cV,cD,'bior1.3');
dd1=idwt2(cA,cH,cV,cD,'bior1.3',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior1.3 passes");
else
  error("idwt2 bior1.3 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior1.5
[cA,cH,cV,cD]=dwt2(d1,'bior1.5');
[Lo_R,Hi_R]=wfilters('bior1.5','r');
dd0=idwt2(cA,cH,cV,cD,'bior1.5');
dd1=idwt2(cA,cH,cV,cD,'bior1.5',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior1.5 passes");
else
  error("idwt2 bior1.5 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior2.2
[cA,cH,cV,cD]=dwt2(d1,'bior2.2');
[Lo_R,Hi_R]=wfilters('bior2.2','r');
dd0=idwt2(cA,cH,cV,cD,'bior2.2');
dd1=idwt2(cA,cH,cV,cD,'bior2.2',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior2.2 passes");
else
  error("idwt2 bior2.2 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior2.4
[cA,cH,cV,cD]=dwt2(d1,'bior2.4');
[Lo_R,Hi_R]=wfilters('bior2.4','r');
dd0=idwt2(cA,cH,cV,cD,'bior2.4');
dd1=idwt2(cA,cH,cV,cD,'bior2.4',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior2.4 passes");
else
  error("idwt2 bior2.4 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior2.6
[cA,cH,cV,cD]=dwt2(d1,'bior2.6');
[Lo_R,Hi_R]=wfilters('bior2.6','r');
dd0=idwt2(cA,cH,cV,cD,'bior2.6');
dd1=idwt2(cA,cH,cV,cD,'bior2.6',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior2.6 passes");
else
  error("idwt2 bior2.6 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior2.8
[cA,cH,cV,cD]=dwt2(d1,'bior2.8');
[Lo_R,Hi_R]=wfilters('bior2.8','r');
dd0=idwt2(cA,cH,cV,cD,'bior2.8');
dd1=idwt2(cA,cH,cV,cD,'bior2.8',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior2.8 passes");
else
  error("idwt2 bior2.8 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior3.1
[cA,cH,cV,cD]=dwt2(d1,'bior3.1');
[Lo_R,Hi_R]=wfilters('bior3.1','r');
dd0=idwt2(cA,cH,cV,cD,'bior3.1');
dd1=idwt2(cA,cH,cV,cD,'bior3.1',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior3.1 passes");
else
  error("idwt2 bior3.1 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior3.3
[cA,cH,cV,cD]=dwt2(d1,'bior3.3');
[Lo_R,Hi_R]=wfilters('bior3.3','r');
dd0=idwt2(cA,cH,cV,cD,'bior3.3');
dd1=idwt2(cA,cH,cV,cD,'bior3.3',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior3.3 passes");
else
  error("idwt2 bior3.3 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior3.5
[cA,cH,cV,cD]=dwt2(d1,'bior3.5');
[Lo_R,Hi_R]=wfilters('bior3.5','r');
dd0=idwt2(cA,cH,cV,cD,'bior3.5');
dd1=idwt2(cA,cH,cV,cD,'bior3.5',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior3.5 passes");
else
  error("idwt2 bior3.5 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior3.7
[cA,cH,cV,cD]=dwt2(d1,'bior3.7');
[Lo_R,Hi_R]=wfilters('bior3.7','r');
dd0=idwt2(cA,cH,cV,cD,'bior3.7');
dd1=idwt2(cA,cH,cV,cD,'bior3.7',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior3.7 passes");
else
  error("idwt2 bior3.7 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;


// bior3.9
[cA,cH,cV,cD]=dwt2(d1,'bior3.9');
[Lo_R,Hi_R]=wfilters('bior3.9','r');
dd0=idwt2(cA,cH,cV,cD,'bior3.9');
dd1=idwt2(cA,cH,cV,cD,'bior3.9',size(d1));
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R);
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1));
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,ss);
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 bior3.9 passes");
else
  error("idwt2 bior3.9 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;

// type 2
[cA,cH,cV,cD]=dwt2(d1,'bior3.9');
[Lo_R,Hi_R]=wfilters('bior3.9','r');
dd0=idwt2(cA,cH,cV,cD,'bior3.9','mode','symw');
if exists('dd0')
dd1=idwt2(cA,cH,cV,cD,'bior3.9',size(d1),'mode','zpd');
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,'mode','sp0');
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1),'mode','ppd');
e1=sum(abs(dd0-dd2));
e2=sum(abs(dd1-dd3));
e=e1+e2;
if (e<1E-8)
  disp("idwt2 type 2 passes");
else
  disp("idwt2 type 2 fails");
end
clear cA;
clear cH;
clear cV;
clear cD;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear e;
clear e1;
clear e2;
end
// type 3

[cA,cH,cV,cD]=dwt2(d1,'bior3.9','mode','per');
[Lo_R,Hi_R]=wfilters('bior3.9','r');
dd0=idwt2(cA,cH,cV,cD,'bior3.9','mode','per');
if exists('dd0')
dd1=idwt2(cA,cH,cV,cD,'bior3.9',size(d1),'mode','per');
dd2=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,'mode','per');
dd3=idwt2(cA,cH,cV,cD,Lo_R,Hi_R,size(d1),'mode','per');
[r,c]=size(cA);
for i=1:c,
   col_low_low(:,i)=(conv(dyadup(cA(:,i)),Lo_R));
   col_low_hi(:,i)=(conv(dyadup(cH(:,i)),Hi_R));
   col_hi_low(:,i)=(conv(dyadup(cV(:,i)),Lo_R));
   col_hi_hi(:,i)=(conv(dyadup(cD(:,i)),Hi_R));
end
row_low=col_low_low+col_low_hi;
row_hi=col_hi_low+col_hi_hi;
[rc,cc]=size(row_low);
for i=1:rc,
   row_low_r(i,:)=conv(dyadup(row_low(i,:)),Lo_R);
   row_hi_r(i,:)=conv(dyadup(row_hi(i,:)),Hi_R);
end
ss=2*size(cA)-length(Lo_R)+2;
x0=wkeep(row_low_r+row_hi_r,2*size(cA));
x1=wkeep(row_low_r+row_hi_r,size(d1));
e1=sum(abs(x0-dd0));
e2=sum(abs(x1-dd1));
e3=sum(abs(x0-dd2));
e4=sum(abs(x1-dd3));
e=e1+e2+e3+e4;
if (e<1E-8)
  disp("idwt2 type 3 passes");
else
  error("idwt2 type 3 fails");
end
clear e;
clear e1;
clear e2;
clear e3;
clear e4;
clear x0;
clear x1;
clear i;
clear rc;
clear cc;
clear row_low;
clear row_hi;
clear col_low_low;
clear col_low_hi;
clear col_hi_low;
clear col_hi_hi;
clear r;
clear c;
clear Lo_R;
clear Hi_R;
clear dd0;
clear dd1;
clear dd2;
clear dd3;
clear row_low_r;
clear row_hi_r;
end

// wavedec2
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('haar','d');
[c1,s1]=wavedec2(a,3,'haar');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'haar');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'haar');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'haar');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 haar pass");
else
   error("wavedec2 haar fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// db1
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db1','d');
[c1,s1]=wavedec2(a,3,'db1');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db1');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db1');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db1');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db1 pass");
else
   error("wavedec2 db1 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// db2
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db2','d');
[c1,s1]=wavedec2(a,3,'db2');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db2');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db2');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db2');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db2 pass");
else
   error("wavedec2 db2 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// db3
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db3','d');
[c1,s1]=wavedec2(a,3,'db3');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db3');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db3');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db3');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db3 pass");
else
   error("wavedec2 db3 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// db4
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db4','d');
[c1,s1]=wavedec2(a,3,'db4');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db4');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db4');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db4');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db4 pass");
else
   error("wavedec2 db4 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// db5
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db5','d');
[c1,s1]=wavedec2(a,3,'db5');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db5');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db5');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db5');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db5 pass");
else
   error("wavedec2 db5 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// db6
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db6','d');
[c1,s1]=wavedec2(a,3,'db6');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db6');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db6');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db6');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db6 pass");
else
   error("wavedec2 db6 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// db7
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db7','d');
[c1,s1]=wavedec2(a,3,'db7');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db7');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db7');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db7');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db7 pass");
else
   error("wavedec2 db7 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// db8
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db8','d');
[c1,s1]=wavedec2(a,3,'db8');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db8');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db8');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db8');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db8 pass");
else
   error("wavedec2 db8 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// db9
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db9','d');
[c1,s1]=wavedec2(a,3,'db9');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db9');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db9');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db9');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db9 pass");
else
   error("wavedec2 db9 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// db10
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('db10','d');
[c1,s1]=wavedec2(a,3,'db10');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'db10');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'db10');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'db10');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 db10 pass");
else
   error("wavedec2 db10 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// coif1
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('coif1','d');
[c1,s1]=wavedec2(a,3,'coif1');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'coif1');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'coif1');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'coif1');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 coif1 pass");
else
   error("wavedec2 coif1 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// coif2
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('coif2','d');
[c1,s1]=wavedec2(a,3,'coif2');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'coif2');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'coif2');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'coif2');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 coif2 pass");
else
   error("wavedec2 coif2 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// coif3
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('coif3','d');
[c1,s1]=wavedec2(a,3,'coif3');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'coif3');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'coif3');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'coif3');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 coif3 pass");
else
   error("wavedec2 coif3 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// coif4
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('coif4','d');
[c1,s1]=wavedec2(a,3,'coif4');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'coif4');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'coif4');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'coif4');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 coif4 pass");
else
   error("wavedec2 coif4 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// coif5
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('coif5','d');
[c1,s1]=wavedec2(a,3,'coif5');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'coif5');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'coif5');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'coif5');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 coif5 pass");
else
   error("wavedec2 coif5 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// sym4
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('sym4','d');
[c1,s1]=wavedec2(a,3,'sym4');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'sym4');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym4');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym4');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 sym4 pass");
else
   error("wavedec2 sym4 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// sym5
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('sym5','d');
[c1,s1]=wavedec2(a,3,'sym5');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'sym5');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym5');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym5');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 sym5 pass");
else
   error("wavedec2 sym5 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// sym6
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('sym6','d');
[c1,s1]=wavedec2(a,3,'sym6');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'sym6');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym6');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym6');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 sym6 pass");
else
   error("wavedec2 sym6 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// sym7
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('sym7','d');
[c1,s1]=wavedec2(a,3,'sym7');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'sym7');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym7');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym7');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 sym7 pass");
else
   error("wavedec2 sym7 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// sym8
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('sym8','d');
[c1,s1]=wavedec2(a,3,'sym8');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'sym8');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym8');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym8');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 sym8 pass");
else
   error("wavedec2 sym8 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// sym9
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('sym9','d');
[c1,s1]=wavedec2(a,3,'sym9');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'sym9');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym9');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym9');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 sym9 pass");
else
   error("wavedec2 sym9 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// sym10
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('sym10','d');
[c1,s1]=wavedec2(a,3,'sym10');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'sym10');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'sym10');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'sym10');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 sym10 pass");
else
   error("wavedec2 sym10 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior1.1
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior1.1','d');
[c1,s1]=wavedec2(a,3,'bior1.1');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior1.1');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior1.1');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior1.1');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior1.1 pass");
else
   error("wavedec2 bior1.1 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior1.3
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior1.3','d');
[c1,s1]=wavedec2(a,3,'bior1.3');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior1.3');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior1.3');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior1.3');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior1.3 pass");
else
   error("wavedec2 bior1.3 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior1.5
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior1.5','d');
[c1,s1]=wavedec2(a,3,'bior1.5');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior1.5');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior1.5');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior1.5');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior1.5 pass");
else
   error("wavedec2 bior1.5 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior2.2
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior2.2','d');
[c1,s1]=wavedec2(a,3,'bior2.2');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior2.2');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior2.2');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior2.2');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior2.2 pass");
else
   error("wavedec2 bior2.2 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior2.4
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior2.4','d');
[c1,s1]=wavedec2(a,3,'bior2.4');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior2.4');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior2.4');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior2.4');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior2.4 pass");
else
   error("wavedec2 bior2.4 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior2.6
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior2.6','d');
[c1,s1]=wavedec2(a,3,'bior2.6');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior2.6');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior2.6');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior2.6');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior2.6 pass");
else
   error("wavedec2 bior2.6 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior2.8
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior2.8','d');
[c1,s1]=wavedec2(a,3,'bior2.8');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior2.8');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior2.8');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior2.8');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior2.8 pass");
else
   error("wavedec2 bior2.8 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior3.1
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior3.1','d');
[c1,s1]=wavedec2(a,3,'bior3.1');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior3.1');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior3.1');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior3.1');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior3.1 pass");
else
   error("wavedec2 bior3.1 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// bior3.3
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior3.3','d');
[c1,s1]=wavedec2(a,3,'bior3.3');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior3.3');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior3.3');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior3.3');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior3.3 pass");
else
   error("wavedec2 bior3.3 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// bior3.5
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior3.5','d');
[c1,s1]=wavedec2(a,3,'bior3.5');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior3.5');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior3.5');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior3.5');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior3.5 pass");
else
   error("wavedec2 bior3.5 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// bior3.7
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior3.7','d');
[c1,s1]=wavedec2(a,3,'bior3.7');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior3.7');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior3.7');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior3.7');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior3.7 pass");
else
   error("wavedec2 bior3.7 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;

// Bior3.9
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[c1,s1]=wavedec2(a,3,'bior3.9');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior3.9');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior3.9');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior3.9');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 bior3.9 pass");
else
   error("wavedec2 bior3.9 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;


// per
dwtmode('per');
a=rand(500,501,'normal');
[Lo_D,Hi_D]=wfilters('bior3.9','d');
[c1,s1]=wavedec2(a,3,'bior3.9');
[c2,s2]=wavedec2(a,3,Lo_D,Hi_D);
[cA1,cH1,cV1,cD1]=dwt2(a,'bior3.9');
[cA2,cH2,cV2,cD2]=dwt2(cA1,'bior3.9');
[cA3,cH3,cV3,cD3]=dwt2(cA2,'bior3.9');
cc=[matrix(cA3,1,length(cA3)) matrix(cH3,1,length(cH3)) matrix(cV3,1,length(cV3)) matrix(cD3,1,length(cD3))];
cc=[cc matrix(cH2,1,length(cH2)) matrix(cV2,1,length(cV2)) matrix(cD2,1,length(cD2))];
cc=[cc matrix(cH1,1,length(cH1)) matrix(cV1,1,length(cV1)) matrix(cD1,1,length(cD1))];
ss=[size(cA3);size(cH3);size(cH2);size(cH1);size(a)];
e1=sum(abs(c1-cc))+sum(abs(c2-cc));
e2=sum(abs(c2-cc))+sum(abs(c2-cc));
e=e1+e2;
if (e<1E-8)
   disp("wavedec2 type3 pass");
else
   error("wavedec2 type3 fails");
end
clear a;
clear Lo_D;
clear Hi_D;
clear c1;
clear c2;
clear s1;
clear s2;
clear cA1;
clear cH1;
clear cV1;
clear cD1;
clear cA2;
clear cH2;
clear cV2;
clear cD2;
clear cA3;
clear cH3;
clear cV3;
clear cD3;
clear cc;
clear ss;
clear e;
clear e1;
clear e2;
dwtmode('symh');

disp("-->dwt2d test end<--");