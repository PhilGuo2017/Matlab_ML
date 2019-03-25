function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

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

C_all=[0.01 0.03 0.1 0.3 1 3 10 30];
sigma_all=[0.01 0.03 0.1 0.3 1 3 10 30];
t=zeros(8,8);
i=1; %C values, row in t
j=1; %sigma values, column in t
for C=C_all
    for sigma=sigma_all
        model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)) 
        %train SVM using X, y, C and sigma
        pred= svmPredict(model,Xval); 
        %predict the results to compare to yval using Xval and trained SVM
        t(i,j)=mean(double(pred~=yval)) 
        %calculate the prediction error
        j=j+1
    end
    j=1
    i=i+1
end
minimum=min(min(t));   %minimum value of matrix t
[a,b]=find(t==minimum,1,'first'); 
%find the index of first minimum, a is row, b is column
C=C_all(a)
sigma=sigma_all(b)





% =========================================================================

end
