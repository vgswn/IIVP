a=imread('CAPTURE.png');
g=rgb2gray(a);
subplot(1,3,1),imshow(a);
subplot(1,3,2),imshow(g);
mx=max(g(:));
mn=min(g(:));
p1=sprintf('Maximum intensity is = %d',mx);
p2=sprintf('Minimum intensity is = %d',mn);
disp(p1);
disp(p2);
[r,c]=size(g);
sg=zeros(r,c);
i=1;
j=1;
for i=1:1:r
    for j=1:1:c
        sg(i,j)=((g(i,j)-mn)/(mx-mn))*255;
    end
end
sg1=((g-min(g(:)))/(max(g(:))-min(g(:))))*255;
subplot(1,3,3),imshow(uint8(sg));