function [Z, FZ, INFO] =moc_fzero(Func,bracket,options)
// solves the scalar nonlinear equation such that F(X) == 0
// Calling Sequence
//[X, FX, INFO] = moc_fzero (FCN, APPROX, OPTIONS)
// Parameters
//  FCN : function name as string
//  APPROX can be a vector with two components,  A = APPROX(1) and B = APPROX(2),which localizes the zero of F, that is, it is assumed that X lies between A and B. If APPROX is a scalar, it is treated as an initial guess for X.
// OPTIONS is a structure, with the following fields:
// 'abstol' : absolute (error for Brent's or residual for fsolve) tolerance. Default = 1e-6.
//  'reltol' : relative error tolerance (only Brent's method). Default = 1e-6.
//  'prl' : print level, how much diagnostics to print. Default = 0, no diagnostics output
//Description
// Given Func, the name of a function of the form `F (X)', and an initial
// approximation APPROX, `fzero' solves the scalar nonlinear equation such that
// `F(X) == 0'. Depending on APPROX, `fzero' uses different algorithms to solve
// the problem: either the Brent's method or the Powell's method of `fsolve'.
//  The computed approximation to the zero of FCN is returned in X. FX is then equal
// to FCN(X). If the iteration converged, INFO == 1. If Brent's method is used,
// and the function seems discontinuous, INFO is set to -5. If fsolve is used,
// INFO is determined by its convergence.
//Examples
// moc_fzero('sin',[-2 1])
// [x, fx, info] = moc_fzero('sin',-2)
// options.abstol = 1e-2; moc_fzero('sin',-2, options)
// Authors
// H. Nahrstaedt - Aug 2010
// Copyright (C) 2004 Lukasz Bodzon

//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; If not, see <http://www.gnu.org/licenses/>.
//
// REVISION HISTORY
//
// 2004-07-20, Piotr Krzyzanowski, <piotr.krzyzanowski@mimuw.edu.pl>:
// Options parameter and fall back to fsolve if only scalar APPROX argument
// supplied
//
// 2004-07-01, Lukasz Bodzon:
// Replaced f(a)*f(b) < 0 criterion by a more robust
// sign(f(a)) ~= sign(f(b))
//
// 2004-06-18, Lukasz Bodzon:
// Original implementation of Brent's method of finding a zero of a scalar
// function

[nargout,nargin]=argn(0);
if (nargin < 2)
error("[x, fx, info] = fzero(@fcn, [lo,hi]|start, options)");
end

if type(Func)~=10 & type(Func)~=13//,"function_handle") && !isa(Func,"inline function")
error("fzero expects a function as the first argument");
end
bracket = bracket(:);
if and(length(bracket)~=[1,2])
error("fzero expects an initial value or a range");
end


set_default_options = %f;
if (nargin >= 2) 			// check for the options
if (nargin == 2)
set_default_options = %t;
options = [];
else 				// nargin > 2
if typeof(options)~="st"
if ~isempty(options)  // empty indicates default chosen
warning('Options incorrect. Setting default values.');
end
warning('Options incorrect. Setting default values.');
set_default_options = %t;
end
end
end

if ~mtlb_isfield(options,'abstol')
options.abstol = 1e-6;
end
if ~mtlb_isfield(options,'reltol')
options.reltol = 1e-6;
end
// if ~isfield(options,'maxit')
// options.maxit = 100;
// end
if ~mtlb_isfield(options,'prl')
options.prl = 0; 		// no diagnostics output
end

fcount = 0; 				// counts function evaluations
if (length(bracket) > 1)
a = bracket(1); b = bracket(2);
use_brent = %t;
else
b = bracket;
use_brent = %f;
end


if (use_brent)

fa=evstr(Func+"("+string(a)+")"); fcount=fcount+1;
fb=evstr(Func+"("+string(b)+")"); fcount=fcount+1;

BOO=%t;
tol=options.reltol*abs(b)+options.abstol;

// check if one of the endpoints is the solution
if (fa == 0.0)
BOO = %f;
b = a;
c = a;
fc = fa;fb = fa;
end
if (fb == 0.0)
BOO = %f;
c = b;a = b;
fc  = fb;fa = fb
end

if ((sign(fa) == sign(fb)) & BOO)
warning ("fzero: equal signs at both ends of the interval.\n Using fsolve("+Func+" ,"+string(0.5*(a+b))+") instead");
use_brent = %f;
b = 0.5*(a+b);
end
end



if (use_brent) 				// it is reasonable to call Brent's method
if options.prl > 0
printf("============================\n");
printf("fzero: using Brent s method\n");
printf("============================\n");
end
c=a;
fc=fa;
d=b-a;
e=d;

while (BOO == %t) 		// convergence check

if (sign(fb) == sign(fc)) // rename a, b, c and adjust bounding interval
c=a;
fc=fa;
d=b-a;
e=d;
end,

// We are preventing overflow and division by zero
// while computing the new approximation by
// linear interpolation.
// After this step, we lose the chance for using
// inverse quadratic interpolation (a==c).

if (abs(fc) < abs(fb))
a=b;
b=c;
c=a;
fa=fb;
fb=fc;
fc=fa;
end,

tol=options.reltol*abs(b)+options.abstol;
m=0.5*(c-b);
if options.prl > 0
printf('fzero: [%d evstr] X = %8.4e\n', fcount, b);
if options.prl > 1
printf('fzero: m = %8.4e e = %8.4e [tol = %8.4e]\n', m, e, tol);
end
end

if (abs(m) > tol & fb ~= 0)

// The second condition in following if-instruction
// prevents overflow and division by zero
// while computing the new approximation by
// inverse quadratic interpolation.

if (abs(e) < tol | abs(fa) <= abs(fb))
d=m; 			// bisection
e=m;

