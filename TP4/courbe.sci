function courbe (N)
    t = linspace(0, 2*%pi);
    x = 2 * cos(t);
    y = 2 * sin(t);
    
    a = gca();
    a.isoview = "on"; // isoview mode
    
    plot(x, y, "b");
    
    
    t = linspace(-3, 2.2);
    plot(t, exp(t), "r");
    
endfunction
