exec("gausseidel.sci", -1);
//test = [ 3 2 4 ]';
//disp(b);
//b = A * test;

//A = [ 1 -2 2 ; -1 1 -1; -2 -2 1 ];
//x0 = [ 0 0 0 ]';
//b = [ 7 -4 2 ]';

A = [ 1 -1 -2 ; -2 1 3; 0 2 1 ];
x0 = [ 0 0 0 ]';
b = [ -2 3 0 ]';

[x, k] = gausseidel(A, b, 0.1, 100, x0)
//disp(xtot);
//disp(k);
//drawlater
//param3d(xtot(1,1:k+1), xtot(2,1:k+1), xtot(3,1:k+1), "r");
//e=gce() //the handle on the 3D polyline
//e.foreground=color('green');
//drawnow
//
