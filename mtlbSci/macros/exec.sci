function varargout = exec(varargin)
 if argn(2)==0 then
    nomearq = uigetfile("*.*",pwd());
    execold(mtlbSci_translate(nomearq),-1);
 else
      select argn(2)
        case 1 then
            if isdir(varargin(1)) then
                execold(varargin(1),2);
            else
                execold(mtlbSci_translate(varargin(1)),-1);
            end
        case 2 then
            if isdir(varargin(1)) then
                execold(varargin(1),varargin(2));
            else
                execold(mtlbSci_translate(varargin(1)),2);
            end
        case 3 then
            if isdir(varargin(1)) then            
                varargout(1)=execold(varargin(1),varargin(2),varargin(3));
            else            
                varargout(1)=execold(mtlbSci_translate(varargin(1)),varargin(2),varargin(3));
            end
        else
            disp('Parameters exceeded!!');
        end
 end
endfunction

