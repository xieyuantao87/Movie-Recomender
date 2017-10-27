function [mu sigma2] = estimateGaussian(X)
%This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% size of rating matrix
[m, n] = size(X);

%initial mean value and variances
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% calculate mean value;
mu = 1/m * sum(X);
% calculate variances
sigma2 = 1/m * sum((X - repmat(mu, m, 1)).^2);

end
