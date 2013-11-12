function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

%printf('Theta 1 and Theta 2 default value : %f , %f\n',theta(1,1) ,theta(2,1));
pause;

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    % to update theta(1,1)'s value 	
    %temp = 0;
    %for i = 1:m
    %	temp = temp + ( theta(1,1) + theta(2,1) * X(i,2) - y(i,1))^2;
    %endfor 

    %theta(1,1) = theta(1,1) - ( alpha * (1/m) *  temp );
    
    % Using vectorization
    temp1 = theta(1,1) - ( alpha * (1/m) * sum (X * theta - y));	
    temp2 = theta(2,1) - ( alpha * (1/m) * sum((X * theta - y) .* X(:,2)));
    theta(1,1) = temp1;
    theta(2,1) = temp2; 



 %   printf('Theta 1 and Theta 2 are : %f and  %f\n',theta(1,1),theta(2,1));

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
  %  printf(' J_history value = %f  for iter : %f\n',J_history(iter),iter);

endfor 

endfunction
