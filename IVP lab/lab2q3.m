a=imread('CAPTURE.png');
a1=rgb2gray(a);
[r,c]=size(a1);
b=zeros(r,c);
i=1;
j=1;
k=1;
for i=1:1:r
    for j=1:1:c
        for k=0:1:5
            if a1(i,j)>50*k && a1(i,j)<=max(50*(k+1),255) 
               b(i,j)=50*k;
            end
        end
    end
end
b1=zeros(r,c);
i=1;
j=1;
k=1;
for i=1:1:r
    for j=1:1:c
        ic=10;
        for k=1:1:12
            if a1(i,j)>ic && a1(i,j)<=max(ic+20,255) 
               b1(i,j)=ic;
               ic=ic+20;
            end
        end
        if a1(i,j)>0 && a1(i,j)<=10
            b1(i,j)=0;
        end
    end
end
subplot(1,3,1),imshow(a1);
subplot(1,3,2),imshow(uint8(b)),title('Scale with diff of 50');
subplot(1,3,3),imshow(uint8(b1)),title('Scale with diff of 20');

            
            