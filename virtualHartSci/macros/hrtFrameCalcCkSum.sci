function ckSumHex=hrtFrameCalcCkSum(strFrame,comCkSum)
//Recebe -> Frame com o ultimo byte de ckSum inserido e sem preambulo.
//Retorna -> O ckSum do strFrame correto.
    vetData = hex2dec(tokens(part(strFrame,hrtFrameIni(strFrame):$),' '));
    ckSumDec = vetData(1);
    for i=2:length(vetData)-comCkSum
        ckSumDec=bitxor(ckSumDec,vetData(i));
    end
    ckSumHex = msprintf("%02s",dec2hex(ckSumDec));
endfunction
