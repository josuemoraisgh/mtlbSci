function [StrManufacterID, strDeviceTape, strADDRESS]=hrtFrameADDRESS(strFrame)
    tokensFrame = tokens(part(strFrame,hrtFrameIni(strFrame):$),' ')    
    if(hrtFrameType(strFrame) == 1) then
        StrManufacterID = tokensFrame(2);
        strDeviceTape = tokensFrame(3);
    else
        StrManufacterID = '';
        strDeviceTape = '';
        strADDRESS = tokensFrame(2);
    end 
endfunction
