function tracemilieu (a, t0, T, N)
    // tracemilieu([2; -2], 0, 15, 100)
    exec("vdp.sci", -1);
    exec("pt_milieu.sci", -1);
    
    Y = pt_milieu(vdp, t0, T, N, a);
    
    theta = linspace(t0,T+t0, N+1);
    
    Yode = ode(a, t0, theta, vdp);
    
    plot(Y(1,:), Y(2,:));
    plot(Yode(1,:), Yode(2,:), 'r');
    
    xtitle("Portrait de phase avec attracteur", "u ", "u prime");
endfunction
