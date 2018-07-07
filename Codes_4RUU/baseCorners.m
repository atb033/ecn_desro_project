function corners = baseCorners(~,data)
    b = data.b;
        
    ii = [1,0,0]';
    jj = [0,1,0]';
    
    corners = zeros(3,4);
    corners(:,1) = b*ii;
    corners(:,2) = b*jj;
    corners(:,3) = -b*ii;
    corners(:,4) = -b*jj;
    
end