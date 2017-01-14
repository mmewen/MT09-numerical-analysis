function [x] = solinf(L, b)
    // L matrice carrée triangulaire inférieure dans Rnn
    // b un vecteur de Rn
    // Retour : x un vecteur de Rn qui résoud Lx = B
    
    n = size(b, 1);
    
    if (size(L, 1) <> n) | (size(L, 2) <> n) then
        error("Dimensions incohérentes");
        
    end
    
    x = zeros(n, 1);
    
    // Pour chaque ligne de L
    for i = 1:n
        // On calcule xi
                
        somme = 0;
        for j = 1:i-1
            somme = somme + L(i, j) * x(j);
        end
        
        x(i) = (b(i) - somme) / L(i,i);
    end
    
    return x;
endfunction
