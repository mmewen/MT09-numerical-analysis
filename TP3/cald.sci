function [d] = cald(T, y)
    n = length(T);
    h = T(2:n) - T(1:n-1);
    c = 1 ./ h(1:n-1);
    a = [0; c];
    b = 2 * ([0 ; c] + [c ; 0]);
    dy = y(2:n) - y(1:n-1);
    u1 = dy(1:n-1) .* (c .* c)
    u = 3 * ([0; u1] + [u1; 0]);
    d = rich (a, b, c, u);
endfunction
