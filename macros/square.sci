function sl=square(varargin)
   i=length(varargin);
   select i
    case 1 then  
        sl=squarewave(varargin(1));
    case 2 then 
        sl=squarewave(varargin(1),varargin(2));
      else
	   disp('Error');
	   break;
    end
endfunction
