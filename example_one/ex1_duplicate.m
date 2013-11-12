%Initialization
clear; % clear the screen 
close all; % close all existing window
clc; % clean the screen 


fprintf('Identity matrix......\n');
warmUpdummy();

fprintf('Program paused . Press enter to continue...');
pause; 

%%====================Plotting ====================%%

fprintf('Plotting Data ...\n');
data = load('ex1data1.txt');
X = data(:,1); % load all X components 
y = data(:,2); % load all y components

m = length(y); % number of training examples

plot(X,y,'rx','MarkerSize',10) % plot the data

ylabel('Profit in $10,000');
xlabel('Population of city in 10000');

fprintf('Program paused, press enter to continue...\n');

X = [ones(m,1) , data(:,1)] % create a matrix like x = [ 1 val ] type
theta = zeros(2,1); % Initialize fitting parameter

alpha = 0.1
iterations = 1500;


computerCose(X,y,theta)




theta = gradientDescent(X,y,theta, alpha , iterations);

hold on; % keep previous plot visible

plot(X(:,2) ,X*theta , '-')
legend('Training data' , 'Linear Regression');
hold off;

%=========== Visualizing J (theta_0 , theta_1) ==============%

theta0_vals = linspace(-10,10,100); % there will be 100 division in between -10 to +10
theta1_vals = linspace(-1,4,100);

J_vals = zeros(length(theta0_vals),length(theta1_vals));

%Fill out J_vals 
for i = 1:length(theta0_vals)
	for j = 1:length(theta1_vals)
		t = [theta0_vals(i); theta1_vals(j)];
		J_vals(i,j) = computeCost(X,y,t);
	endfor 
endfor  
