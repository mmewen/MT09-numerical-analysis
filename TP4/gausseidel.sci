function [x, k] = gausseidel(A, b, tol, N, x0)
    // Résolution du système Ax = b par la méthode itérative de gauss-Seidel
    // tol : erreur RELATIVE en dessous de laquelle on considère la solution stationnaire
    // N : nb max d'itérations
    // x0 : valeur de x à laquelle on commmence les itérations
    // k : nb d'itérations effectuées

    // Attention, on ne calcule PAS les matrices E, F et D et JAMAIS leur inverse !

    n = length(b);

    if (size(A, 1) <> n) | (size(A, 2) <> n | size(x0, 1) <> n) | (size(x0, 2) <> 1) then
        error("Dimensions incorrectes");
    end

    x = zeros(n, 1);

    x = x0;

    for k = 1:N
        for i = 1:n
            x(i) = (b(i) - A(i, 1:i-1)*x(1:i-1) - A(i, i+1:n)*x(i+1:n)) / A(i, i);
        end

        // Si évolution < tol, on retourne le résultat
        if norm(x - x0) / norm(x) < tol then
            return;
        end
        x0 = x;
    end

    // Si nb max d'itération atteint, erreur
    error('Le nombre maximum d itérations a été atteint sans convergence');
endfunction
