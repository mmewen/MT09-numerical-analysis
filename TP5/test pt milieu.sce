exec("f.sci", -1);
exec("pt_milieu.sci", -1);

t0 = 0;
T = 3;
N = 50;
y0 = 1;
Y = pt_milieu(f, t0, T, N, y0);

x = linspace(t0,T+t0, N+1);
plot(x, Y);
Yref = y0 * exp(-1 * (x - t0));
plot(x, Yref, 'r');
