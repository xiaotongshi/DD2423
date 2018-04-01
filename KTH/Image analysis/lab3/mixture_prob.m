function prob = mixture_prob(image, K, L, mask)
% I: a set of pixels
% V: a set of K Gaussian components in 3D (R, G, B)

I = image;

% Store all pixels for which mask=1 in a N*3 matrix
[height, width, ~] = size(image);
Ivec = single(reshape(I, width*height, 3));

% Randomly initialize the K components using masked pixels
[ miu, weight, sigma ] = mixture_init(I, K);

% Iterate L times
for l = 1: L
%    Expection: Compute probabilities P_ik using masked pixels
     [E, P] = Expectation(Ivec, K, miu, weight, sigma);
%    Maximization : Update weights, means and vovariances using masked
%    pixels 
     [miu, weight, sigma] = Maximization(Ivec, K, E);
end

% Compute probabilities p(c_i) in eq3 for all pixels I
prob = P;
end