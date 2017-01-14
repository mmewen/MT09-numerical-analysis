function [x] = solsup(U, b)
    // U matrice carrée triangulaire supérieure dans Rnn
    // b un vecteur de Rn
    // Retour : x un vecteur de Rn qui résout Ux = B
    eps = 1e-12;
    
    n = size(b, 1);
    
    if (size(U, 1) <> n) | (size(U, 2) <> n) then
        error("Dimensions incohérentes");
    end
    
    x = zeros(n, 1);
    
    // Pour chaque ligne de L
    for i = n:-1:1
        // On calcule xi
                
//        somme = 0;
//        for j = i+1:n
//            somme = somme + U(i, j) * x(j);
//        end

        if abs(U(i,i)) < eps then
            error("U non inversible; terme diagonal presque nul...");
        end

        somme = U(i, i+1:n) * x(i+1:n);
        
        x(i) = (b(i) - somme) / U(i,i);
    end
    
    return x;
endfunction
