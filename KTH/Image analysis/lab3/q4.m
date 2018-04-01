clear

K = 16;               % number of clusters used
L = 10;              % number of iterations
seed = 32;           % seed used for random initialization
scale_factor = 1.0;  % image downscale factor
image_sigma = 1.0;   % image preblurring scale

I = imread('tiger1.jpg');
I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

tic
[ segm, centers ] = kmeans_segm(I, K, L, seed);
toc

Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);
imwrite(Inew,'result/kmeans1_tiger.png')
imwrite(I,'result/kmeans2_tiger.png')
figure
subplot(1,2,1)
imshow(Inew)
subplot(1,2,2)
imshow(I)
