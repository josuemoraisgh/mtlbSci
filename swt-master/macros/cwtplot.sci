function cwtplot(coef,scales,cbar,f)
//Plots cwt coeffs
//Calling Sequence
//cwtplot(coeff,scale)
//cwtplot(coeff,scale,cbar,f)
//Parameters
//coeff: cwt coefficients
//scale: vector with scales from cwt
//cbar: defines plotting of a color bar (%t or %f)
//f: if used, the coeff are plotted in the figure f
//Description
//Plots the absolute coefficients of a continuous Wavelet-Transform (cwt)
//Examples
//wname = 'morl';
//A = 0; B = 64; P = 500;
// // Compute the sampling period and the sampled function,
// // and the true frequencies.
// t = linspace(A,B,P);
// delta = (B-A)/(P-1);
// tab_OMEGA = [5,2,1];
// tab_FREQ = tab_OMEGA/(2*%pi);
// tab_COEFS = [5,3,2];
// x = zeros(1,P);
// for k = 1:3;
//   x = x+tab_COEFS(k)*sin(tab_OMEGA(k)*t);
// end
// // Set scales
// scales = [1:1:60];
//coef=cwt(x,scales,wname);
//cwtplot(coef,scales);
//See also
// cwt
//Authors
//Holger Nahrstaedt - 2010-2012



[nargout,nargin]=argn(0);
  if (nargin < 2),
    error ( '2 parameters are required !' ); 
  end

if (nargin<3)
  cbar=%t;
end

if (nargin< 4)
  f=figure();
  scf(f);clf(f);
end;


x=1:size(coef,2);
f.color_map =pinkcolormap(64);
grayplot(x,scales,abs(coef)');
if cbar
colorbar(0,max(abs(coef)));
end;
ylabel('Scale');
xlabel('time (or space)');
//xtitle('Continuous Transform, absolute coefficients');
a=gca();a.tight_limits="on";
endfunction
