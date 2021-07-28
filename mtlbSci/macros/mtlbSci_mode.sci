function varargout = mtlbSci_mode(varargin)
    global %MTLB_TIPO
    if argn(2)==0 then
        varargout(1)=%MTLB_TIPO;
    else
        select varargin(1)
            case 'sci' then
                %MTLBMODE = 'sci';
                changeModeMtlbSci();
            case 'mtlb' then
                %MTLBMODE = 'mtlb';
                changeModeSciMtlb();
            else
                disp('Erro!!! Tipos esperados são: ''sci'' e ''mtlb''' )
        end
    end
endfunction
