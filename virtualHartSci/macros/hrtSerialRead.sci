function buf=hrtSerialRead(h,n) 
// Faz a leitura em Hexadecimal de uma porta serial
// Calling Sequence
// buf=hrtSerialRead(h,n)
// Parameters
// h : Porta Serial Aberta
// n : Quantidade de Caracteres
// buf : String retornada
// Description
// Função que faz a leitura em Hexadecimal de uma porta serial aberta pela função hrtSerialOpen
// Examples
//
//         serial = hrtSerialOpen(3,'19200,n,8,1'); 
//         [n,status] = hrtSerialStatus(serial);
//         if(n(1)>0)then
//              strFrame=hrtSerialRead(serial,n(1));
//         end
//  
// 
// Authors
// Josué Silva de Morais - josue@ufu.br
// www.ufu.br
// See Also
// hrtSerialStatus
// hrtSerialOpen
// hrtSerialCloseAll
// hrtSerialClose
// hrtSerialWrite
   if ~exists("n","local") then
     N=serialstatus(h); 
     n=N(1);
   end
   TCL_EvalStr("binary scan [read "+h+" "+string(n)+"] cu* ttybuf")
   buf=part(msprintf(" %02s",dec2hex(evstr(TCL_GetVar("ttybuf")))'),2:$);
endfunction
