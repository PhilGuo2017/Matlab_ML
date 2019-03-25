function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


e = exp(-1*X*theta);
h = 1./(1.+e);
% above is the sigmoid function h(x)=g(theta'*x) = g(z)
theta(1)=0 
%IMPORTANT: theta(1) is set to zero so it is not regularized in both J (cost) and Gradient

J=-(1/m)*(y'*log(h)+(1-y)'*log(1-h))+lambda/(2*m)*sum(theta.^2)
% above is the Regularized logistic cost function

grad=(1/m)*(h-y)'*X+lambda/m.*theta'
% Vectorization: (h-y) transposed
% above is the gradient



% =============================================================

end
