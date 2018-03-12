a=imread('cam.png');
b=a;
a=im2double(a);
nthroot=a.^(0.3);
nthpower=a.^3;
log1=a;
[r,c]=size(a);
for i=1:1:r
    for j=1:1:c
        log1(i,j)=2*log(1+a(i,j));
    end
end
L=256;
ilog1=uint8((exp(double(b)) .^ (log(L) / (L-1))) - 1);
identity=a;
negative=b;
[r,c]=size(a);
for i=1:1:r
    for j=1:1:c
        negative(i,j)=255-b(i,j);
    end
end
subplot(1,7,1),imshow(a);
subplot(1,7,2),imshow(nthroot),title('nth root');
subplot(1,7,3),imshow(nthpower),title('nth power');
subplot(1,7,4),imshow(log1),title('log');
subplot(1,7,5),imshow(ilog1),title('inverse log');
subplot(1,7,6),imshow(identity),title('identity');
subplot(1,7,7),imshow(negative),title('negative');