function [ infinity,cond ] = hilbert_condition( n )
%hilbert
%此处显示详细说明
A=zeros(n,n);
    for i=1:n
        for j=1:n
            A(i,j)=1/(i+j-1);
        end
    end
b=sum(A,2);
[infinity,r]=max(b);
x=1/n*ones(n,1);
k=1;
A1=A';

for count=0:n
    if k==1
       w=LUcolumnsolve(A1,x);
        v=sign(w);
       z=LUcolumnsolve(A,v);
        t=norm(w,1);
        if(norm(z,inf)==z'*x)
            t=norm(w,1);
            k=0;
        else
            [infinity2,r]=max(z);
            x=eye(n);
            x=x(:,r);
            k=1;
        end 
    end
end
cond=infinity*t;
end

