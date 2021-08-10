function result=hrtTypeUInt2Hex(ValorUInt)  
    result = string(dec2hex(bitget(ValorUInt,16:-1:9)))+' '+..
             string(dec2hex(bitget(ValorUInt,8:-1:1)));
endfunction
