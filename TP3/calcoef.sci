function [cc] = calcoef(T, y)
    n = length(T);
    exec("cald.sci", -1);
    d = cald(T, y);
    h = T(n) - T(1:n-1);
    cc = zeros(n-1, 4);
    
    cc(:, 1) = y(1:n-1);
    cc(:, 2) = d(1:n-1);
    cc(:, 3) = (y(2:n) - y(1:n-1)) ./ (h .* h) + d(1:n-1) ./ h;
    cc(:, 4) = (d(2:n) + d(1:n-1)) ./ (h .* h) - 2* (y(2:n) - y(1:n-1)) ./ (h .* h .* h);
endfunction
