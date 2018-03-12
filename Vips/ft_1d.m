graphics_toolkit('gnuplot')
pkg load specfun
pkg load image
a=zeros(25);
a(10:20)=1;
b=a;
a=im2double(a);


img=im2double(zeros(1000));

for u=1:1:1000
  
    for x=1:1:25
      
        img(u)=img(u)+(a(x))*(exp(-2*pi*(0+1j)*((u*x)/1000)));
      end
end
z=1:1:25;
z1=1:1:1000;
 
 
 
 subplot(2,1,1),plot(z,a)
 
 subplot(2,1,2),plot(z1,fftshift(img))