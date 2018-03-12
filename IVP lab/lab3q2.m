a=imread('cam.png');
b=a;
a=im2double(a);
nthroot=a.^(0.3);
nthpower=a.^3;
log1=a;
[r,c]=size(a);
for i=1:1:r
    for j=1:1:c
        log1(i,j)=2*log(1+a(i,j));
    end
end
L=256;
ilog1=uint8((exp(double(b)) .^ (log(L) / (L-1))) - 1);
identity=a;
negative=b;
[r,c]=size(a);
for i=1:1:r
    for j=1:1:c
        negative(i,j)=255-b(i,j);
    end
end
N=5;
ind = -floor(N/2) : floor(N/2);
[X Y] = meshgrid(ind, ind);
sigma=2;
h = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
h = h / sum(h(:));
disp(h);
disp(X);
disp(Y);
G = fspecial('gaussian',[5 5],2);
tf=identity;
g=zeros(5,5);
b=-2;
for i=1:1:5
    a=-2;
    for j=1:1:5
        d=exp(-1.0*(a*a+b*b)/(2.0*2.0*2));
        g(i,j)=d;
        %g(i,j)=d;
        a=a+1;
    end
    b=b+1;
end
g = g / sum(g(:));
disp(G);
disp(g);
for i=1:1:r
    for j=1:1:c
        x=0;
        for p=0:1:4
            for q=0:1:4
                if i+p<=256 && j+q<=256
                    x=x+G(p+1,q+1)*identity(i+p,j+q);
                end
            end
        end
        tf(i,j)=x;
    end
end
for i=1:1:r
    for j=1:1:c
        x=0;
        b=-2;
        for p=0:1:4
            a=-2;
            for q=0:1:4
                if i+a<=r && j+b<=c&& i+a>=1 && j+b>=1
                    x=x+G(p+1,q+1)*identity(i+a,j+b);
                end
                a=a+1;
            end
            b=b+1;
        end
        tf(i,j)=x;
    end
end
%# Filter it
si=identity;
nthroot = imfilter(nthroot,G,'same');
nthpower = imfilter(nthpower,G,'same');
log1 = imfilter(log1,G,'same');
ilog1 = imfilter(ilog1,G,'same');
identity = imfilter(identity,g,'same');
%tf=imfilter(identity,G,'same');
negative = imfilter(negative,G,'same');
%imshow(Ig);
%{
subplot(1,7,1),imshow(a);
subplot(1,7,2),imshow(nthroot),title('nth root');
subplot(1,7,3),imshow(nthpower),title('nth power');
subplot(1,7,4),imshow(log1),title('log');
subplot(1,7,5),imshow(ilog1),title('inverse log');
subplot(1,7,6),imshow(identity),title('identity');
subplot(1,7,7),imshow(negative),title('negative');
%}
subplot(1,3,1),imshow(si);
subplot(1,3,2),imshow(tf);
subplot(1,3,3),imshow(identity);