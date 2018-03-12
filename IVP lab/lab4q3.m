a=imread('cam.PNG');
a=double(a);
subplot(1,9,1),imshow(uint8(a));
pw=1;
for i=1:1:8
    i1=mod(floor(a/pw),2);
    subplot(1,9,i+1),imshow(i1);
    pw=pw*2;
end