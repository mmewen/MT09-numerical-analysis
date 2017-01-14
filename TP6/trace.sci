function trace (a, t0, T, Neuler, Nbashforth, Nptmilieu, NRK4, Node)
    // trace(1, 0, 10, 200, 200, 100, 50, 500);
    exec("f.sci", -1);
    exec("euler.sci", -1);
    exec("pt_milieu.sci", -1);
    exec("RK4.sci", -1);
    exec("bashforth.sci", -1);
    
    fonc = f;
    
    
    theta = linspace(t0,T+t0, Node+1);
    Yode = ode(a, t0, theta, fonc);
    
    Yeuler = euler(fonc, t0, T, Neuler, a);
    Yptmilieu = pt_milieu(fonc, t0, T, Nptmilieu, a);
    YRK4 = RK4(fonc, t0, T, NRK4, a);
    Ybashforth = bashforth(fonc, t0, T, Nbashforth, a, Yptmilieu(:, 2));

    plot(linspace(t0,T+t0, Neuler+1), Yeuler(1,:), 'r-+');
    plot(linspace(t0,T+t0, Nptmilieu+1), Yptmilieu(1,:), 'b-x');
    plot(linspace(t0,T+t0, NRK4+1), YRK4(1,:), 'k-o');
    plot(linspace(t0,T+t0, Nbashforth+1), Ybashforth(1,:), 'c-*');
    plot(linspace(t0,T+t0, Node+1), Yode(1,:), 'm');
    
    xtitle("Schémas de phase")
    legend("Euler", "Point milieu", "RK4", "Bashforth", "ODE");
endfunction
