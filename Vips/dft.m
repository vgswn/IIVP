graphics_toolkit('gnuplot')
a=zeros(25,25);
a(10:20,10:20)=1;
b=a;
a=im2double(a);
subplot(3,1,1),imshow(a);

img=im2double(zeros(25,25));

for u=1:1:25
  for v=1:1:25
    for x=1:1:25
      for y=1:1:25
        img(u,v)=img(u,v)+(a(x,y))*(exp(-2*pi*(0+1j)*((u*x)/25 + (v*y)/25)));
      end
    end
  end
 end
 
 
 
 subplot(3,1,2),imshow(fftshift(real(img)));
 
 subplot(3,1,3),imshow(fftshift(fft2(b)));