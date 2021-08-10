function strHex=hrtTypePAscii2Hex(strPAscii)
    //Quando recebe uma cadeia de PAscii e retorna os hex correspondentes 
    strAux = msprintf("%06s",dec2bin(bitset(ascii(strsplit(strPAscii))',[8 7],[0 0])))
    tam = length(strAux);
    if modulo(tam,8) == 0 then
        vetBin = strsplit(strAux,[8:8:tam-8]); 
    else
        vetBin = strsplit(strAux,[tam-int(tam/8)*8:8:tam-8]); 
    end
    strHex = part(msprintf(" %02s",dec2hex(bin2dec(vetBin))),2:$)
endfunction
