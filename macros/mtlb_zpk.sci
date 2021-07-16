// ############################################################################
// Permite obtener una FT a partir de sus polinomios numerador y denominador
// o de la representacion en espacio de estados.
// Sintaxis:
//	sys=zpk(g)		: con g un cociente de polinomios o un sistema en espacio de estados.
//	sys=zpk(num,den,gan)	: con num y den los polinomios num y den respec., y gan la cte por la que se multiplica el polinomio num.
//	sys=zpk(numm,den,gan,x)	: igual que la anterior pero para una FT discreta. El cuarto param. es el periodo de muestreo.
//
// Considera el 1er y 2o caso para sistemas continuos (transformada s), y el 3o para discretos (trasnformada z)
//
// A diferencia de Matlab devuelve la FT sin factorizar

function sys1=zpk(varargin)
   i=length(varargin);
   select i
      case 1 then                                //zpk(FT) o zpk(SS)
	   sys=varargin(1);
	   if typeof(sys)=='state-space' then
		   sys1=ss2tf(sys);
	   elseif typeof(sys)=='rational' then
		   if sys('dt')==[] then
			   sys1=syslin('c',sys);
		   else
			   sys1=sys;
		   end
	   end
      case 3 then                               //zpk(num,den,gan)
	   num=varargin(3)*poly(varargin(1),'s');
	   den=poly(varargin(2),'s');
	   sys1=syslin('c',num,den);
      case 4 then                               //zpk(num,den,gan,T)
	   num=varargin(3)*poly(varargin(1),'z');
	   den=poly(varargin(2),'z');
	   sys1=syslin(varargin(4),num,den);
      else
	   disp('errorea')
	   break
   end
endfunction
