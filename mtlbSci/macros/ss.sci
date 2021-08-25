// ############################################################################
// Permite obtener la representacion en espacio de estados de un sistema continuo 
// o discreto.
// Sintaxis:
//     [sys1=]ss(sys) : con sys una FT o cociente de polinomios.
//     [sys1=]ss(A,B,C,D) : sys1 sera un sistema continuo obtenido a partir de 
//                          las matrices A,B,C y D.
//     [sys1=]ss(A,B,C,D,T) : sys1 sera un sistema discreto con periodo de muestreo
//                            T obtenido a partir de las matrices A,B,C y D.
function sys1=ss(varargin)
   i=length(varargin)
   select i
      case 1 then  // ss(G))
	sys=varargin(1)
	if typeof(sys)=='rational' then
		if sys.dt==[] then
			sys=syslin('c',sys)
		end
		sys1=tf2ss(sys)
	else
		sys1=sys
	end
      case 4 then  // ss(A,B,C,D))
	 sys1=syslin('c',varargin(1),varargin(2),varargin(3),varargin(4))
      case 5 then  // ss(T,A,B,C,D))
	 sys1=syslin(varargin(5),varargin(1),varargin(2),varargin(3),varargin(4))
      else
	 disp('errorea')
	 break
   end // del select
endfunction
