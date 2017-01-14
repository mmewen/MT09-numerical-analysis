exec("construct.sci", -1);
exec("mcnorm.sci", -1);
exec("mcQR.sci", -1);

//t1 = [0, 1, 3, 4, 5.5, 6];
//tau1 = t1;
//
//A1 = construct(t1, tau1)
////disp(A1);
//
// ---------------------

t2 = [0, 1, 3, 4, 5.5, 6];
tau2 = [0.5, 2, 2.5, 3.5, 4.5, 5.75];
y2 = [1, 1.5, 1.25, 0, 0, 1.5]';

A2 = construct(t2, tau2)
//disp(A2);

z2 = mcnorm(A2, y2)

figure;
plot(tau2, y2', "+r");
plot(t2, z2', "-b");

// ---------------------

t3 = [0, 1, 3, 4, 5.5, 6];
tau3 = linspace(0, 6, 21);
y3 = [0, 0.6, 1.4, 1.7, 2.1, 1.9, 1.6, 1.4, 1.4, 1, 0.5, 0.4, -0.2, -0.8, -0.5, 0, 0.4, 1, 1.6, 1.7, 1.2]';

A3 = construct(t3, tau3)
//disp(A3);

z3 = mcnorm(A3, y3)
z3bis = mcQR(A3, y3)

norm(z3 - z3bis)

disp("cond M");
disp(cond(A' * A));

figure();
plot(tau3, y3', "+r");
plot(t3, z3', "-b");
//plot(t3, z3bis', "--g");
