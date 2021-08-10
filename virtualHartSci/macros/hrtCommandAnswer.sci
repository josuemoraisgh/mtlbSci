function strAnswer = hrtCommandAnswer(strFrame,strMensage,strDescri)
    iniFrame = hrtFrameIni(strFrame);
    if hrtFrameType(strFrame) == 1 then
        str = hrtFramePreamble(strFrame)+' 86 '+part(strFrame,iniFrame+3:iniFrame+20)+strMensage;
    else
        str = hrtFramePreamble(strFrame)+' 06 '+part(strFrame,iniFrame+3:iniFrame+8)+strMensage; 
    end  
    strAnswer = str+' '+hrtFrameCalcCkSum(str,0)
endfunction
