function Y = vdp(t, X)
    c = 0.4;
    
    Y = [ X(2);
        c * (1 - X(1) * X(1)) * X(2) - X(1)];
endfunction
