exec("foncjac.sci", -1);
exec("newton.sci", -1);

x0 = [ 0; 0 ];
[x, k] = newton(foncjac, 0.1, 100, x0)

x0 = [ 0.5; 3 ];

[x, k] = newton(foncjac, 0.1, 100, x0)
