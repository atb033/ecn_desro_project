function [c,ceq] = constraints(X)
% X(1) = base radius
% X(2) = active link length
% X(3) = passive link length
% X(4) = top platform radius
% X(5) = x-coordinate of zero-position 
% X(6) = y-coordinate of zero-position 
% X(7) = z-coordinate of zero-position 
% X(8) = theta value of zero-position 
ceq = [];

conditionThreshold = 10 ; % max. condition number
% range of motion in mm and degrees
xmm = 150;
ymm = 20;
zmm = 12.5;
thetaDeg = 45;

b = X(1);
l = X(2);
r = X(3);
a = X(4);
data = struct('b',b,'l',l,'r',r,'a',a);

xmid = X(5);
ymid = X(6);
zmid = X(7);
thetamid = X(8);

xrange = xmm;
yrange = ymm;
zrange = zmm;
thetarange = deg2rad(thetaDeg);

xdisc = 30;
ydisc = 10;
zdisc = 12.5;
thetadisc = deg2rad(10);

xpoints = (xmid-xrange):xdisc:(xmid+xrange);
ypoints = (ymid-yrange):ydisc:(ymid+yrange);
zpoints = (zmid-zrange):zdisc:(zmid+zrange);
thetapoints = (thetamid-thetarange):thetadisc:(thetamid+thetarange);

% initializing condition number
maxA = -inf;
maxB = -inf;
for ii = 1:size(xpoints,2)
    for jj = 1:size(ypoints,2)
        for kk = 1:size(zpoints,2)
            for mm = 1:size(thetapoints,2)
                x = [thetapoints(mm),xpoints(ii),ypoints(jj),zpoints(kk)];
                [A,B] = jacobian_matrices(x,data);
                if ~(isreal(A) && isreal(B))
                    c = [inf,inf]';
                    return;
                end
                condition_forward = cond(A);
                condition_inverse = cond(B);
                if (condition_forward > maxA)
                    maxA = condition_forward;
%                     pos = x;
                end
                if (condition_inverse > maxB)
                    maxB = condition_inverse;
                end
            end
        end
    end
end

c = zeros(2,1);
c(1) = max(maxA,maxB)-conditionThreshold;
% c(2) = maxB-conditionThreshold; 
c(2) = (l - 1.01*b/sqrt(2))/b ;
% pos
end