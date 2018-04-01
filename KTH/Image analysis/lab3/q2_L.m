K = 8;               % number of clusters used
L = [1,3,7,10,13,16];              % number of iterations
seed = 14;           % seed used for random initialization
scale_factor = 1.0;  % image downscale factor
image_sigma = 1.0;   % image preblurring scale

I = imread('orange.jpg');
I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

figure
for i=1:6    
tic
[ segm, centers ] = kmeans_segm(I, K, L(i), seed);
toc

Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);
% imwrite(Inew(i),'result/kmeans1.png')
% imwrite(I(i),'result/kmeans2.png')

subplot(2,6,i)
imshow(Inew)
title(['L = ', num2str(L(i))])
subplot(2,6,i+6)
imshow(I)

end