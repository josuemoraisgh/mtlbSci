// ############################################################################
// Devuelve la coordenada del punto seleccionado con el raton en una ventana
// grafica
function [x,y]=ginput(n)
   pto=locate(n)
   for i=1:n do
      x(i)=pto(1,i)
      y(i)=pto(2,i)
   end
endfunction
