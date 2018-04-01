clear
tools = few256;
scale = [0.0001, 1.0, 4.0, 16.0, 64.0];
figure
for i = 1:5
    pixels2 = Lvvtilde(discgaussfft(tools,scale(i)),'same');
    subplot(2,5,i)
    contour(pixels2, [0 0])
    axis('image')
    axis('ij')
    title(['scale = ', num2str(scale(i))])
    subplot(2,5,i+5)
    pixels3 = Lvvvtilde2(discgaussfft(tools,scale(i)),'same');
    showgrey(pixels3<0)
    title(['scale = ', num2str(scale(i))])
end
