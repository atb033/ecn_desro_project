function sol = IGM(Xc,Xs,data)
    r1=data.l;
    r2=data.r;

    r1sqr = r1^2;    
    r2sqr = r2^2;

    xc=Xc(1);
    yc=Xc(2);
    
    xs = Xs(1);
    ys = Xs(2);
    zs = Xs(3);
    zssqr=zs^2;
    
    sol = zeros(3,2);
    
    if (r2sqr - 1*zssqr) < 0
        sol = 1i*ones(3,2);
        return;
    end
    
    sol(:,1) = [xc + r1*(-1.*xc + xs - 1.*cos(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
            power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) + ...
           atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5)))*power(r2sqr - 1.*zssqr,0.5))*...
     power(power(-1.*xc + xs - 1.*cos(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
              power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) + ...
            atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5)))*power(r2sqr - 1.*zssqr,0.5),2) + ...
       power(-1.*yc + ys - 1.*power(r2sqr - 1.*zssqr,0.5)*sin(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
              power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) + ...
            atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5))),2),-0.5),...
   yc + r1*power(power(-1.*xc + xs - 1.*cos(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
              power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) + ...
            atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5)))*power(r2sqr - 1.*zssqr,0.5),2) + ...
       power(-1.*yc + ys - 1.*power(r2sqr - 1.*zssqr,0.5)*sin(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
              power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) + ...
            atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5))),2),-0.5)*...
     (-1.*yc + ys - 1.*power(r2sqr - 1.*zssqr,0.5)*sin(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
            power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) + ...
          atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5)))),0]';

    sol(:,2) = [xc + r1*(-1.*xc + xs - 1.*cos(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
            power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) - ...
          1.*atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5)))*power(r2sqr - 1.*zssqr,0.5))*...
     power(power(-1.*xc + xs - 1.*cos(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
              power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) - ...
            1.*atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5)))*power(r2sqr - 1.*zssqr,0.5),2) + ...
       power(-1.*yc + ys + power(r2sqr - 1.*zssqr,0.5)*sin(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
              power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) - ...
            1.*atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5))),2),-0.5),...
   yc + r1*power(power(-1.*xc + xs - 1.*cos(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
              power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) - ...
            1.*atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5)))*power(r2sqr - 1.*zssqr,0.5),2) + ...
       power(-1.*yc + ys + power(r2sqr - 1.*zssqr,0.5)*sin(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
              power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) - ...
            1.*atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5))),2),-0.5)*...
     (-1.*yc + ys + power(r2sqr - 1.*zssqr,0.5)*sin(acos((r1sqr - 1.*r2sqr + zssqr - 1.*power(xc - 1.*xs,2) - 1.*power(yc - 1.*ys,2))*...
            power(4.*(r2sqr - 1.*zssqr)*power(xc - 1.*xs,2) + 4.*(r2sqr - 1.*zssqr)*power(yc - 1.*ys,2),-0.5)) - ...
          1.*atan2(2.*(yc - 1.*ys)*power(r2sqr - 1.*zssqr,0.5),2.*(xc - 1.*xs)*power(r2sqr - 1.*zssqr,0.5)))),0]';

end