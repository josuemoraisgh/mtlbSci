function result=hrtTypeHex2UInt(strUInt)
    number = hex2dec(tokens(strUInt,' '));    
    result = number(1)*256+number(2);
endfunction
