function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
%neu = sum(X(:,1))/m

	% Here i have computer my mean normalization
X_norm = X;
m = length(X(:,1));
mu = zeros(1, size(X, 2)); % This mean 1 row and 2 colum which comes form size
%mu(:,1) = sum(X(:,1))/m;
%mu(:,2) = sum(X(:,2))/m;

mu = mean(X);


%X_norm(:,1) = X(:,1) - mu(:,1);
%X_norm(:,2) = X(:,2) - mu(:,2);

	% Here i have to computer 
% formula : std (x) = sqrt (sumsq (x - mean (x)) / (n - 1))
sigma = zeros(1, size(X, 2));

sigma = std(X);
%sigma(:,1) = sqrt (sumsq( X(:,1) -mu(:,1)) / (m-1));
%sigma(:,2) = sqrt (sumsq( X(:,2) - mu(:,2)) / (m-1));


%X_norm(:,1) = X_norm(:,1) / sigma(:,1);
%X_norm(:,2) = X_norm(:,2) / sigma(:,2);


% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       


indicies = 1:size(X,2);

for i = indicies,
	Xmin = X(:,i) - mu(i);
	X_norm(:,i) = Xmin / sigma(i);
endfor






% ============================================================

end
