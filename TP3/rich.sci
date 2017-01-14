function [x] = rich (a, b, c, u)
    n = length(b);
    tol = 1e-12;
    
    if (length(a) <> n) | (length(c) <> n - 1) then
        error("Dimensions incorrectes");
    end
    
    e = zeros(n-1, 1);
    f = zeros(n, 1);
    x = zeros(n, 1);
    
    if abs(b(1)) < tol then
        error('pivot 1 nul');
    end
    
    e(1) = - c(1) / b(1);
    f(1) =   u(1) / b(1);
    c(n) = -%inf; // pas utilise
    
    for i = 2:n
        tmp = a(i) * e(i-1) + b(i);
    
        if abs(tmp) < tol then
            error('pivot nul'); // ????
        end
        
        e(i) = - c(i) / tmp; // e(n) pas utilise
        f(i) = (u(i) - a(i) * f(i-1)) / tmp;
    end
    
 
    x(n) = f(n);
    
    for i = n-1 : -1 : 1
        x(i) = e(i) * x(i+1) + f(i);
    end
endfunction
