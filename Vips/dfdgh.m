graphics_toolkit('gnuplot')
pkg load specfun
x = linspace(-10,10,1001);
 grid
 hold;
 a = sinc(x/.2)
 plot(x,a),'r';
 b = rect(x/10)
 plot(x,b),'c';
 y=conv(a,b,'full');
 axis = linspace((-10 - halfWindowWidth), (+10 + halfWindowWidth), length(y)) ;
%axis=(0:length(y)-1)*(x(2)-x(1));
 plot(axis,y)