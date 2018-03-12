a=1:1:401;
a1=1:1:201;
x=heaviside(a-75)-heaviside(a-175);
y=zeros(401);
for k=1:1:401
  for l=1:1:401
      if k > l
        y(k)=y(k)+(x(l)*x(k-l));
      end
  end
end
subplot(1,2,1),plot(a1,x(1:201));
subplot(1,2,2),plot(a,y);