function [B] = inverse(A)
    exec("LU.sci", -1);
    exec("solinf.sci", -1);
    exec("solsup.sci", -1);
    
    [n,m] = size(A);
    
    if (n <> m) then
        error("A doit être carrée");
    end
    
    I = eye(n, n);
    [L, U] = LU(A);
    
    // Attention, il ne faut pas faire n fois la décomposition LU !!
    
    for j=1:n
        b = I(:, j)
        
        // Résolution de Lw = b
        w = solinf(L, b)
        
        // Résolution de Ux = w
        x = solsup(U, w)
        
        B(:, j) = x
    end
endfunction
