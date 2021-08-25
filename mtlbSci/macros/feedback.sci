function G=feedback(Gs,H)
    G = Gs/(1+Gs*H);
endfunction
