colour_bandwidth = 20.0; % color bandwidth
radius = 3;              % maximum neighbourhood distance
ncuts_thresh = 0.2;      % cutting threshold
min_area = [50, 100, 200];          % minimum area of segment
max_depth = 8;           % maximum splitting depth
scale_factor = 0.4;      % image downscale factor
image_sigma = 2.0;       % image preblurring scale

I = imread('tiger1.jpg');
I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

figure
num = 1;
for i = 1:3
segm = norm_cuts_segm(I, colour_bandwidth, radius, ncuts_thresh, min_area(i), max_depth);
Inew = mean_segments(Iback, segm);
I2 = overlay_bounds(Iback, segm);
% imwrite(Inew,'result/normcuts1.png')
% imwrite(I,'result/normcuts2.png')
subplot(3,2,num)
imshow(Inew)
title(['min area = ', num2str(min_area(i))])
subplot(3,2,num+1)
imshow(I2)
num = num +2;
end