else
s=fb/fa;

if (a == c) 		// attempt linear interpolation
p=2*m*s; 	//  (the secant method)
q=1-s;

else 			// attempt inverse quadratic interpolation
q=fa/fc;
r=fb/fc;
p=s*(2*m*q*(q-r)-(b-a)*(r-1));
q=(q-1)*(r-1)*(s-1);
end,

if (p > 0) 		// fit signs
q=-q; 		//  to the sign of (c-b)

else
p=-p;
end,

s=e;
e=d;

if (2*p < 3*m*q-abs(tol*q) & p < abs(0.5*s*q))
d=p/q; 		// accept interpolation

else 			// interpolation failed;
d=m; 		//  take the bisection step
e=m;
end,

end,

a=b;
fa=fb;

if (abs(d) > tol)	 	// the step we take is never shorter
b=b+d; 			//  than tol

else

if (m > 0) 		// fit signs
b=b+tol; 	//  to the sign of (c-b)

else
b=b-tol;
end,

end,

fb=evstr(Func+"("+string(b)+")"); fcount=fcount+1;

else
BOO=%f;
end,

end,
Z=b;
FZ = fb;
if abs(FZ) > 100*tol 	// large value of the residual may indicate a discontinuity point
INFO = -5;
else
INFO = 1;
end
//
// TODO: test if Z may be a singular point of F (ie F is discontinuous at Z
// Then return INFO = -5
//
if (options.prl > 0 )
printf("\nfzero: summary\n");
select(INFO)
case 1
MSG = "Solution converged within specified tolerance";
case -5
MSG = strcat("Probably a discontinuity/singularity point of F()\n encountered close to X = ", sprintf('%8.4e',Z),...
".\n Value of the residual at X, |F(X)| = ",...
sprintf('%8.4e',abs(FZ)), ...
".\n Another possibility is that you use too large tolerance parameters",...
".\n Currently TOL = ", sprintf('%8.4e', tol), ...
".\n Try fzero with smaller tolerance values");
else
MSG = "Something strange happened"
end
printf(' %s.\n', MSG);
printf(' %d function evaluations.\n', fcount);
end

else 				// fall back to fsolve
if options.prl > 0
printf("============================\n");
printf("fzero: using fsolve\n");
printf("============================\n");
end
// check for zeros in APPROX
fb=evstr(Func+"("+string(b)+")");
fcount=fcount+1;
//tol_save = fsolve_options('tolerance');
//fsolve_options("tolerance",options.abstol);
deff('[y]=fsol1(x)','y='+Func+'(x)');
[Z, INFO, MSG] = fsolve(b, fsol1,options.abstol);
//fsolve_options('tolerance',tol_save);
FZ = evstr(Func+"("+string(Z)+")");
if options.prl > 0
printf("\nfzero: summary\n");
printf(' %s.\n', MSG);
end
end
endfunction;

//// usage and error testing
////	the Brent's method
//test
// options.abstol=0;
// assert (fzero('sin',[-1,2],options), 0)
//test
// options.abstol=0.01;
// options.reltol=1e-3;
// assert (fzero('tan',[-0.5,1.41],options), 0, 0.01)
//test
// options.abstol=1e-3;
// assert (fzero('atan',[-(10^300),10^290],options), 0, 1e-3)
//test
// testfun=inline('(x-1)^3','x');
// options.abstol=0;
// options.reltol=eps;
// assert (fzero(testfun,[0,3],options), 1, -eps)
//test
// testfun=inline('(x-1)^3+y+z','x','y','z');
// options.abstol=0;
// options.reltol=eps;
// assert (fzero(testfun,[-3,0],options,22,5), -2, eps)
//test
// testfun=inline('x.^2-100','x');
// options.abstol=1e-4;
// assert (fzero(testfun,[-9,300],options),10,1e-4)
////	`fsolve'
//test
// options.abstol=0.01;
// assert (fzero('tan',-0.5,options), 0, 0.01)
//test
// options.abstol=0;
// assert (fzero('sin',[0.5,1],options), 0)
//
//demo
// bracket=[-1,1.2];
// [X,FX,MSG]=fzero('tan',bracket)
//demo
// bracket=1; 	# `fsolve' will be used
// [X,FX,MSG]=fzero('sin',bracket)
//demo
// bracket=[-1,2];
// options.abstol=0; options.prl=1;
// X=fzero('sin',bracket,options)
//demo
// bracket=[0.5,1];
// options.abstol=0; options.reltol=eps; options.prl=1;
// fzero('sin',bracket,options)
//demo
// demofun=inline('2*x.*exp(-4)+1 - 2*exp(-4*x)','x');
// bracket=[0, 1];
// options.abstol=1e-14; options.reltol=eps; options.prl=2;
// [X,FX]=fzero(demofun,bracket,options)
//demo
// demofun=inline('x^51','x');
// bracket=[-12,10];
// # too large tolerance parameters
// options.abstol=1; options.reltol=1; options.prl=1;
// [X,FX]=fzero(demofun,bracket,options)
//demo
// # points of discontinuity inside the bracket
// demofun=inline('0.5*(sign(x-1e-7)+sign(x+1e-7))','x');
// bracket=[-5,7];
// options.prl=1;
// [X,FX]=fzero(demofun,bracket,options)
//demo
// demofun=inline('2*x*exp(-x^2)','x');
// bracket=1;
// options.abstol=1e-14; options.prl=2;
// [X,FX]=fzero(demofun,bracket,options)
//demo
// demofun=inline('2*x.*exp(-x.^2)','x');
// bracket=[-10,1];
// options.abstol=1e-14; options.prl=2;
// [X,FX]=fzero(demofun,bracket,options)
