function wavedecplot(C,L,cbar,f)
//Plots wavedec coeffs
//Calling Sequence
//wavedecplot(C,L)
//wavedecplot(C,L,cbar,f)
//Parameters
//C: wavedec C coeffs
//L: wavedec L coeffs
//cbar: defines plotting of a color bar (%t or %f)
//f: if used, the coeff are plotted in the figure f
//Description
//Plots the absolute coefficients of a discrete Wavelet-Transform (wavedec)
//Examples
//wname = 'db2';
//x=[zeros(1,200),20*ones(1,200)];
//
//[C,L]=wavedec(x,5,wname);
//wavedecplot(C,L);
//
// See also 
// wavedec
//Authors
//Holger Nahrstaedt - 2010-2012



[nargout,nargin]=argn(0);
  if (nargin < 2),
    error ( '2 parameters are required !' ); 
  end
cf=%t;
if (nargin<3)
  cbar=%t;
end

if (nargin< 4)
  cf=%f;
  f=figure();
  scf(f);clf(f);
end;



level=length(L)-2;
len=L($);
cfd=zeros(level,len);

for k=1:level
  d=detcoef(C,L,k);
  d=d(ones(1,2^k),:);
  cfd(k,:)=wkeep(d(:)',len);
end
cfd=cfd(:);

I=find(abs(cfd) <sqrt(%eps));
cfd(I)=zeros(length(I),1);
cfd=matrix(cfd,level,len);

x=1:len;
scales=1:level;
f.color_map =pinkcolormap(64);
grayplot(x,scales,abs(cfd)');
ylabel('Level');
xlabel('time (or space)');
//xtitle('Discrete Transform, absolute coefficients');
if cbar
  colorbar(0,max(abs(cfd)));
end
endfunction
