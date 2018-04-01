function psf=gaussfft(pic,t)
    
f=pic;
[xsize,ysize]=size(f);

g=zeros(xsize,ysize);
for x=1:xsize
    for y=1:ysize       
      g(x,y)=exp(-(x^2+y^2)/(2*t))/(2*pi*t);
    end
end

F=fft2(f);
G=fft2(g);

FG=F.*G;
fg=ifft2(FG);
psf=fg;
%psf=fftshift(fg);

end
