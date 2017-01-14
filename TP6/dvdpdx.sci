function [Y] = dvdpdx(t, X)
    // derivee de vdp sous la forme :
    // d(vdp(1))/dx1    d(vdp(1))/dx2
    // d(vdp(2))/dx1    d(vdp(2))/dx2
    
    c = 0.4;
    
    Y = [ 0                       ,  1                     ;
          -2 * c * X(1) * X(2) - 1,  c * (1 - X(1) * X(1))];
endfunction
