function [ segmentation, center ] = kmeans_segm(image, K, L, seed )
% image: input image
% K: number of clusters used
% L: number jof iterations
% seed: seed used for random initialization

[nRow, nCol, ~] = size(image);
X = reshape(image, nCol*nRow, 3);
V = zeros(K, 3);
% Randomly initialize the K cluster centers
rng(seed);
center1 = randperm(size(X,1));
if nRow <= K
    segmentation = image;
    center = centroid;
else  
    for i = 1: K
        V(i, :) = X(center1(i), :); %random initialiazation
    end

% [nRow2, nCol2, ~] = size(V)   
temp = zeros(nCol*nRow,1);

% Iterate L times
for i = 1: L
    % Computer all distances between pixels and cluster centers
    % Recompute all distances betwwen pixels and cluster centers
    dist = pdist2(X, V);
    % Assign each pixel to the cluster center for which the distance is
    % minimum
    [~, group] = min(dist,[],2); %find group matrix 
    if group == temp
        break;
    else
        temp = group;
    end
    % Recompute each cluster center by taking the mean of all pixels
    % assigned to it
    for j = 1: K
        count = find(group==j);
        if count
            V(j,:) = mean(X(find(group==j), :), 1);
        end
    end
end

segmentation = reshape(group, nRow, nCol, 1);
center = V;

end
end

