function [ x ] =LUsolve1(A, b)
%LUsolve
%对于方程Ax=b，利用LU分解法求解
n = size(A,1);
B=A;
for i=1:n-1
    B(i+1:n,i)=B(i+1:n,i)/B(i,i);
    B(i+1:n,i+1:n)=B(i+1:n,i+1:n)-B(i+1:n,i)*B(i,i+1:n);
end
z=zeros(n,1);
for i=1:n
    z(i)=b(i)-B(i,1:i-1)*z(1:i-1,1);
end
x = zeros(n,1);
for i=0:n-1
    x(n-i)=(z(n-i)-B(n-i,n-i+1:n)*x(n-i+1:n,1))/B(n-i,n-i);
end
end

