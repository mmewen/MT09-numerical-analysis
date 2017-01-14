function [Y] = pt_milieu(f, t0, T, N, y0)
    p = length(y0);
    
    h = T / N;
    zn = y0;
    t = t0;
    
    Y = zeros(p, N+1);
    Y(:, 1) = zn;
    
    for n = 1:N
        // Estimation à z à l'instant n+1/2        
        ztilde = zn + h/2 * f(t, zn);
        zn = zn + h * f(t + h/2, ztilde);
        Y(:, n+1) = zn;
        t = t + h;
    end
endfunction
