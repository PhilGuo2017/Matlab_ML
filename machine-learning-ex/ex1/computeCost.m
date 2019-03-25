function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

%X = [ones(m,1), X(:,1)]; %add a column of ones to x
%theta = zeros(2,1); %initialize fitting parameters
iterations = 1500;
alpha = 0.01;
%X is m(training examples) x n (features) matrix
%X should have x0=1 like in the test cases [1 2; 1 3; 1 4; 1 5]; 
%theta is n(features) x 1 matrix
%y is n x 1 matrix 
h = X * theta; 
error = h-y;
error_sqr = error.^2 ;%square error
s = sum(error_sqr)
J = 1/(2*m)*s
% =========================================================================

end
