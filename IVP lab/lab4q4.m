a=imread('cameraman.tif');



cnt=zeros(1,256);
[r,c]=size(a);
mean=sum(a(:))/(r*c);
var=0.0;
for i=1:1:r
    for j=1:1:c
        cnt(a(i,j)+1)=cnt(a(i,j)+1)+1;
        var=var+(a(i,j)-mean)*(a(i,j)-mean);
    end
end
var=(double(var))/(r*c);

fprintf('Mean = %f\n',mean);
fprintf('Variance = %f\n',var);


s=zeros(1,256);
%disp(cnt);
for i=1:1:256
    if i==1
        s(i)=(double(255*cnt(i)))/(r*c);
    else
        s(i)=s(i-1)+(double(255*cnt(i)))/(r*c);
    end
end

for i=1:1:256
    s(i)=round(s(i));
end

%disp(size(s));


i1=a;
for i=1:1:r
    for j=1:1:c
        i1(i,j)=s(a(i,j)+1);
    end
end

i2=a;


for i=1:1:r
    for j=1:1:c
       
        cnt=zeros(1,256);
        for p=0:1:2
            for q=0:1:2
                 if i+p<=r && i+p>=1 && j+q>=1 && j+q<=c 
                     cnt(a(i+p,j+q)+1)=cnt(a(i+p,j+q)+1)+1;
                 end 
            end
        end

        s=zeros(1,256);
        for p=1:1:256
            if p==1
                s(p)=(double(255*cnt(p)))/(9);
            else
                s(p)=s(p-1)+(double(255*cnt(p)))/(9);
            end
        end

        for p=1:1:256
            s(p)=round(s(p));
        end



        for p=0:1:2
            for q=0:1:2
                if i+p<=r && i+p>=1 && j+q>=1 && j+q<=c
                    i2(i+p,j+q)=s(a(i+p,j+q)+1);
                end
            end
        end
        
    end
end


%{
subplot(3,2,1),imshow(a);
subplot(3,2,2),histogram(a);
subplot(3,2,3),imshow(i1)
subplot(3,2,4),histogram(i1);
subplot(3,2,5),imshow(i2)
subplot(3,2,6),histogram(i2);
%}

subplot(1,3,1),imshow(a);
subplot(1,3,2),imshow(i1);
subplot(1,3,3),imshow(i2);