a=zeros(25,25);
for i=1:1:5
  if mod(i,2) == 1
    a(i*5:i*5+5,1:25)=1;
  end
end
      
b=zeros(25,25);
b=im2double(b);
b1=b;
a=im2double(a);
N=25;
M=25;


for i=1:1:25  
  for j=1:1:25
    for k=1:1:25
      for l=1:1:25
        b(i,j)=b(i,j)+a(k,l)*exp(-2*(0+1j)*pi*((i*k)/N+(j*l)/M));
      end
    end
  end
end

for i=1:1:25  
  for j=1:1:25
    for k=1:1:25
      for l=1:1:25
        b1(i,j)=b1(i,j)+((1/(N*M))*(b(k,l)*exp(2*(0+1j)*pi*((i*k)/N+(j*l)/M))));
      end
    end
  end
end

%b
subplot(1,4,1),imshow(a);
subplot(1,4,2),imshow(fftshift(real(b)));
subplot(1,4,3),imshow(fftshift(fft2(a)));
subplot(1,4,4),imshow(real(b1));
