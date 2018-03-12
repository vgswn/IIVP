a=imread('build.PNG');
a=im2double(a);
[r,c,d]=size(a);
m=zeros(r,c,3);
i=1;
j=1;
k=1;
gamma=6.0;
for i=1:1:r
    for j=1:1:c
        for k=1:1:3
            m(i,j,k)=a(i,j,k)^gamma;
        end
    end;
end;
m1=a.^2.0;
m2=a.^4.0;
subplot(1,4,1),imshow(a);
subplot(1,4,2),imshow(m1),title('Gamma is 2');
subplot(1,4,3),imshow(m2),title('Gamma is 4');
subplot(1,4,4),imshow(m),title('Gamma is 6');