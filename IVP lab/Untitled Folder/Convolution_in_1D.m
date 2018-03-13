x=linspace(1,100,100);
a=heaviside(x)-heaviside(x-40);


subplot(1,3,1),plot(x,a),title('Original image');


b=conv(a,a);
cnvx=linspace(1,100,199);

subplot(1,3,2),plot(cnvx,b),title('Convolved image using function');

%{
cnvimg=zeros(1,199);
for x=1:1:199
    for m=1:1:100
        if x+1-m>=1 && x+1-m<=100
            cnvimg(x)=cnvimg(x)+a(m)*a(x+1-m);
        end
    end
end
dmx=1:1:199;
subplot(1,3,3),plot(dmx,cnvimg),title('Convolved image w/o function');
%}

cnvimg=zeros(1,100);
for x=1:1:100
    for m=1:1:100
        if x-m>=1 && x-m<=100
            cnvimg(x)=cnvimg(x)+a(m)*a(x-m);
        end
    end
end
dmx=1:1:100;
subplot(1,3,3),plot(dmx,cnvimg),title('Convolved image w/o function');



