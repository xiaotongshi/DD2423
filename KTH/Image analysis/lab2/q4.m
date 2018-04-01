clear

house = godthem256;
scale = [0.0001, 1.0, 4.0, 16.0, 64.0];
figure
for i = 1:5
    pixels2 = Lvvtilde(discgaussfft(house,scale(i)),'same');
    subplot(1,5,i)
    [a,b]=contour(pixels2, [0 0]);
    axis('image')
    axis('ij')
    title(['scale = ', num2str(scale(i))])
end

