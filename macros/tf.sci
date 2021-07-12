// ############################################################################
// Permite definir una FT (equivalente a la funcion syslin de Scilab)
// Sintaxis:
//	tf('s'): define una FT(s)=s
//      tf(x): con x un cociente de polinomios o un sistema en el espacio de
//             estados
//      tf(n,d): con n y d el numerador y denominador respectivamente. Estos
//             podran ser polinomios o vectores que contengan los coeficientes
//             de los mismos en orden decreciente de grado.
//      tf(n,d,T): lo mismo que la anterior pero para definir FT discreta
//             con T el periodo de muestreo

function sys1=tf(varargin)
   i=length(varargin)
   select i
      case 1 then
	     if typeof(varargin(1))=='string' then
		   sys1=%s;     //tf('s')
	     else
	           sys=varargin(1)                  //tf(FT) o tf(SS)
	           if typeof(sys)=='state-space' then
		         sys1=ss2tf(sys);
	           elseif typeof(sys)=='rational' then
		         if sys('dt')==[] then
			     sys1=syslin('c',sys)
		         else
			     sys1=sys
		         end
		   end
	     end
      case 2 then             //tf(num,den)
             varargin(1)=varargin(1)($:-1:1)
             varargin(2)=varargin(2)($:-1:1)
	     if typeof(varargin(1))=='polynomial'
                      num=horner(varargin(1),s)
	     else
		      num=poly((varargin(1)),'s','coeff')
	     end
	     if typeof(varargin(2))=='polynomial'
		      den=horner(varargin(2),s)
	     else
		      den=poly((varargin(2)),'s','coeff')
	     end
	     sys1=syslin('c',num,den)
      case 3 then             //tf(num,den,T)
             varargin(1)=varargin(1)($:-1:1)
             varargin(2)=varargin(2)($:-1:1)
	     if typeof(varargin(1))=='polynomial'
		      num=horner(varargin(1),z)
	     else
		      num=poly((varargin(1)),'z','coeff')
	     end
	     if typeof(varargin(2))=='polynomial'
		      den=horner(varargin(2),z)
	     else
		      den=poly((varargin(2)),'z','coeff')
	     end
	     sys1=syslin(varargin(3),num,den)
      else
	     disp('errorea')
	     break
     end
endfunction
