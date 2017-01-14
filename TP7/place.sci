function [i] = place(T, t)
    n = length(T);
    
    if t < T(1) | t > T(n) then
        error("t en dehors des bornes");
    end
    
    if t == T(n) then
        i= n-1;
        return;
    end
    
    imin = 1;
    imax = n;
    
    while (imax - imin) > 1 then
        mil = imin + floor((imax - imin) / 2);
        
        if t >= T(mil) then
            imin = mil;
        else
            imax = mil;
        end
    end
    
    i = imin;
endfunction
