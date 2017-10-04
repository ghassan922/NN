function [t,s] = calc( point,T,S,R,cent )
    x=point(1);y=point(2);
    xp=cent(1);yp=cent(2);
    m=(yp-y)/(xp-x);
    r=((yp-y)^2)+((xp-x)^2);
    r=sqrt(r);
    t=floor((r/R)*T)+1;
    ang=2*atan(m);   
    if (ang<0)
       ang=ang+(2*pi);
    end
    s=floor((ang/(2*pi))*S);
end

