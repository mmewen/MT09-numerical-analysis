function [Y] = euler(f, t0, T, N, y0)
    p = length(y0);
    
    h = T / N;
    zn = y0;
    t = t0;
    
    Y = zeros(p, N+1);
    Y(:, 1) = zn;
    
    for n = 1:N
        zn = zn + h * f(t + h, zn);
        Y(:, n+1) = zn;
        t = t + h;
    end
endfunction
