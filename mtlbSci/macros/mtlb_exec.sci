function mtlb_exec(varargin)
 nomearq = "";
 modeFunc = -1;
 select argn(2)
   case 0 then
     nomearq = uigetfile("*.*",pwd());
   case 1 then
     nomearq = varargin(1);
   case 2 then
     nomearq = varargin(1);
     modeFunc= varargin(2);
 end
 [path,fname,extension]=fileparts(nomearq);
 chdir(path);
 if extension =='.m' then
    //mtlb_getd(dir) - Fazer a função 
    fd = mopen(nomearq,'rt');
    str = mgetl(fd);
    mclose(fd);
    str = strsubst(str,'/[^"']%|^%/','//','r');
    nomearq = path+"\"+fname+".sce";
    fd = mopen(nomearq,'wt');
    mputl(str,fd);
    mclose(fd); 
 else
    getd(path);
 end
 exec(nomearq,modeFunc);
endfunction

