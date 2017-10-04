function [ cropped ] = crop(matrix)    
    [v1,v2,v3]=find(matrix<1);
    r1=min(v1);
    r2=max(v1);
	c1=min(v2);
	c2=max(v2);
	cropped=matrix(r1:r2,c1:c2);
end

