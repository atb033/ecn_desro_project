%% Main script
clear; clc;

scale = 1;
% dim = scale*[100.1268  261.6613  393.1186  291.9977];
dim = [0.584, 0.544, 0.709, 0.165];
data = struct('b',dim(1),'l',dim(2),'r',dim(3),'a',dim(4));
    
X = [0.0312,-0.136,-0.042,0.335];
% X = [1.0472   -0.1500   -0.1500    0.4000]
base = baseCorners(X,data);
platform = platformCorners(X,data);
% Xc = base(:,1);
% Xs = platform(:,1);
% IGM(Xc,Xs,data)
passive = passiveCorners(X,data);

leg1 = base-passive;
leg2 = platform-passive;

length1 = [];
length2 = [];
for i=1:4
    length1 = [length1, norm(leg1(:,i))];
    length2 = [length2, norm(leg2(:,i))];
end
% [A,B]= jacobian_matrices(X,data);
% A
% rank(A)
%% Plotting 
close
ax=gca;
ax.DataAspectRatio=[1,1,1];
hold on;
basep = [base,base(:,1)];
leg1 = [base(:,1),passive(:,1),platform(:,1)];
leg2 = [base(:,2),passive(:,2),platform(:,2)];
leg3 = [base(:,3),passive(:,3),platform(:,3)];
leg4 = [base(:,4),passive(:,4),platform(:,4)];

platformp = [platform,platform(:,1)];
hold on;
plot3(basep(1,:),basep(2,:),basep(3,:))
plot3(platformp(1,:),platformp(2,:),platformp(3,:));
plot3(leg1(1,:),leg1(2,:),leg1(3,:));
plot3(leg2(1,:),leg2(2,:),leg2(3,:));
plot3(leg3(1,:),leg3(2,:),leg3(3,:));
plot3(leg4(1,:),leg4(2,:),leg4(3,:));
% xlim([-1.5,1.5]);
% ylim([-1.5,1.5]);
% zlim([-0.1,1.1]);

%% Optimization problem
% maximize the workspace centered at (theta0,x0,y0,z0)
% constraints: condition number <10
% optimization variables: [b,l,r,a,theta0,x0,y0,z0]
% workspace: theta0 +- 45 degrees, x0+-150mm, y0+-150mm, z0+-12.5mm, 
% constraints: descretize the workspace and calculate condition numbers for all points
% in workspace
% objective: b+l+r+a


x = 1:0.1:10;

test = meshgrid(x,x,x);