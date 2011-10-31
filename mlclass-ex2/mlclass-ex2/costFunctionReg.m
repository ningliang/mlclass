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

hypothesis = sigmoid(X * theta);
costs = - y' * log(hypothesis) - (1 - y)' * log(1 - hypothesis);
theta_non_constant = theta(2:size(theta, 1), 1);
J = 1 / m * sum(costs) + lambda / (2*m) * theta_non_constant' * theta_non_constant;

grad = 1 / m * X' * (hypothesis - y);
grad = grad + 1 / m * lambda * [0; theta_non_constant];




% =============================================================

end
