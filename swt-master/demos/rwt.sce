n=1024;
t = ((1:n)./n-.5).*%pi;
x=2*sin(2*t)+3*cos(5*t).*sin(2*t);
nvoise=4;
rwt_out=rwt(x,nvoise,'DerGauss');
figure(0);scf(0);clf(0)
plot2d(rwt_out);
maxmap=mm_rwt(rwt_out);
figure(1);scf(1);clf(1)
plot2d(maxmap);
