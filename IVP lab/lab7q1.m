a=imread('cameraman.tif');

% Gaussian Filter
g=zeros(3,3);
[r,c]=size(a);
p=-1;
for i=1:1:3
    q=-1;
    for j=1:1:3
        g(i,j)=exp(-(p*p+q*q)/(2.0*2.0*2));
        q=q+1;
    end
    p=p+1;
end
blur=a;
g=g/(sum(g(:)));
for i=1:1:r
    for j=1:1:c
        x=0;
        bi=-1;
        for p=0:1:2
            ai=-1;
            for q=0:1:2
                if i+ai>=1 && i+ai<=r && j+bi>=1 && j+bi<=c
                    x=x+a(i+ai,j+bi)*g(p+1,q+1);
                end
            end
        end
        blur(i,j)=x;
    end
end

% Mask
mask=a-blur;

um=a+mask;
hbf=a+5*mask;

subplot(1,3,1),imshow(a);
subplot(1,3,2),imshow(um);
subplot(1,3,3),imshow(hbf);

