function [a] = diffDiv(t, y)
    // diffDiv([1, 3, 4.5,5, 6], [1, 5, 3, 7, -1])
    
    // calcule a, les différences divisées. On a :
    //      - t est un vecteur de taille n+1 contenant les t_i.
    //      - y est un vecteur de taille n+1 contenant les valeurs aux t_i.
    // Le polynôme p s'écrit :
    // p(t) = a_0 + a_1 (t-t_0) + a_2 (t-t_0)(t-t_1) + ... + a_n (t-t_0)(t-t_1)...(t-t_{n-1})
    // a est un vecteur de taille n contenant les coefficients du polynôme p dans la base de Newton,
    
    n = length(t) - 1;
    
    if length(y) <> (n + 1) then
        error("Dimensions incompatibles entre t et y");
    end
    
    d = zeros(n);
    
    for i = 1 : n+1 // 0 à n
        d(i) = y(i);
    end
    
    for k = 2 : n+1 // 1 à n
        for i = n+1 : -1 : k+1 // n à k
            d(i) = (d(i) - d(i-1)) / (t(i) - t(i-k));
        end
    end
    
    a = d;
endfunction
