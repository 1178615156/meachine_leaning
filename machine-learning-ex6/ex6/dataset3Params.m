function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%C = 1;
%sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
iii=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

C_ =zeros(8,8);
sigma_ =zeros(8,8);
temp=zeros(8,8);
for i=1:size(iii,2)
  for j=1:size(iii,2)
    C=iii(1,i);
    sigma=iii(1,j);
    model=svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
    predictions = svmPredict(model, Xval);
    jm=mean(double(predictions ~= yval));
    temp(i,j)=jm;
    [i j]
  end 
end 

C = iii(1);
sigma = iii(1);
J=temp(1,1);
for i=1:size(temp,2)
  for j=1:size(temp,2)
    if(temp(i,j)<J)
      J=temp(i,j);
      C=iii(1,i);
      sigma=iii(1,j);
    end 
  end
end

% =========================================================================

end
