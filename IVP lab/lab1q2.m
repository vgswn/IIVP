a=imread('download.jfif');
a1=rgb2gray(a);
b2=im2uint16(a1);
b3=im2int16(a1);
b4=im2single(a1);
b5=im2double(a1);
subplot(2,2,1),imshow(b2);
subplot(2,2,2),imshow(b3);
subplot(2,2,3),imshow(b4);
subplot(2,2,4),imshow(b5);
