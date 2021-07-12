function hold(str)
    if str == "on" || str == "ON" then
        set(gca(),"auto_clear","off")
    else
        set(gca(),"auto_clear","on")
    end
endfunction
