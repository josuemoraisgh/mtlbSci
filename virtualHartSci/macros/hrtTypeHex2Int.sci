function result=hrtTypeHex2Int(strInt)
    number = hex2dec(tokens(strInt,' ')); 
    if bitget(str(1),8)== 1 then 
        result = -1*bitcmp((number(1)*256+number(2))-1,16);        
    else 
        result = number(1)*256+number(2);        
    end   
endfunction
