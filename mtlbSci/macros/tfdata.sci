// ############################################################################
// Permite obtener los polinomios numerador y denominador de un sistema
// este en forma de FT o de ec. de estado

function [num,den]=tfdata(sys)
   if typeof(sys)=='state-space'
	   sys=ss2tf(sys)
   end
   num=numer(sys)
   den=denom(sys)
endfunction
