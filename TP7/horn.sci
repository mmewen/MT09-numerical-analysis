function [p, pprim] = horn(a, t, theta)
    // calcule p(theta) et p'(theta), où :
    //      - theta est un réel,
    //      - a est un vecteur de taille n+1 contenant les coefficients du polynôme p dans la base de Newton,
    //      - et t est un vecteur de taille n contenant les t_i (i=0,...,n-1 pour la base de Newton).
    // Le polynôme p s'écrit :
    // p(t) = a_0 + a_1 (t-t_0) + a_2 (t-t_0)(t-t_1) + a_3 (t-t_0)(t-t_1)(t-t_2) + ... + a_n (t-t_0)(t-t_1)...(t-t_{n-1})
    
    n = length(t);
    
    if length(a) <> (n + 1) then
        error("Dimensions incompatibles entre a et t");
    end
    
    // b correspondra à p(theta)
    b = a(n + 1);
    
    c = zeros(n + 1);
    // c_0 (donc c(1)) ne sera pas utilisé
    // c_1 (donc c(2)) correspondra à p'(theta)
    c = a(n + 1);
    
    for i  = n : -1 : 1 // de n-1 à 0
        b(i) = a(i) - b(i+1) * (t(i) - theta);
        c(i) = b(i) - c(i+1) * (t(i-1) - theta);
    end
    
    for i  = n : -1 : 2 // de n-1 à 1
        c(i) = b(i) - c(i+1) * (t(i-1) - theta);
    end
    
    p = b(1);
    pprim = c(2);
    
endfunction
