exec("diffDiv.sci", -1);
exec("horn.sci", -1);

N = 100; // nb de pts affichés
theta = 12; // ordonnée à calculer

t = linspace(-5, 5, N);

f = t.^3 - 4 * t + 0;

tEch = [ t(40) t(N/2) t(80) ];
fEch = [ f(40) f(N/2) f(80) ];

//disp(tEch);
//disp(fEch);

a = diffDiv(tEch, fEch);
// 3 coefficients d'un polynome de dégré 2

disp(a);

fNewt = size(t);

for i = 1 : length(t)
    [p, pprim] = horn(a, tEch(1:$-1), t(i));
    fNewt(i) = p;
end

disp(fNewt(i));

clf;
drawlater
plot(t, f, "r");
plot(t, fNewt, "g");
plot(tEch, fEch, "xb");
drawnow
