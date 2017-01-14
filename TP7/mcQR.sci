function [z] = mcQR (A, y)
    exec("solsup.sci", -1);
    [Q, R] = qr(A);
    
    n = size(A, 2);
    
    c = Q' * y;
    c = c(1:n, :);
    
    Rtilde = R(1:n, :);
    disp("cond R~");
    c1 = cond(Rtilde);
    disp(c1);
    disp("cond A^T A = ")
    c2 = cond(A'*A);
    disp(c2);
    disp("diff !!!")
    disp(c1*c1 - c2);
    z = solsup(Rtilde, c);
endfunction
