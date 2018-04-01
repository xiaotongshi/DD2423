clear

dxmask = [-1/2,0,1/2];
dymask = [-1/2;0;1/2];
dxxmask = [1,-2,1];
dyymask = [1;-2;1];

dxymask = conv2(dxmask,dymask,'full');
dxxxmask =  conv2(dxmask,dxxmask,'full');
dxxymask =  conv2(dxxmask,dymask,'full');

[x,y] = meshgrid(-3:3,-3:3);
filter2(dxmask, x, 'valid')
filter2(dxmask, x.^2, 'valid')
filter2(dxmask, x.^3, 'valid')

filter2(dxxmask, x, 'valid')
filter2(dxxmask, x.^2, 'valid')
filter2(dxxmask, x.^3, 'valid')

filter2(dxxxmask, x, 'valid')
filter2(dxxxmask, x.^3, 'valid')
filter2(dxxxmask, x.^2, 'valid')
