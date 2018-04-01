clear

house = godthem256;
pixels2 = Lvvtilde(discgaussfft(house,4),'same');
pixels3 = Lvvvtilde(discgaussfft(house,4),'same');
figure
subplot(1,2,1)
contour(pixels2, [0 0])
axis('image')
axis('ij')
title('second derivative')
subplot(1,2,2)
[m,n] = size(house);
pixels = zeros(m,n);
for i = 1:m
    for j = 1:n
        if abs(pixels2(i,j))<0.5 && (pixels3(i,j) < 0)
            pixels(i,j) = 0;
        else
            pixels(i,j) = pixels2(i,j);
        end
    end
end
contour(pixels, [0 0])
axis('image')
axis('ij')
title('improved second derivative')
