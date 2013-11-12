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

index =0;
i=1;

%printf('Displaying values\n');
%disp(theta(2,1));
%printf('X and Y\n');
%disp(X(1,2));
%disp(y(1,1));
		% Previous worked solution 
%for i = (1:m)
%	J = J + ((theta(1,1) + (theta(2,1) * X(i,2))) - y(i,1))^2;
%        printf('Index no : %d',i);
%	disp(J);
%endfor

Prediction = X * theta;
sqrErrors = (Prediction - y) .^ 2;



J =  sum(sqrErrors) /( 2 * m) ;

return
%return J;
	 



% =========================================================================

endfunction 
