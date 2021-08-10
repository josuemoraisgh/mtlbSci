function strPAscii=hrtTypeHex2PAscii(strHex)//Quando recebe uma cadeia de hex e retorna a string em PAscii
//packed_ascii = ['@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O';..
//                'P','Q','R','S','T','U','V','W','X','Y','Z','[','\',']','^','_';..
//                ' ','!',''"','#','$','%','&','''','(',')','*','+',',','-','.','/';..
//                '0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?'];
//                  ascii   <-> packed_ascii
//                0100 0000 <-> 0000 0000
//                0101 1111 <-> 0001 1111
//                0010 0000 <-> 0010 0000
//                0011 1111 <-> 0011 1111
    strPAscii = '';
    strAux = msprintf("%08s",dec2bin(hex2dec(tokens(strHex,' '))));
    tam = length(strAux);
    if modulo(tam,6) == 0 then
        vetBin = bin2dec(strsplit(strAux,[6:6:tam-6])); 
    else
        vetBin = bin2dec(strsplit(strAux,[tam-int(tam/6)*6:6:tam-6])); 
    end
    for i=1:length(vetBin)
        if bitget(vetBin(i),6)==0 then //Se bit 6 == 0
            strPAscii = strPAscii+ascii(bitset(vetBin(i),7,1)); //Alterar bits 7 = 1
        else                     
            strPAscii = strPAscii+ascii(bitset(vetBin(i),7,0)); //Alterar bits 7 = 0
        end 
    end
endfunction
          
