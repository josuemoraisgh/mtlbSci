function sl=mtlb_minreal(varargin)
   i=length(varargin);
   select i
    case 1 then  
       sys=varargin(1);
       if typeof(sys)=='state-space' then
		   sl=minreal(sys);
	   elseif typeof(sys)=='rational' then
		   if sys('dt')==[] then
			   sl=tf2ss(syslin('c',sys));
		   else
			   sl=tf2ss(sys);
		   end
	   end
      else
	   disp('errorea')
	   break
    end
endfunction
