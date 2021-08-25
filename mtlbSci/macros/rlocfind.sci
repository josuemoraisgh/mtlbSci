// ############################################################################
// Devuelve la coordenada en el plano s del punto seleccionado con el raton
// y el valor de la ganancia proporcional al cual corresponde
// A diferencia del Matlab hay que seleccionar el punto en la ventana donde
// este el LR

function [k,polo]=rlocfind(sys)
   polo=[1 %i]*locate(1)
   k=-1/real(horner(sys,polo))
endfunction
