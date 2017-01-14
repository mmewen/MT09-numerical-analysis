function [Y] = bashforth(f, t0, T, N, y0, y1)
    p = length(y0);
    
    h = T / N;
    znm1 = y0;
    zn = y1;
    t = t0 + h;
    
    Y = zeros(p, N+1);
    Y(:, 1) = znm1;
    Y(:, 2) = zn;
    
    Fn = zeros(p, 1);
    Fnm1 = f(t0, y0);
    
    for n = 2:N
        Fn = f(t, zn);
        zn = zn + h/2 * (3 * Fn - Fnm1);
        Y(:, n+1) = zn;
        Fnm1 = Fn;
        t = t + h;
    end
endfunction
