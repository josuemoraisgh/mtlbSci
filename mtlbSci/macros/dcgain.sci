// ############################################################################
// Retorna a o ganho das baixas frequencias do sistema sys
function [gan]=dcgain(sys)
   if (sys.dt=='c')|(sys.dt==[]) then // para sistemas continuos o cociente polinomios 
                                      // que se convierte en FT continua
      if typeof(sys)=='state-space'
	   sys1=ss2tf(sys)
      elseif typeof(sys)=='rational' then
	   if sys.dt==[] then
		  sys1=syslin('c',sys)
           else
		  sys1=sys
    	   end
      end
      gan=horner(sys1,0)
   else //sistemas discretos
      if typeof(sys)=='state-space'
	   sys1=ss2tf(sys)
      else
           sys1=sys
      end
      gan=horner(sys1,1)
   end
endfunction
