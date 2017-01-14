function trace(N, T, cc)
    exec("place.sci", -1);
    clf;
    
    n = size(T,1);
    t = linspace(T(1), T(n), N)';
    for j=1:N
        i = place(T, t(j));
//        disp(t(j));
//        disp(T(i));
//        disp(i);
        g(j) = cc(i, 1) + cc(i, 2) * t(j) + cc(i, 3) * t(j)^2;
    end
    plot(t, g);
endfunction
