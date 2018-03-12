a=imread('flowers.jpeg');
b=imread('CAPTURE.png');
%imshow(a);
[r,c,d]=size(b);
a=imresize(a,[r,c]);
m=zeros(r,c,3);
i=1;
j=1;
k=1;
for i=1:1:r
    for j=1:1:c
        for k=1:1:3
            m(i,j,k)=b(i,j,k)+a(i,j,k);
        end
    end;
end;
mn=min(m(:));
mx=max(m(:));
for i=1:1:r
    for j=1:1:c
        for k=1:1:3
            m(i,j,k)=((m(i,j,k)-mn)/(mx-mn))*255;
        end
    end;
end;
subplot(1,3,1),imshow(a);
subplot(1,3,2),imshow(b);
subplot(1,3,3),imshow(uint8(m)),title('Added image');