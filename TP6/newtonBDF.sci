function [x, k] = newtonBDF (f, dfdx, tol, Kmax, x0, h, theta, U, V)
        // Résolution du système 
    // tol : erreur RELATIVE en dessous de laquelle on considère la solution stationnaire
    // N : nb max d'itérations
    // x0 : valeur de x à laquelle on commmence les itérations
    // k : nb d'itérations effectuées
     
    n = length(x0);
    
    x = zeros(n, 1);
    
    x = x0;
    
    a = 2 * h / 3;
    
    for k = 1:Kmax
        F = [x - 1/3 * (4 * U - V + 2 * h * f(theta(k), x))];
        J = [ 1- a * dfdx(1, 1),   - a * dfdx(1, 2);
               - a * dfdx(2, 1), 1 - a * dfdx(2, 2)];
        
        H = J\F;
        x = x - H;
        
        // Si évolution < tol, on retourne le résultat
        if norm(H) / norm(x) < tol then
            return;
        end
    end
    
    // Si nb max d'itération atteint, erreur
    error('Le nombre maximum d itérations a été atteint sans converger');
endfunction
