function [U,e] = trisup(A,b)
    tol = 1e-12;
    [n,m] = size(A);
    
    if (n <> m) | n <> size(b,1) then
        error("Dimensions incohérentes");
    end
    
    U = A;
    e = b;
    for k = 1:n-1
        if abs(U(k,k)) < tol then
            error('Pivot nul');
        end
        for i = k+1:n
            c = U(i,k) / U(k,k);
            e(i) = e(i) - c*e(k);
            U(i,k) = 0;
            for j = k+1:n
                U (i,j) = U(i,j) - c*U(k,j);
            end
        end
    end
    if abs(U(n,n)) < tol then
        error('Pivot nul');
    end
endfunction
