a=imread('saltpepper.PNG');
i1=a;
% Median Filter
[r,c]=size(a);
for i=1:1:r
    for j=1:1:c
        ls=zeros(1,9);
        for p=1:1:9
            ls(p)=300;
        end
        cnt=1;
        for p=0:1:2
            for q=0:1:2
                if i+p<=r && j+q<=c
                    ls(cnt)=a(i+p,j+q);
                    cnt=cnt+1;
                end
            end
        end
        ls=sort(ls);
        i1(i,j)=a(i,j);
        if ls(5)<=256
            i1(i,j)=ls(5);
        end
    end
end




[r,c]=size(a);
i2=a;
for i=1:1:r
    for j=1:1:c
        s=0.0;
        bi=-1;
        for p=0:1:2
            ai=-1;
            for q=0:1:2
                if i+ai<=r && i+ai>=1 && j+bi>=1 && j+bi<=c 
                    s=s+a(i+ai,j+bi)/9.0;
                end
                ai=ai+1;
            end
            bi=bi+1;
        end
        i2(i,j)=s;
    end
end






subplot(1,3,1),imshow(a);
subplot(1,3,2),imshow(i1);
subplot(1,3,3),imshow(i2);