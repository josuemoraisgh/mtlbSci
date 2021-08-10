function iniFrame=hrtFrameIni(strFrame)
//          PREAMBLE  DELIMITER  ADDRESS  COMMAND  NBBody  BODY   CheckSum
//          xbytes    1bytes     1bytes   1bytes   1byte   xbytes 1byte
//                                         OU          
// PREAMBLE DELIMITER MANUFACTERID DEVICETYPE ADDRESS  COMMAND  NBBody  BODY   CheckSum
// xbytes   1bytes    1bytes       1bytes     3bytes   1bytes   1byte   xbytes 1byte
    iniFrameAux = strindex(strFrame,'/FF ([^F][A-F0-9]|[A-F0-9][^F])/g' ,'r');
    if iniFrameAux == [] then
        iniFrame = 0;
    else
        iniFrame = iniFrameAux(1)+3;
    end
endfunction



    






