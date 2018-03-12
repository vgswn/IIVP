a=imread('pout.tif');
[r,c]=size(a);
i2=a;
mn=min(a(:));
mx=max(a(:));
disp(mn);
disp(mx);
for i=1:1:r
    for j=1:1:c
        i2(i,j)=((double((i2(i,j)-mn)))*255)/(mx-mn);
    end
end

r1=input('');
s1=input('');
r2=input('');
s2=input('');


subplot(1,3,1),imshow(a);
subplot(1,3,2),imshow(i2);

i1=a;
for i=1:1:r
    for j=1:1:c
        if a(i,j)<=r1
            i1(i,j)=((double(s1))/r1)*a(i,j);
        elseif a(i,j)<=r2
            d=(a(i,j)-r1);
            i1(i,j)=s1+((double(d))/(r2-r1))*(s2-s1);
        else
            i1(i,j)=s2+((double((255.0-s2)))/(255.0-r2))*(a(i,j)-r2);
        end
    end
end
disp(i1(1,1));
subplot(1,3,3),imshow(i1);