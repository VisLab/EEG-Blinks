function [xIntersect, yIntersect, xIntercept1, xIntercept2] = getIntersection(p, q, u, v)
% Return intersection of two lines given by fits p and q centered at u and v
%
%  Parameters:
%      p   first linear fit:  y = p(1)*x + p(2)
%      q   second linear fit:  y = q(1)*x + q(2)
%      u   u(1) mean of first, u(2) std of first
%      v   v(1) mean of first, v(2) std of first
%
     if p(1) == 0
         xIntercept1 = NaN;
     else
         xIntercept1 = (p(1)*u(1) - p(2)*u(2))./p(1);
     end
     if q(1) == 0
         xIntercept2 = NaN;
     else
         xIntercept2 = (q(1)*v(1) - q(2)*v(2))./q(1);
     end
     if p(1) == p(2)
         xIntersect = NaN;
         yIntersect = NaN;
     else
        denom = p(1)*v(2) - q(1)*u(2);
        numer =  u(1)*p(1)*v(2) - v(1)*q(1)*u(2) ...
              + q(2)*v(2)*u(2) - p(2)*u(2)*v(2);
        xIntersect = numer./denom;
        yIntersect = p(1)*(xIntersect - u(1))./u(2) + p(2);
     end       
end

