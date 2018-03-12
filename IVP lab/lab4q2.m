a=imread('cameraman.tif');
i1=a;
i2=a;

[r,c]=size(a);
for i=1:1:r
    for j=1:1:c
        if a(i,j)>=80
            i1(i,j)=255;
        end
    end
end

for i=1:1:r
    for j=1:1:c
        if a(i,j)>=20 && a(i,j)<=100
            i2(i,j)=i2(i,j)+150;
        end
    end
end


subplot(1,3,1),imshow(a);
subplot(1,3,2),imshow(i1);
subplot(1,3,3),imshow(i2);