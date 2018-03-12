a=input('Enter no ');
b=zeros(a*50,a*50);
i=1;
j=1;
ci=1;
cj=1;
for i=1:50:a*50
    for j=1:50:a*50
        c=mod(ci+cj,2);
        cj=cj+1;    
        p=1;
        q=1;
        for p=0:1:49
            for q=0:1:49
                b(i+p,j+q)=c;
            end
        end
    end
    ci=ci+1;
    cj=1;
end
imshow(b);
            
            
            