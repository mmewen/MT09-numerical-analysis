function[f, J] = foncjac(x)
    f = [x(1) * x(1) + x(2) * x(2) - 4; x(2) - exp(x(1))];
    J = [2 * x(1), 2 * x(2); -exp(x(1)), 1];
endfunction
