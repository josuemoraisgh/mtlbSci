function strHex=hrtTypeTime2Hex(strTime)//hh:mm:ss:xxx
    auxVet = strtod(tokens(strTime,':'));
    valor = msprintf("%032s",dec2bin(int(auxVet(1)*112500000+auxVet(2)*1920000+auxVet(3)*320000+auxVet(4)/0.03125)));
    strHex = msprintf("%02s %02s %02s %02s",dec2hex(bin2dec(part(valor,1:8))),..
                                            dec2hex(bin2dec(part(valor,9:16))),..
                                            dec2hex(bin2dec(part(valor,17:24))),..
                                            dec2hex(bin2dec(part(valor,25:32))));
endfunction
