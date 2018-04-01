K = 8;               % number of clusters used
L = 10;              % number of iterations
seed = 14;           % seed used for random initialization
scale_factor = [0.1,0.3,0.7,1.0,2.0,5.0];  % image downscale factor
image_sigma = 1.0;   % image preblurring scale

image = imread('orange.jpg');
imgsize = zeros(4,3);
figure
for i=1: 6
I = imresize(image, scale_factor(i));
[imgsize(i,1), imgsize(i,2), imgsize(i,3)] = size(I);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

tic
[ segm, centers ] = kmeans_segm(I, K, L, seed);
toc

Inew = mean_segments(Iback, segm);
I2 = overlay_bounds(Iback, segm);
% imwrite(Inew,'result/kmeans1.png')
% imwrite(I,'result/kmeans2.png')
subplot(3,6,i)
imshow(I)
title(['scale factor = ', num2str(scale_factor(i))])
subplot(3,6,i+6)
imshow(Inew)
subplot(3,6,i+12)
imshow(I2)

end
