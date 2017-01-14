function trace (a, t0, T, Neuler, Nbashforth, Nptmilieu, NRK4, Node)
    // trace([2; -2], 0, 15, 1000, 100, 30);
    exec("vdp.sci", -1);
    exec("euler.sci", -1);
    exec("pt_milieu.sci", -1);
    exec("RK4.sci", -1);
    exec("bashforth.sci", -1);
    
    theta = linspace(t0,T+t0, Node+1);
    Yode = ode(a, t0, theta, vdp);
    
    Yeuler = euler(vdp, t0, T, Neuler, a);
    Yptmilieu = pt_milieu(vdp, t0, T, Nptmilieu, a);
    YRK4 = RK4(vdp, t0, T, NRK4, a);
    Ybashforth = bashforth(vdp, t0, T, Nbashforth, a, Yode(:, 2));
    
    plot(Yeuler(1,:), Yeuler(2,:), 'r-+');
    plot(Yptmilieu(1,:), Yptmilieu(2,:), 'b-x');
    plot(YRK4(1,:), YRK4(2,:), 'k-o');
    plot(Ybashforth(1,:), Ybashforth(2,:), 'c-*');
    plot(Yode(1,:), Yode(2,:), 'm');
    
    xtitle("Schémas de phase")
    legend("Euler", "Point milieu", "RK4", "Bashforth", "ODE");
endfunction
