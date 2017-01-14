clear
exec("rich.sci", -1);

a = [ 0 1 2 1 2 ]';
b = [ 2 3 1 1 1 ]';
c = [ 3 1 2 1 ]';
u = [ -1 0 0 3 1 ]';

x = rich (a, b, c, u)

A = diag(b, 0) + diag(a(2:$), -1) + diag(c, 1);
