function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    index = 1:size(theta,1); % index with consist of total number of columns 
    
    temp_size = zeros(length(theta),1);


    %theta = zeros(index+1,1);

  %  h = theta' * X ;

    for i = index,
   	 temp(i,1) = theta(i,1) - alpha * 1/m * sum(( (X(:,i) * theta') (:,i) - y) .* X(:,i));
%	 disp(temp(i,1));
    endfor

 %   disp('theta');

    for i = index, 
	theta(i,1) = temp(i,1);
%	disp(theta(i,1));	
    endfor 
    	  
     









    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

endfor

endfunction
