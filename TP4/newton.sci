function [x, k] = newton(foncjac, tol, N, x0)
    // Résolution du système 
    // tol : erreur RELATIVE en dessous de laquelle on considère la solution stationnaire
    // N : nb max d'itérations
    // x0 : valeur de x à laquelle on commmence les itérations
    // k : nb d'itérations effectuées
     
    n = length(x0);

    x = zeros(n, 1);
    
    x = x0;
    
    for k = 1:N
        [F, J] = foncjac(x);
        h = J\F;
        x = x - h;
        
        // Si évolution < tol, on retourne le résultat
        if norm(h) / norm(x) < tol then
            return;
        end
    end
    
    // Si nb max d'itération atteint, erreur
    error('Le nombre maximum d itérations a été atteint sans converger');
endfunction
