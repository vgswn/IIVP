graphics_toolkit('gnuplot')
pkg load specfun

x = linspace(1,400,400);

x1 = linspace(1,200,200);


i2=heaviside(x-75)-heaviside(x-175);

i3=conv(i2,i2);

f =i2;
h=i2;
Y=zeros(400);

for i=1:1:400
  for j=1:1:400
    if i-j >= 1 && i-j <=400
      Y(i)=Y(i)+(f(j)*h(i-j));
    endif
  end
end
subplot(2,1,1),plot(x,i2);

subplot(2,1,2),plot(x,Y);
  









