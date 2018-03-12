a=imread('download.jfif');
r=23;
c=46;
b=zeros(r,c,3);
x=1;
y=1;
for i=8:1:30
    for j=15:1:60
        b(x,y,:)=a(i,j,:);
        y=y+1;
    end
    x=x+1;
    y=1;
end
imshow(uint8(b));