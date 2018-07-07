% X(1) = base radius
% X(2) = active link length
% X(3) = passive link length
% X(4) = top platform radius
% X(5) = x-coordinate of zero-position 
% X(6) = y-coordinate of zero-position 
% X(7) = z-coordinate of zero-position 
% X(8) = theta value of zero-position in radians
clear; clc;
% Optimization 
X0 = [1.0, 0.8, 1.0, 0.3, 0, 0, 0.6, deg2rad(0)*1e-3 ]*1e3;
LB = [100, 100,100,100,-150,-150,100,-pi/4];
UB = [2000,1000,2000,1000,150,150,2000,pi/4];
% options = optimoptions('fmincon','Display','iter');
options = optimoptions('ga','PlotFcn',{@gaplotbestf,@gaplotmaxconstr,@gaplotbestindiv}, ...
    'Display','iter');
% options.PopulationSize = 50;
options.InitialPopulationMatrix = X0;
%% Optimiztion using GA

% X = fmincon(@(X) objective(X),X0,[],[],[],[],LB,UB,@(X) constraints(X),options);
X = ga(@(X) objective(X),8,[],[],[],[],LB,UB,@(X) constraints(X),options);

%% Using fmincon()
% X0 = [865.1294, 617.8563, 1.0916e+03, 398.0999, 69.7487, 66.5069, 468.8539, 2.8125];
X0 = 1e3*[1.0028    0.7170    0.8497    0.3385   -0.1379    0.0111    0.3487    0.0000];
options = optimoptions('fmincon','Display','iter');
X = fmincon(@(X) objective(X),X0,[],[],[],[],LB,UB,@(X) constraints(X),options);

%% Result
% Good link lengths
% X0 = 1e3*[1.0827    0.7656    0.8859    0.3698    0.0052    0.1446    0.3216   -0.0001043]; %fmincon
% X0 = [865.1294, 617.8563, 1.0916e+03, 398.0999, 69.7487, 66.5069, 468.8539, 2.8125]; %ga

% X0 = [586.7026  419.0653  854.9030  330.3932   69.6620   58.1953  443.7298    2.7430];
% FINAL LINK LENGTHS
X0 = [585, 420, 855, 330, 70, 60, 445, 2.74];

constraints(X0)


%%
