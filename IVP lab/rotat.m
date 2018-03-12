a=imread('CAPTURE.png');
[r,c,d]=size(a);
b=zeros(r,c,d);
i=1;
j=1;
k=1;
theta=180*pi/180;
cx=ceil((size(a,1)+1)/2);
cy=ceil((size(a,2)+1)/2);
for i=1:1:r
    for j=1:1:c
        i1=(i-cx)*cos(theta)+(j-cy)*sin(theta);
        j1=-1*(i-cx)*sin(theta)+(j-cy)*cos(theta);
        i1=round(i1+cx);
        j1=round(j1+cy);
        if i1<=1
            i1=1;
        end
        if j1<=1
            j1=1;
        end
        b(i1,j1,:)=a(i,j,:);
    end
end
b=imrotate(a,90);
subplot(1,2,1),imshow(b);
subplot(1,2,2),imshow(uint8(b));