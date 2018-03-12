a=imread('cameraman.tif');

fx=[-1 -2 -1;0 0 0;1 2 1];
fy=fx';

gx=imfilter(a,fx);
gy=imfilter(a,fy);

gi=abs(gx)+abs(gy);

subplot(1,2,1),imshow(a);
subplot(1,2,2),imshow(gi);

theta=a;
[r,c]=size(gx);
for i=1:1:r
    for j=1:1:c
        theta(i,j)=(180*atan(double(gy(i,j))/double(gx(i,j))))/pi;
    end    
end

for i=1:1:r
    for j=1:1:c
        if theta(i,j)<=22.5
            theta(i,j)=0;
        elseif theta(i,j)>22.5 && theta(i,j)<=67.5
            theta(i,j)=45;
        else
            theta(i,j)=90;
        end
    end
end
            
