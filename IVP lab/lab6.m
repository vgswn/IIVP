a=imread('cameraman.tif');
a=imresize(a,[256,256]);
[r,c]=size(a);

% Gaussian Filter  5x5
i1=a;
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
figure(1);
subplot(1,5,1),imshow(a),title('Original');
for d=1:1:4
    a=i1;
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
            i1(i,j)=x;
        end
    end
    subplot(1,5,d+1),imshow(i1),title(sprintf('Iteration no %d',d));
end


% Average Filter 3x3
a=imread('cameraman.tif');
a=imresize(a,[256,256]);
figure(2);
subplot(1,5,1),imshow(a),title('Original');
i1=a;
for d=1:1:4
    a=i1;
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
    subplot(1,5,d+1),imshow(i1),title(sprintf('Iteration no %d',d));
end




