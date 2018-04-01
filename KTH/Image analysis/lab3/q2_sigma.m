K = 8;               % number of clusters used
L = 10;              % number of iterations
seed = 14;           % seed used for random initialization
scale_factor = 1.0;  % image downscale factor
image_sigma = [0.1, 0.6, 1.0, 2.0, 4.0, 6.0] ;   % image preblurring scale

I = imread('orange.jpg');
I = imresize(I, scale_factor);
Iback = I;
figure

for i=1: 6
d = 2*ceil(image_sigma(i)*2) + 1;
h = fspecial('gaussian', [d d], image_sigma(i));
I = imfilter(I, h);

tic
[ segm, centers ] = kmeans_segm(I, K, L, seed);
toc

Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);
imwrite(Inew,'result/kmeans1.png')
imwrite(I,'result/kmeans2.png')
subplot(2,6,i)
imshow(Inew)
title(['sigma =  ', num2str(image_sigma(i))])
subplot(2,6,i+6)
imshow(I)
end