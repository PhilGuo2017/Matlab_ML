function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
dist=zeros(1,K);
for i=1:size(X,1),  %i is the X index
    for c=1:K,  %c is the centroid index
        dist(c)=sum((bsxfun(@minus,X(i,:),centroids(c,:))).^2);
        %bsxfun function takes the element wise operation of arrays
        c=c+1;
        [MAX,I]=min(dist);  %index with the minimum distance btw X (i) and centroid (1-c)
    end
    idx(i)=I;
    dist=zeros(1,K);% clear distance array for next X
    i=i+1;
end





% =============================================================

end

