function strBody = hrtFrameBody(strFrame)
    tokensFrame = tokens(part(strFrame,hrtFrameIni(strFrame):$),' ')
    count = hrtFrameType(strFrame)*4;
    strNBBody = tokensFrame(4+count);
    nBBody = hex2dec(strNBBody);
    if nBBody == 0 then
        strBody = '';
    else
        strBody = tokensFrame(5+count:4+count+nBBody);
    end
endfunction
