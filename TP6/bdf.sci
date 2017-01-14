function [Y] = bdf (z0, z1, t0, T, N, f, dfdx)
    exec("newtonBDF.sci", -1);
    
    p = length(z0);
    
    h = T / N;
    zim1 = z0;
    zi = z1;
    t = t0;
    
    // Parametres Newton
    tol = 10^-10;
    Kmax = 100;
    
    Y = zeros(p, N+1);
    Y(:, 1) = zi;
    
        
    theta = linspace(t0, T+t0, N+1);
    
    for i = 1:N
        dfdx_ = dfdx(t, zi);
        [zip1e, k] = newtonBDF (f, dfdx_, tol, Kmax, zi, h, theta, zi, zim1); // z à l'etape i+1 estimée par la méthode de Newton
        zip1 = 1/3 * (4*zi - zim1 + 2 * h * f(t + h, zip1e));
        Y(:, i+1) = zip1;
        t = t + h;
        
        zim1 = zi;
        zi = zip1;
    end
endfunction
