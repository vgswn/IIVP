graphics_toolkit('gnuplot')
pkg load image
a=imread('cameraman.tif');
a=imresize(a,[25,25]);
imshow(a);
%{
b=a;
a=im2double(a);
subplot(3,1,1),imshow(a);

img=im2double(zeros(25,25));
img1=img;

for u=1:1:25
  for v=1:1:25
    for x=1:1:25
      for y=1:1:25
        img(u,v)=img(u,v)+(a(x,y))*(exp(-2*pi*(0+1j)*((u*x)/25 + (v*y)/25)));
      end
    end
  end
 end
 
 
 
 for u=1:1:25
  for v=1:1:25
    for x=1:1:25
      for y=1:1:25
        img1(u,v)=img1(u,v)+((img(x,y))*(exp(2*pi*(0+1j)*((u*x)/25 + (v*y)/25))))/625;
      end
    end
  end
 end
 
 
 
 
 
 
 
 subplot(3,1,2),imshow(real(img));%imshow(fftshift(real(img)));
 
 subplot(3,1,3),imshow(img1);%imshow(fftshift(fft2(b)));
 %}
 