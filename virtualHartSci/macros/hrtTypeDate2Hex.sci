function strHex=hrtTypeDate2Hex(strDate)
    auxVet = strtod(tokens(strDate,'/'));
    strHex = msprintf("%02s %02s %02s",dec2hex(auxVet(1)),dec2hex(auxVet(2)),dec2hex(auxVet(3)-1900));
endfunction
