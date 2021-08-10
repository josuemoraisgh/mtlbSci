function typeFrame=hrtFrameType(strFrame)
    typeFrame = bitget(hex2dec(hrtFrameDelimiter(strFrame)),8);
endfunction
