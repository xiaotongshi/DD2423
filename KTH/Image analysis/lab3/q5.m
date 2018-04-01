clear

scale_factor = 0.5;       % image downscale factor
spatial_bandwidth = [5.0, 10.0, 20.0];  % spatial bandwidth
colour_bandwidth = [3.0, 5.0, 10.0];   % colour bandwidth
num_iterations = 40;      % number of mean-shift iterations
image_sigma = 1.0;        % image preblurring scale

I = imread('tiger1.jpg');
I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

figure
n=1;
for i= 1:3
    for j= 1:3
segm = mean_shift_segm(I, spatial_bandwidth(i), colour_bandwidth(j), num_iterations);
% Inew = mean_segments(Iback, segm);
I2 = overlay_bounds(Iback, segm);
% imwrite(Inew,'result/meanshift1.png')
% imwrite(I,'result/meanshift2.png')
% subplot(3,3,n); imshow(Inew);
subplot(3,3,n); imshow(I2);
title(['s = ', num2str(spatial_bandwidth(i)),', c = ', num2str(colour_bandwidth(j))])
% subplot(2,5,i+5); imshow(I);
n = n+1;
    end
end


