function [Y] = RK4(f, t0, T, N, y0)
    p = length(y0);
    
    h = T / N;
    zn = y0;
    t = t0;
    
    Y = zeros(p, N+1);
    Y(:, 1) = zn;
    
    for n = 1:N
        K0 = f(t, zn);
        K1 = f(t + h/2, zn + h/2 * K0);
        K2 = f(t + h/2, zn + h/2 * K1);
        K3 = f(t + h, zn + h * K2);
        zn = zn + h/6 * (K0 + 2 * K1 + 2 * K2 + K3);
        Y(:, n+1) = zn;
        t = t + h;
    end
endfunction
