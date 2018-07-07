function corners = platformCorners(X,data)
    theta = X(1);
    x = X(2);
    y = X(3);
    z = X(4);
    
    a = data.a;
        
    P = [x,y,z]';
    u = [cos(theta), sin(theta),0]';
    v = [-sin(theta),cos(theta),0]';
    
    corners = zeros(3,4);
    corners(:,1) = P + a*u;
    corners(:,2) = P + a*v;
    corners(:,3) = P - a*u;
    corners(:,4) = P - a*v;
    
end