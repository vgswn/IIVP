a=imread('cam.PNG');
a=double(a);
c0=mod(a,2);
c8=mod(floor(a/128),2);
subplot(1,2,1),imshow(c0);
subplot(1,2,2),imshow(c8);
r=10;
%{
while r>0;
    disp(mod(r,2));
    r=floor(r/2);
end
%}