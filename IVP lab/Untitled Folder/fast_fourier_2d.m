a=zeros(25,25);
a(10:20,10:20)=1;

subplot(1,4,1),imshow(a),title('Original Image');

c=a;
a=im2double(a);
b=im2double(zeros(25,25));


for u=1:1:25
    for v=1:1:25
        for x=1:1:25
            for y=1:1:25
                b(u,v)=b(u,v)+a(x,y)*exp(-2*pi*(0+1j)*((u*x)/25+(v*y)/25));
            end
        end
    end
end

invimg=im2double(zeros(25,25));

for x=1:1:25
    for y=1:1:25
        for u=1:1:25
            for v=1:1:25
                invimg(x,y)=invimg(x,y)+(b(u,v)*(exp(2*pi*(0+1j)*((u*x)/25+(v*y)/25))))/625;
            end
        end
    end
end

%invimg=ifft2(fft2(c));

subplot(1,4,2),imshow(fftshift(real(b))),title('FFT2 on Image w/o function');
subplot(1,4,3),imshow(fftshift(fft2(c))),title('FFT2 on Image with function');
subplot(1,4,4),imshow(real(invimg)),title('Recovered Original Image');