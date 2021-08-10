function strCommand = hrtFrameCommand(strFrame)
    tokensFrame = tokens(part(strFrame,hrtFrameIni(strFrame):$),' ')
    count = hrtFrameType(strFrame)*4;
    strCommand = tokensFrame(3+count);
endfunction
