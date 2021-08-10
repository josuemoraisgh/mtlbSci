function hrtAquisicao(varargin)
    global serial configTrms
    porta=1;baudRate='19200';dataBits='8';paridade='n';stopBits='1';
    select argn(2)
        case 1 then
            porta     = varargin(1);        
        case 2 then
            porta     = varargin(1);
            baudRate  = varargin(2);
        case 3 then
            porta     = varargin(1);            
            baudRate  = varargin(2);
            dataBits  = varargin(3);
        case 4 then
            porta     = varargin(1);            
            baudRate  = varargin(2);
            dataBits  = varargin(3);
            paridade  = varargin(4);
        case 5 then
            porta     = varargin(1);            
            baudRate  = varargin(2);
            dataBits  = varargin(3);
            paridade  = varargin(4);
            stopBits  = varargin(5);            
    end
    //try
        hrtSerialCloseAll();
        serial = hrtSerialOpen(porta,baudRate+','+paridade+','+dataBits+','+stopBits); 
        while get('BConectar','Enable') == 'off' do
            tabs = get('tabs').Children; 
            for i=1:size(tabs,1)
                configTrms(:,4+i) = tabs(i).Children.String(:,3);
            end 
            [n,status] = hrtSerialStatus(serial);
            if(n(1)>0)then
                strFrame=hrtSerialRead(serial,n(1));
                if hrtFrameCalcCkSum(strFrame,1)==hrtFrameCkSum(strFrame) then
                    str = hrtCommand(string(hex2dec(hrtFrameCommand(strFrame))),strFrame);
                    disp(strFrame+' -> '+str);
                    hrtSerialWrite(serial,str);
                end
            end
        end
    //catch
    //    disp('Falha na função hrtAquisicao');
    //end
    hrtSerialClose(serial);
endfunction
