a=imread('eins.PNG');
imshow(a);
r=size(a,1);
c=size(a,2);
i=1;
j=1;
b=zeros(r,c);
for i=1:1:r
    for j=1:1:c
        b(i,j)=255-a(i,j);
    end
end
%disp(log(d));
subplot(1,2,1),imshow(a);
subplot(1,2,2),imshow(uint8(b));