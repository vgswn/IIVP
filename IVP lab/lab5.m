a=imread('cameraman.tif');
%a=rgb2gray(a);

% Average filter 3x3
[r,c]=size(a);
i1=a;
for i=1:1:r
    for j=1:1:c
        s=0.0;
        bi=-1;
        for p=0:1:2
            ai=-1;
            for q=0:1:2
                if i+ai<=r && i+ai>=1 && j+bi>=1 && j+bi<=c 
                    s=s+a(i+ai,j+bi,1)/9.0;
                end
                ai=ai+1;
            end
            bi=bi+1;
        end
        i1(i,j)=s;
    end
end


% Gaussian Mask 5x5
i2=a;
g=zeros(5,5);
q=-2;
for i=1:1:5
    p=-2;
    for j=1:1:5
        d=exp(-1.0*(p*p+q*q)/(2.0*2.0*2));
        g(i,j)=d;
        p=p+1;
    end
    q=q+1;
end
g = g / sum(g(:));
for i=1:1:r
    for j=1:1:c
        x=0;
        bi=-2;
        for p=0:1:4
            ai=-2;
            for q=0:1:4
                if i+ai<=r && i+ai>=1 && j+bi>=1 && j+bi<=c 
                    x=x+g(p+1,q+1)*a(i+ai,j+bi);
                end
                ai=ai+1;
            end
            bi=bi+1;
        end
        i2(i,j)=x;
    end
end


% Laplacian
lap=[-1 -1 -1; -1 8 -1;-1 -1 -1];
b=im2double(imread('moon.jpg'));
%b=rgb2gray(b);
[r,c]=size(b);
i3=b;
for i=1:1:r
    for j=1:1:c
        x=0;
        bi=-1;
        for p=0:1:2
            ai=-1;
            for q=0:1:2
                if i+ai<=r && j+bi<=c&& i+ai>=1 && j+bi>=1
                    x=x+lap(p+1,q+1)*b(i+ai,j+bi);
                end
                ai=ai+1;
            end
            bi=bi+1;
        end
        i3(i,j)=x;
    end
end
lws=i3;
mn=min(i3(:));
mx=max(i3(:));
i3=((i3-mn)/(mx-mn));
i4=b+i3;
mn=min(i4(:));
mx=max(i4(:));
i4=(i4-mn)/(mx-mn);
i4 = imadjust(i4, [60/255 200/255], [0 1]);
figure(1);
subplot(1,3,1),imshow(a),title('Original Image 1');
subplot(1,3,2),imshow(i1),title('Average filter');
subplot(1,3,3),imshow(i2),title('Gaussian filter');
figure(2);
subplot(1,4,1),imshow(b),title('Original Image 2');
subplot(1,4,2),imshow(lws),title('Without scaling laplacian');
subplot(1,4,3),imshow(i3),title('With scaling laplacian');
subplot(1,4,4),imshow(i4),title('Sharpened Image');