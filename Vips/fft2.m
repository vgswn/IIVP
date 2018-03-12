graphics_toolkit('gnuplot')
a=zeros(50,50);
a(20:30,20:30)=1;
b=a;
a=im2double(a);
subplot(3,1,1),imshow(a);

img=im2double(zeros(50,50));

for u=1:1:50
  for v=1:1:50
    for x=1:1:50
      for y=1:1:50
        img(u,v)=img(u,v)+(a(x,y))*(exp(-2*pi*(0+1j)*((u*x)/50 + (v*y)/50)));
      end
    end
  end
 end
 
 
 
 subplot(3,1,2),imshow(fftshift(real(img)));
 
 subplot(3,1,3),imshow(fftshift(fft2(b)));