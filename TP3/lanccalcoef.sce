clear
exec("calcoef.sci", -1);
exec("trace2.sci", -1);
exec("rich.sci", -1);

T = [ 1 3 4.5 5 6 ]';
y = [ 1 5 3 7 -1 ]';
N = 200;

cc = calcoef(T, y);

trace2(N, T, cc);
