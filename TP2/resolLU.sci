function [x] = resolLU (A, b)
    exec("LU.sci", -1);
    exec("solinf.sci", -1);
    exec("solsup.sci", -1);
    
    // Décomposition LU de A
    [L, U] = LU(A);
    
    // Résolution de Lw = b
    w = solinf(L, b)
    
    // Résolution de Ux = w
    x = solsup(U, w)
    
endfunction
