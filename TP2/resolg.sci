function [x] = resolg(A, b)
    exec("trisup.sci", -1);
    exec("solsup.sci", -1);
    [U,e] = trisup(A,b);
    x = solsup(U,e);
endfunction
