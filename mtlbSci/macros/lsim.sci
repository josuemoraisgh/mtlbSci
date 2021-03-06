function varargout=lsim(sys, u, t, varargin)
    if typeof(sys)=='state-space' then
        sl=minreal(sys);
    elseif typeof(sys)=='rational' then
        if sys('dt')==[] then
            varargout=csim(u,t,sys);
        else
            varargout=dsimul(tf2ss(sys),u);
        end
    end
endfunction
