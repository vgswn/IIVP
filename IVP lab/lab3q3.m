a=imread('cam.png');
b=a;
a=double(a);
contr=a;
contr1=a;
contr2=a;
[r,c]=size(a);
m=128;
e=5;
for i=1:1:r
    for j=1:1:c
        contr(i,j)=1.0/(1.0+(m/a(i,j))^e);
    end
end
e=10;
for i=1:1:r
    for j=1:1:c
        contr1(i,j)=1.0/(1.0+(m/a(i,j))^e);
    end
end
e=20;
for i=1:1:r
    for j=1:1:c
        contr2(i,j)=1.0/(1.0+(m/a(i,j))^e);
    end
end
subplot(1,4,1),imshow(b);
subplot(1,4,2),imshow(contr),title('e is 5');
subplot(1,4,3),imshow(contr1),title('e is 10');
subplot(1,4,4),imshow(contr2),title('e is 20');