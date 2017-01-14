function z = mcnorm (A, y)
    // résoud A'Az = A'y
    
    z = (A'*A)\(A'*y);
    
endfunction
