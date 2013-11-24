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

Prediction = zeros(size(X,1),1);

%for i=1:m

%	Prediction(i) = sigmoid(X(i,:)*theta);

%	addition = lambda * (theta .^ 2);

%	part(i) = 1 ./ (2*m) * ( ((Prediction(i) - y(i,1)) .^ 2) + addition );

J_initial = 1 ./m * (-y' * log(sigmoid(X*theta)) - (1 - y' ) * log(1 - sigmoid(X*theta)));

%grad = 1 ./m *( X' * (sigmoid(X*theta) - y))

addition = lambda ./ (2*m) * sum (theta(2:length(theta)) .^ 2);

J = J_initial + addition ; 


alpha = 1 

theta1 = [0 ; theta(2:size(theta), :)];

grad = ( X' *(sigmoid(X*theta) - y) + lambda * alpha * theta1 ) /m;

% =============================================================

end
