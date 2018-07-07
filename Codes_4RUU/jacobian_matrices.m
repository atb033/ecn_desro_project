function [A,B] = jacobian_matrices(X,data)

p_base = baseCorners(X,data);
p_mid = passiveCorners(X,data);
p_top = platformCorners(X,data);

f = p_top-p_mid;
r_c = p_top-X(2:4)'*ones(1,4);
k = [0,0,1]';

% Converting to unit vectors
for i = 1:4
    f(:,i) = f(:,i)/norm(f(:,i));
%     r_c(:,i) = r_c(:,i)/norm(r_c(:,i));
end

m = cross(f,k*ones(1,4));

rc_cross_f = cross(r_c,f);
k_cross_m = cross(k*ones(1,4),m);

AC = p_top-p_base;
AC_cross_f = cross(AC,f);

A = zeros(8,6);
for i = 1:4
    A(i,:) = [rc_cross_f(:,i)',f(:,i)'];
%     A(i,1:3) = A(i,1:3)/N; % Normalizing
end
for i = 1:4
    A(i+4,:) = [k_cross_m(:,i)',zeros(1,3)];
end

B = zeros(8,4);
for i=1:4
    B(i,i) = AC_cross_f(:,i)'*k;%/N; % Normalized
end

% Normalizing 
N = data.b;
A(1:4,1:3) = A(1:4,1:3)/N;
B = B/N;
end