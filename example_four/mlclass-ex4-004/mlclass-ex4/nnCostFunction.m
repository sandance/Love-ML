function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size,num_labels,X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



%Feedforward the neural network 



X = [ ones(m,1) X]

a_first = X;

% weight for hidden layer should be theta

z_second = Theta1 * a_first';

% input for hidden layer 

a_second = sigmoid(z_second);


a_second = [ ones(m,1) a_second' ];


z_one =  Theta2 * a_second';

% output 

a_third = sigmoid(z_one);

% For the purpose of trainin a neutral network, we need to record the labels as vectors containing only values 0 and 1 
% where only the k th term need to be 1 and 
yk = zeros(num_labels,m);

for i=1:m
	yk(y(i),i) =1;
endfor

% cost function for feedforward network

%lambda =1;


J = 1 ./m * sum(sum((-yk .* log(a_third)) - (( 1 - yk) .* log( 1 - a_third))));

% As the first matrix summation is of 25 * 400 and next one is 10 * 25 so , the vector is taken according to that 

%addition =0;
%Reg = lambda ./ (2*m) * sum(sum(sum (Theta1(:,2:length(Theta1)) .^2)) + sum(sum(Theta2(:,2:length(Theta2)) .^2)));


T1 = Theta1(:,2:size(Theta1,2));
T2 = Theta2(:,2:size(Theta2,2));


addition = lambda  * (sum( sum ( T1 .^ 2 )) + sum( sum (  T2.^ 2 ))) / (2*m);



J = J + addition

% J is the final regularized value of cost funciton 




grad = 0;



%-------------------------back propagation ----------------------

% here layer in 10 and first layer has no need to compute 

b_delta = zeros(m,1);

for i=1:m

%	a1 = X(i,:);
%	z2 = (a1*Theta1');	
%	z2 = [ ones(size(z2,1)) z2 ];
%	a2 = sigmoid(z2);
%
%	z3 = (a2*Theta2');
%	a3 = sigmoid(z3);

%	delta3 = (a3 -yk(:,i)');
%	delta2 = (delta3 * Theta2 ) .* sigmoidGradient(z2);

	% skip or remove delta2(1) index 1 

%	delta2 = delta2(2:end);
	
	
%	Theta2_grad = Theta2_grad + delta3' * a2; 
%	Theta1_grad = Theta1_grad + delta2' * a1;  


% modified one 
	

	a1 = X(i,:);
	z2 = Theta1 * a1';
%	z2 = [1 ;z2(:)];

	a2 = sigmoid(z2);
	a2 = [1 ; a2];

	z3 = Theta2 * a2;
	a3 = sigmoid(z3);

	z2 = [ 1; z2];

	delta3 = ( a3 - yk(:,i));
	delta2 = (Theta2' * delta3 ) .* sigmoidGradient(z2);


	
	delta2 = delta2(2:end);


	Theta2_grad = Theta2_grad + delta3 * a2';
	Theta1_grad = Theta1_grad + delta2 * a1; 
	
		
endfor


% =========================================================================

% Unroll gradients


% without regularization 

% Theta1_grad = (1 ./ m ) * Theta1_grad;
% Theta2_grad = (1 ./ m) * Theta2_grad;


%with regulation so comment previous part

Theta1_grad(:,1) = (1 ./ m) * Theta1_grad(:,1); 

Theta1_grad(:,2:end) = (1 ./ m) * Theta1_grad(:,2:end) + ((lambda ./ m) * Theta1(:,2:end)); 



Theta2_grad(:,1) = (1 ./ m) * Theta2_grad(:,1);

Theta2_grad(:,2:end) = (1 ./ m) * Theta2_grad(:,2:end) + ((lambda ./ m) * Theta2(:,2:end));



%unroll gradient s
grad = [Theta1_grad(:) ; Theta2_grad(:)];





end
