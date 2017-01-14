function tracebdf(a, t0, T, Nptmil, Nbdf, Node)
    // tracebdf([2; -2], 0, 15, 100, 100, 100);
    
    exec("bdf.sci", -1);
    exec("vdp.sci", -1);
    exec("dvdpdx.sci", -1);
    exec("pt_milieu.sci", -1);
    
    theta = linspace(t0, T+t0, Node+1);
    Yode = ode(a, t0, theta, vdp);
    
    Yptmilieu = pt_milieu(vdp, t0, T, Nptmil, a);
    
    Ybdf = bdf (a, Yptmilieu(:,1), t0, T, Nptmil, vdp, dvdpdx);
    
    plot(linspace(t0, T+t0, Nptmil+1),  Yptmilieu(1,:), 'b-x');
    plot(linspace(t0, T+t0, Nbdf+1),    Ybdf(1,:),      'c-*');
    plot(theta,                         Yode(1,:),      'm');
endfunction
