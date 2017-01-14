function compareMethodes (a, t0, T, N)
    // compareMethodes(1, 0, 10, [10, 100, 1000, 10000]);
    exec("f.sci", -1);
    exec("euler.sci", -1);
    exec("pt_milieu.sci", -1);
    exec("RK4.sci", -1);
    exec("bashforth.sci", -1);

    TV = zeros(length(N), length(3)); // resultat methodes fonction de N
    TE = zeros(length(N), length(3)); // erreur methodes

    fonc = f;

    for i = 1:length(N)
        Ni = N(i);

        Xe = euler(fonc, t0, T, Ni, a);
        Xp = pt_milieu(fonc, t0, T, Ni, a);
        Xr= RK4(fonc, t0, T, Ni, a);
        TV(i, 1) = Xe(1, $);
        TV(i, 2) = Xp(1, $);
        TV(i, 3) = Xr(1, $);
    end

    tN = T+t0;
    x = 3/2 * exp(-tN) - 1/2 * cos(tN) + 1/2 * sin(tN);
    TE = x - TV;

    plot(log10(N)', -log10(TE(:, 1)), 'r-+');
    
    plot(log10(N)', -log10(TE(:, 2)), 'b-x');
    
    plot(log10(N)', -log10(TE(:, 3)), 'k-o');
    
    legend("Euler", "Point milieu", "RK4");
    
    
    x = linspace(0, 4, 100);
    [c,b] = reglin(log10(N), -log10(TE(:, 1)'));
    plot(x, c*x + b, 'r-');
    disp("Euler : ");
    disp(c);
    [c,b] = reglin(log10(N), -log10(TE(:, 2)'));
    plot(x, c*x + b, 'b-');
    disp("Pt milieu : ");
    disp(c);
    [c,b] = reglin(log10(N), -log10(TE(:, 3)'));
    plot(x, c*x + b, 'k-');
    disp("RK4 : ");
    disp(c);
endfunction
