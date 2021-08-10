function hrtGuiConectar()
    set('BConectar','Enable','off');
    set('BDesconectar','Enable','on');
    set('ePort','Enable','off');
    set('eBaudRate','Enable','off');
    set('eDataBits','Enable','off');
    set('eParity','Enable','off');
    set('eStopBits','Enable','off');
    hrtAquisicao(uint8(strtod(get('ePort','String'))),...
                 get('eBaudRate','String'),...
                 get('eDataBits','String'),...
                 get('eParity','String'),...
                 get('eStopBits','String'));
endfunction
