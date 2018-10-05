function [ x ] =LUsolve(A, b)
%LUsolve
%对于方程Ax=b，利用LU分解法求解

n = size(A,1);
U=zeros(n,n);
L=zeros(n,n);
B=A;
for i=1:n-1
    B(i+1:n,i)=B(i+1:n,i)/B(i,i);
    B(i+1:n,i+1:n)=B(i+1:n,i+1:n)-B(i+1:n,i)*B(i,i+1:n);
end
for i=1:n
    U(i,:)=[zeros(1,i-1),B(i,i:n)];
    L(i,:)=[B(i,1:i-1),1,zeros(1,n-i)];
end
for i=1:n
    z(i)=b(i);
    for j=1:i-1
    z(i)=z(i)-L(i,j)*z(j);
    end
end
x = zeros(n,1);
for i=0:n-1
    x(n-i)=(z(n-i)-U(n-i,n-i+1:n)*x(n-i+1:n,1))/U(n-i,n-i);
end
end
    