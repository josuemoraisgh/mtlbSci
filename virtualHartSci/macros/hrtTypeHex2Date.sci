function strDate=hrtTypeHex2Date(strHex)
    auxVet = hex2dec(tokens(strHex,' '));
    strDate = msprintf("%02d/%02d/%04d",auxVet(1),auxVet(2),1900+auxVet(3));
endfunction
