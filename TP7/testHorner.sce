exec("horn.sci", -1);

theta = 2; // ordonnée à calculer

t = [0, 0, 1];


a = [1, 3, 5, -1];


[p, pprim] = horn(a, t, theta);
