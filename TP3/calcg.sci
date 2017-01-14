function [z] = calcg(t, T, cc)
    exec("place.sci", -1);
    
    i = place(T, t);
    
    dti = t - T(i)
    
    z = cc(i, 1) + ...
        cc(i, 2) * dti + ..
        cc(i, 3) * dti * dti + ...
        cc(i, 4) * dti * dti * (t - T(i+1));
endfunction
