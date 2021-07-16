// ############################################################################
// Extrae las 4 matrices de la representacion en espacio de estados del sistema
// sys.
function [A,B,C,D]=ssdata(sys)
   if typeof(sys)=='rational' then
      sys1=tf2ss(sys)
   end
   [A,B,C,D]=abcd(sys)
endfunction
