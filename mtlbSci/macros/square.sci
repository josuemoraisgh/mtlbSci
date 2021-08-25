function sl=square(varargin)
  select argn(2)
    case 1 then  
        sl=squarewave(varargin(1));
    case 2 then 
        sl=squarewave(varargin(1),varargin(2));
     else
	   disp('Error');
	   break;
    end
endfunction
