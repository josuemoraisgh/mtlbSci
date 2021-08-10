mode(7)
//        generate random matrix
a=rand(33,44,55);
//        decomposition
b=dwt3(a,'db2','db3','db4');
//        reconstruction
c=idwt3(b,'db2','db3','db4',[33 44 55]);
//        calculate the eror
sum(abs(a-c))
