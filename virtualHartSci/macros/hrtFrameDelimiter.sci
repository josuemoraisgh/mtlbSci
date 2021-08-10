function StrDelimiter=hrtFrameDelimiter(strFrame)
    StrDelimiter = tokens(part(strFrame,hrtFrameIni(strFrame):$),' ')(1);
endfunction
