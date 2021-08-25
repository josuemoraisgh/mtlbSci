function res = mtlbSci_translate(nomearq)
 [path,fname,extension]=fileparts(nomearq); 
 chdir(path);//Fazer outro chdir: Sempre que mudar de diretorio, apagar os arquivos "*.m~" do diretorio anterior
 if extension =='.m' then 
    if 'sci'==mtlbSci_mode() then
        disp("Mudando para o modo MTLB!!")
        mtlbSci_mode("mtlb");
    end
    //mtlb_getd(path); //Como superar o programa que chama o clear antes ??
    res = path+fname+".m~";
    if isfile(res) then
        infoMainFile = fileinfo(nomearq);
        infoNewFile = fileinfo(res);
        if(infoMainFile(6) <= infoNewFile(6)) then
            return;
        end
    end
    fd = mopen(nomearq,'rt');
    str=mgetl(fd);
    mclose(fd);
    str = strsubst(str,'/%%|%/','//','r');
    fd = mopen(res,'wt');
    mputl(str,fd);
    mclose(fd);
 else
    res = nomearq;
    if 'mtlb'==mtlbSci_mode() then
        disp("Mudando para o modo SCI!!")
        mtlbSci_mode("sci");
    end
 end
endfunction
