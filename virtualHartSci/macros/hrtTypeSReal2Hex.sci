function result=hrtTypeSReal2Hex(strFloat)
    ValorFloat = strtod(strFloat);
    if(ValorFloat == %nan) then 
        result = '7F A0 00 00';
    else 
        if ValorFloat > 0 then 
            S='0'; 
        else 
            S='1';
            ValorFloat=-1*ValorFloat;
        end;
        E = uint32(127 + (log(ValorFloat)/log(2)));
        ValorFloat = 2*((ValorFloat/double(2^(E-127)))-1);
        i  = 0;
        F = '';
        while ValorFloat>0 && i<23
            i=i+1;
            if ValorFloat>=1 then
                F = F+'1';
                ValorFloat=2*(ValorFloat-1);
            else
                F = F+'0';
                ValorFloat=2*ValorFloat;
            end 
        end;
        vetBin = S+msprintf("%08s",dec2bin(E))+F
        if length(vetBin) < 32
            vetBin = strsplit(vetBin+strcat(string(zeros(1,32-length(vetBin)))),[8:8:24]);
        else
            vetBin = strsplit(vetBin,[8:8:24]);
        end
        result = part(msprintf(" %02s",dec2hex(bin2dec(vetBin))),2:$);
    end
endfunction
