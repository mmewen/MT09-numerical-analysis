function [L, U] = LU(A)
    tol = 1e-12;
    [n,m] = size(A);
    
    if (n <> m) | n <> size(b,1) then
        error("Dimensions incohérentes");
    end
    
    // Attention : on peut le faire en modifiant trisup !!
    // voir exo 1 TD2
    // aik / akk -> lik
    
    //L = eye(n,n);
    //U = zeros(n,n);
    //
    //for k = 1:n
    //    
    //    for j = k:n
    //        U (k,j) = A(k,j) - L(k,1:k-1) * U(1:k-1,j);
    //    end
    //    
    //    if abs(U(k,k)) < tol then
    //        error('Pivot nul');
    //    end
    //    
    //    for i = k+1:n
    //        c =  1/ U(k,k);
    //        L(i,k) = c * (A(i,k)-L(i,1:k-1) * U(1:k-1,k));
    //    end
    //end
    
    U = A;
    L = eye(n,n);
    e = b;
    for k = 1:n-1
        if abs(U(k,k)) < tol then
            error('Pivot nul');
        end
        for i = k+1:n
            L(i,k) = U(i,k) / U(k,k);
            U(i,k) = 0;
            for j = k+1:n
                U (i,j) = U(i,j) - L(i,k) * U(k,j);
            end
        end
    end
    if abs(U(n,n)) < tol then
        error('Pivot nul');
    end
endfunction
