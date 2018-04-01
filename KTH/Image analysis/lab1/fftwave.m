function fftwave(u,v,sz)

if(nargin<2)
    error('Requires at least two input arguments.')
end
if (nargin==2)
    sz=128;
end

Fhat=zeros(sz);
Fhat(u,v)=1;

F=ifft2(Fhat);
Fabsmax=max(abs(F(:)));
 
figure
title(sprintf('position (u,v)=(%d,%d)',u,v));

subplot(3,2,1)
showgrey(Fhat);
title(sprintf('Fhat:(u,v)=(%d,%d)',u,v))


if(u<=sz/2)
    uc=u-1;
else
    uc=u-1-sz;
end
if(v<=sz/2)
    vc=v-1;
else
    vc=v-1-sz;
end

wavelength=2*pi/sqrt(u^2+v^2);  %
amplitude=1/sz;    %

subplot(3,2,2);
showgrey(fftshift(Fhat));
title(sprintf('centered Fhat:(uc,vc)=(%d,%d)',uc,vc))

subplot(3,2,3)
showgrey(real(F),64,-Fabsmax,Fabsmax);
title('real(F)')

subplot(3,2,4)
showgrey(imag(F),64,-Fabsmax,Fabsmax);
title('imag(F)')

subplot(3,2,5)
showgrey(abs(F),64,-Fabsmax,Fabsmax);
title(sprintf('abs(F) (amplitude %f)', amplitude))

subplot(3,2,6)
showgrey(angle(F),64,-Fabsmax,Fabsmax);
title(sprintf('angle(F) (wavelength %f)', wavelength))

