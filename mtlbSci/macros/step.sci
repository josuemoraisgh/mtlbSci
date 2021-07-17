// ############################################################################
// Permite obtener la salida de un sistema continuo o discreto ante entrada
// escalon unitario.
// Sintaxis:
//     [y=]step(g[,n])   : dibuja en ventana grafica la salida con t calculado 
//                         automaticam. a partir de los polos, y la linea de color
//                         indicado por n.
//     [y=]step(g,t[,n]) : igual que la anterior pero con el vector t especificado y
//                         la linea de color indicado por n.
//     [y[,tt]]=step(g[,t]) : devuelve los vectores salida y tiempo (el especificado 
//                            tt=t o el calculado automaticamente) sin dibujar en 
//                            la ventana grafica.
// Nota1: Para sistema discretos se visualizan por defecto los valores de las
//        secuencias de salida y se mantiene el valor hasta el proximo instante
//        de muestreo (seÃ±aescalonada).
// Nota2: Si se desea que unicamente se visualicen los valores de la secuencia
//        de salida habra que especificarlo:
//                [y=]step(g[,t],'+')
//

function varargout=step(sys,varargin)
   i=length(varargin)  //numero de parametros a parte de sys
   j=argn(1)           //numero de argumentos en la lhs de la llamada (1 minimo)
   if typeof(sys)=='state-space' then 
         sys=ss2tf(sys);
   end
   if sys.dt=='c' then  // para sistemas continuos
        //primero calcula el vector y de salida y el de tiempo t
	select i  //step(g), step(g,t) o step(g,n)
	   case 0 then //step(g) con t calculado a partir de los polos
		a=min(abs(roots(sys.den)))+0.01;
		t=(0:100)/a/5;
		y=csim('step',t,sys);
	   case 1 then //step(g,n) con n el vector tiempo o un entero para 
		       //indicar el color de la linea
		if length(varargin(1))==1  //el 2Âº parametr color de la linea
			a=min(abs(roots(dsys.den)))+0.01;
			t=(0:100)/a/5;
		else  //el 2Âº prametro el vector de tiempo
			t=varargin(1);
		end
		y=csim('step',t,sys);
	   case 2 then //step(g,t,color)  
		y=csim('step',varargin(1),sys);
	   else
		disp('errorea')
                break
		//x=return(10)
	end //del select i
	
        //segundo visualiza la respuesta y/o devuelve los vectores de salida y tiempo
	select j // step(.), y=step(.), [y,x]=step(.) 
	   case 1 then //step(.), y=step(.)
		select i
		   case 0 then  //[y=]step(g)
			plot2d(t,y)
		   case 1 then  //step(g,t) o step(g,color)
			if length(varargin(1))==1
				plot2d(t,y,varargin(1))
			else
				plot2d(t,y)
			end
                   case 2 then //step(g,t,color)
                        plot2d(t,y,varargin(2)) 
		   else
			disp('errorea')
			break
		   end //del select i
		varargout=list([])   //no tiene lhs, step(.) e y=step(.) iguales
	   case 2 //[y,t]=step(.)
		varargout=list(y,t);
	   else
		disp('errorea')
		break
	end //del select j

   else //para sistemas discretos
        //primero calcula el vector y de salida y el de tiempo t
        select i  //step(g), step(g,t) o step(g,n)
	   case 0 then //step(g) con t calculado a partir de los polos
		a=min(abs(log(1e-4+roots(denom(sys)))/sys.dt));
		t=(0:sys.dt:100/a/5);
		y=dsimul(tf2ss(sys),ones(t));
	   case 1 then //step(g,n) con n el vector tiempo 
                       //o un entero para indicar el color de la linea
                       //o un '+' para dibujar solo los puntos
		if ((varargin(1)=='+')|(length(varargin(1))==1)) then
                                         //el 2Âº parametro color de la lina o '+'
			a=min(abs(log(1e-4+roots(denom(sys)))/sys.dt));
			t=(0:sys.dt:100/a/5);
			y=dsimul(tf2ss(sys),ones(t));
		else  //el 2Âº parametro es el vector tiempo
			//t=varargin(1)*sys.dt;
			//y=dsimul(tf2ss(sys),ones(t))
                        t1=varargin(1);
                        t=0:sys.dt:t1($);
			y=dsimul(tf2ss(sys),ones(t))
		end
	//   case 2 then  //
	//	if varargin(1)=='+' then
	//		a=min(abs(log(1e-4+roots(denom(sys)))/sys.dt));
	//		t=(0:sys.dt:100/a/5);
	//		y=dsimul(tf2ss(sys),ones(t));
	//	else
	//		t=varargin(1)*sys.dt;
	//		y=dsimul(tf2ss(sys),ones(t))
	//	end
	   case 2 then  // step(g,t,n) o step(g,t,'+'))
		//t=varargin(1)*sys.dt;
		//y=dsimul(tf2ss(sys),ones(t))
                t1=varargin(1);
                t=0:sys.dt:t1($);
		y=dsimul(tf2ss(sys),ones(t))
	   //case 3 then
		//t=varargin(1)*sys.dt;
		//y=dsimul(tf2ss(sys),ones(t))
	   else
		disp('errorea')
		break
	end //del select i

        //segundo visualiza la respuesta y/o devuelve los vectores de salida y tiempo
        select j  //step(.), y=step(.) o [y,t]=step(.)
           case 1 then //step(.) o y=step(.)
              select i
		case 0 then //[y=]step(g)
			//plot2d(t,y,-1)
			plot2d2('onn',(t)',y',2)
		case 1 then //[y=]step(g,n), [y=]step(g,t) o [y=]step(g,'+')
			if varargin(1)=='+' then // [y=]step(g,'+')
				//plot2d2('onn',(t)',y',2)
			   plot2d(t,y,-1)
			else // [y=]step(g,t) o [y=]step(g,n)
				//plot2d(t,y,-1)
                           if length(varargin(1))==1 then  // [y=]step(g,n)
				plot2d2('onn',t',y',varargin(1))
                             else  // [y=]step(g,t)
				plot2d2('onn',t',y')
                           end
			end
		case 2 then  // [y=]step(g,t,n) y [y=]step(g,t,'+')
			if varargin(2)=='+' then  // [y=]step(g,t,'+')
				//plot2d2('onn',(t)',y',2)
			        plot2d(t,y,-1)
			  else  //[y=]step(g,t,n)
				plot2d2('onn',t',y',varargin(2))
			end
		//case 3 then
		//		plot2d2('onn',(t)',y',varargin(3))
		else
			disp('errorea')
                        break
              end // del select i
  	      varargout=list([])
	      replot([min(t) min(y) max(t) max(y)])
        case 2 then //[y,t]=step(.)
		varargout=list(y,t)
        else
		disp('errorea')
		break
        end //del select j
   end //del if que separa sistemas continuos y discretos
endfunction
