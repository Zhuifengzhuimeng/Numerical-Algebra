function [x ] = square( A,b )
%square
%用平方根法求解方程Ax=b
n=size(A,1);
for i=1:n
    A(i,i)=sqrt(A(i,i));
    A(i+1:n,i)=A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n);
end
y=zeros(n,1);
for i=1:n
    y(i)=b(i);
    for j=1:i-1
    y(i)=y(i)-A(i,j)*y(j);
    end
    y(i)=y(i)/A(i,i);
end
x = zeros(n,1);
for i=0:n-1
    x(n-i)=y(n-i);
    for j=n-i+1:n
    x(n-i)=x(n-i)-A(j,n-i)'*x(j,1);
    end
    x(n-i)=x(n-i)/A(n-i,n-i);
end
end

