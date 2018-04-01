function pixels = Lvvvtilde(inpic, shape)
     if (nargin < 2)
       shape = 'same';
     end
     dxmask = [-0.5,0,0.5];
     dymask = dxmask';
     dxxmask = [1,-2,1];
     dyymask = dxxmask';
     
     dxxxmask = -filter2(dxmask, dxxmask, 'full');
     dyyymask = -filter2(dymask, dyymask, 'full');
     dxxymask = -filter2(dxxmask, dymask, 'full');
     dxyymask = -filter2(dxmask, dyymask, 'full');
     
     Lx = filter2(dxmask, inpic, shape);
     Ly = filter2(dymask, inpic, shape);
     
     Lx2 = Lx.^2;
     Ly2 = Ly.^2;
     Lx3 = Lx.^3;
     Ly3 = Ly.^3;
     
     Lxxx = filter2(dxxxmask, inpic, shape);
     Lyyy = filter2(dyyymask, inpic, shape);
     Lxxy = filter2(dxxymask, inpic, shape);
     Lxyy = filter2(dxyymask, inpic, shape);
     
     pixels = Lx3.*Lxxx + 3*Lx2.*Ly.*Lxxy + 3*Lx.*Ly2.*Lxyy + Ly3.*Lyyy;
end