function strCkSum=hrtFrameCkSum(strFrame)
    strCkSum = tokens(part(strFrame,hrtFrameIni(strFrame):$),' ')($);
endfunction
