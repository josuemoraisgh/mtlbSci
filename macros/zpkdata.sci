// ############################################################################
// Devuelve 3 vectores con los ceros, polos y ganancia (alta frec.) del sistema que se le pasa en el argumento
function [z,p,k]=zpkdata(sys)
   if typeof(sys)=='state-space'
	   sys=ss2tf(sys)
   end
   z=roots(numer(sys))
   p=roots(denom(sys))
   coefn=coeff(numer(sys))
   coefd=coeff(denom(sys))
   coefnm=coefn($)
   coefdm=coefd($)
   k=coefnm/coefdm
endfunction
