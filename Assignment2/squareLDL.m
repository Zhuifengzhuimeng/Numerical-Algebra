function [ x ] = squareLDL(A,b )
%squareLDL 
%用改进平方根法求解方程Ax=b
n=size(A,1);
v=zeros(n,1);
for i=1:n
    for j=1:i-1
    v(j)=A(j,j)*A(j,i);
    end
    A(i,i)=A(i,i)-A(i,1:i-1)*v(1:i-1,1);
    A(i+1:n,i)=(A(i+1:n,i)-A(i+1:n,1:i-1)*v(1:i-1,1))/A(i,i);
end
y=zeros(n,1);
for i=1:n
    y(i)=b(i)-A(i,1:i-1)*y(1:i-1,1);
end
for i=1:n
    y(i)=y(i)/A(i,i);
end
x = zeros(n,1);
for i=0:n-1
    x(n-i)=y(n-i)-A(n-i+1:n,n-i)'*x(n-i+1:n,1);
end
end

