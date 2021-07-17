// ############################################################################

// Permite obtener la FT continua equivalente del sistema discreto sys (FT 
//   o ec. de estado).

// Sintaxis:
//     [sys1=]d2c(sys)   : obtiene el equivalente continuo (FT o ec de estado).

// Nota: sys1 es el mismo tipo de dato que sys (FT o ec de estado)

function sys1=d2c(sys);
   if typeof(sys)=='rational'  // Si sys es FT lo convierte en ec. de estado
	sys=tf2ss(sys);
	egia=%T
   end
   G=sys(2);
   H=sys(3);
   C=sys(4);
   D=sys(5);
   dt=sys(7);
   A=clean(logm(G))/dt;
   B=inv(inv(A)*(G-eye(G)))*H;
   sys1=syslin('c',A,B,C,D);
   if egia then// Si sys era FT para que sys1 sea FT 
	sys1=clean(ss2tf(sys1));
   end
endfunction
