function mtlb_exec(varargin)
    select argn(2)
        case 1 then
            exec(varargin(1),-1);
        case 2 then
            exec(varargin(1),varargin(2));
        case 3 then
            exec(varargin(1),varargin(2),varargin(3));
        case 4 then
            exec(varargin(1),varargin(2),varargin(3),varargin(4));
        else
            error("exec_mtlb - Number of arguments exceeded")
    end
endfunction
