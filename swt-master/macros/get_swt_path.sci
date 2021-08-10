function p=get_swt_path()
 //return the path where the sif decoder is installed
  t=string(swtlib)
  p=t(1)
  p=strsubst(p,'//','/');
  p=part(p,1:length(p)-length('macros')-1)
endfunction