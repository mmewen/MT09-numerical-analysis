function trace2(N, T, cc)
    exec("place.sci", -1);
    exec("calcg.sci", -1);
    clf;
    
    n = size(T,1);
    t = linspace(T(1), T(n), N)';
    for j=1:N
        g(j) = calcg(t(j), T, cc);
    end
    plot(t, g);
endfunction
