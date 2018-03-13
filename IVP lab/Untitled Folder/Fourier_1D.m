x=1:1:100;
a=heaviside(x-20)-heaviside(x-40);

subplot(4,1,1),plot(x,a),title('Original Function');

y=fft(a);

subplot(4,1,2),plot(x,fftshift(y)),title('FFT using built in Function');

ftimg=zeros(1,100);

for u=1:1:100
    for ix=1:1:100
        ftimg(u)=ftimg(u)+a(ix)*exp(-2*pi*u*ix*(0+1j)/100);
    end
end

%ftimg=real(ftimg);
dmx=1:1:100;
subplot(4,1,3),plot(dmx,fftshift(ftimg)),title('FFT using our own Function');


rim=zeros(1,100);
for ix=1:1:100
    for u=1:1:100
        rim(ix)=rim(ix)+(ftimg(u)*exp(2*pi*u*ix*(0+1j)/100))/100;
    end
end

%rim=ifft(fft(a));

subplot(4,1,4),plot(dmx,rim),title('Recovered Function');

axis([0 100 0 1]);
