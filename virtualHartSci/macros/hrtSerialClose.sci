function result=hrtSerialClose(h)
  TCL_EvalStr("set closeresult [catch {close "+string(h)+"}]"); 
  result=-evstr(TCL_GetVar("closeresult"));
  if result==0  then
      disp('A porta serial foi fechada');
  else
      hrtSerialCloseAll();
      disp('Todas portas seriais abertas no Scilab foram fechadas');
  end
  
endfunction
