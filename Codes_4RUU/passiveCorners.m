function corners = passiveCorners(X,data)
    top_corners = platformCorners(X,data);
    base_corners = baseCorners(X,data);
    
    corners = ones(3,4);
    
    %link 1
    for i=1:4
        Xc = base_corners(:,i);
        Xs = top_corners(:,i);
        tempCorner = IGM(Xc,Xs,data);
        if  i==1 || i==2 
            corners(:,i) = tempCorner(:,1);
        else
            corners(:,i) = tempCorner(:,2);
        end
    end
end