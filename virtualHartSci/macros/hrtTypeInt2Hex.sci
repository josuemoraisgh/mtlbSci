function result=hrtTypeInt2Hex(ValorInt)
    if ValorInt < 0 then //Faz o complemento de 2 do valor
        ValorInt = bitcmp(ValorInt,16)+1;
    end
    result = string(dec2hex(bitget(ValorInt,16:-1:9)))+' '+..
             string(dec2hex(bitget(ValorInt,8:-1:1)));
endfunction
