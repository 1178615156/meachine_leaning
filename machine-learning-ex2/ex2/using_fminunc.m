function [theta,cost]=using_fminunc(t,X,y)

% Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);
% Run fminunc to obtain the optimal theta
% This function will return theta and the cost
initial_theta=zeros(size(t,1))
[theta, cost] = ...
fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

end