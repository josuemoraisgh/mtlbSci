// ############################################################################
// En primer lugar obtiene el equivalente discreto mediante aproximacion de ZOH
// con periodo de muestreo T del sistema continuo sys. A continuacion visualiza
// la respuesta ante entrada escalon unitario con el color especificado.

function secuencia(sys,T,kolore)
   sysd=c2d(sys,T)
   step(sysd,'+',kolore)
endfunction
