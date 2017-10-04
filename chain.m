function feature = chain( img,T,S )
    bool=0;    
    [r c]=size(img);
%starting point
    for i=1:r
        for j=1:c
            if(img(i,j)==1)
                bool=1;
                r1=i;
                c1=j;
                break;
            end 
        end
        if(bool==1)
            break;
        end;
    end
    p=[r1 c1];
    bw=bwtraceboundary(img,p,'W');
%***************************************************
%centroid
    s1=0;
    s2=0;
    for i=1:r
        for j=1:c
            s1=s1+(i*img(i,j));
            s2=s2+(j*img(i,j));
        end
    end   
    
     s=sum(sum(img));
     s1=s1/s;s2=s2/s;
    if s==0
        s1=0;s2=0;
    end
    cent=[s1 s2];
%**************************************************************
     [r c]=size(bw); 
%get R
R=(s1-bw(1,1))^2+(s2-bw(1,2))^2;
for i=2:r
    dis=(s1-bw(i,1))^2+(s2-bw(i,2))^2;
    if(dis>=R)
        R=dis;
    end
end
R=sqrt(R)+1;
%***************************************************************
     feature=zeros(T*S*8,1);
%   E=0;NE=0;N=0;NW=0;W=0;SW=0;S=0;SE=0;
%calc feature
    for i=1:r-1
        direction=direct(i,bw);
        point=[bw(i,1) bw(i,2)];
        [t s]=calc(point,T,S,R,cent);
        
        idx=((((t-1)*S)+s)*8)+direction;
        feature(idx)=feature(idx)+1;
    end
%****************************************************************    
    %handle scaling
   for i=1:8:(T*S*8)
        s=sum(feature(i:i+7));
        for j=i:i+7           
        feature(j)=feature(j)/s;
            if(s==0)
                feature(j)=0;
            end
        end    
    end
%    feature=[E/r;NE/r;N/r;NW/r;W/r;SW/r;S/r;SE/r];
save 'chainCode.mat' feature T S

