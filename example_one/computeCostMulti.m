function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% cost function should be X * theta'

n = 1:size(X,2);

Prediction = zeros(length(X),1);
sqrErrors = zeros(length(X),1);

for i =n,
	Prediction(:,1) = Prediction(:,1) + (X(:,i) * theta') (:,i);
	sqrErrors(:,1) = sqrErrors(:,1) + (Prediction(:,1) - y) .^ 2;
endfor


J =  sum(sqrErrors(:,1)) /( 2 * m) ;
printf('J value %f\n',J);

return
%return J;

% =========================================================================

end
