function [ direction ] = direct( i,bw )
        xdif=bw(i+1,1)-bw(i,1);
        ydif=bw(i+1,2)-bw(i,2);
        if(xdif==1 && ydif==0)
                 direction=1;
        elseif(xdif==1 && ydif==1)
                 direction=2;
        elseif(xdif==0 && ydif==1)
                 direction=3;
        elseif(xdif==-1 && ydif==1)
                 direction=4; 
        elseif(xdif==-1 && ydif==0)
                 direction=5;
        elseif(xdif==-1 && ydif==-1)
                 direction=6;
        elseif(xdif==0 && ydif==-1)
                 direction=7;
        elseif(xdif==1 && ydif==-1)
                 direction=8;
        end
end

