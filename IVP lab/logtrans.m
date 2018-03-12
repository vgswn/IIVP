a=imread('logimag.PNG');
a=im2double(a);
b=a;
[r,c]=size(a);
for i=1:1:r
    for j=1:1:c
        b(i,j)=5*log(1+a(i,j));
    end
end
subplot(1,2,1),imshow(a);
subplot(1,2,2),imshow(b);