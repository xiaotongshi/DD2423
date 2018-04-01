function pixels = Lvvtilde(inpic, shape)
if(nargin < 2)
    shape = 'same';
end
dxmask = [0,0,0;-1/2,0,1/2;0,0,0];
dymask = dxmask';
dxxmask = [0,0,0;1,-2,1;0,0,0];
dyymask = dxxmask';
dxymask = conv2(dxmask,dymask,shape);
Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
Lxx = filter2(dxxmask, inpic, shape);
Lyy = filter2(dyymask, inpic, shape);
Lxy = filter2(dxymask, inpic, shape);

Lvvtilde = Lx.^2.*Lxx + 2* Lx.*Ly.*Lxy + Ly.^2.*Lyy;
pixels = Lvvtilde;
end

