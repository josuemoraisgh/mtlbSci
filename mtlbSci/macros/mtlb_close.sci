function mtlb_close(varargin)
   i=length(varargin);
   select i
    case 0 then
        delete(gcf());
    case 1 then 
        if varargin(1)=="all" then    
            xdel(winsid()); 
        else
            delete(varargin(1));
        en
        
     case 2 then
         xdel(winsid());
     else
         disp('Error Close');
   end
endfunction
