clear
exec("trace2.sci", -1);

T = [ 1 3 4.5 5 6 ]';
cc = [ 1 0 1 0; 5 0 -8/9 0 ; 3 0 16 0 ; 7 0 -8 0 ];
N = 200;

trace2(N, T, cc);
