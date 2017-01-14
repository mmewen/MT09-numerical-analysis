function [A] = construct (t, tau)
    exec("place.sci", -1);
    
    m = length(tau);
    n = length(t);
    
    A = zeros(m, n);
    
    for i = 1 : m
        j = place(t, tau(i)); // localise t dans la suite de pts T
//        disp(i);
//        disp(m);
//        disp(j);
//        disp(n);
//        disp("--");
        A(i, j) = (tau(i) - t(j+1)) / (t(j) - t(j+1));
        A(i, j+1) = (tau(i) - t(j)) / (t(j+1) - t(j));
    end
    
endfunction
