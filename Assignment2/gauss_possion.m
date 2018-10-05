function [ x  ] = gauss_possion( n,b )
%�ô�״guass��ȥ����poisson������ɢ������Է�����
%�߽�Ϊ0��������Ϊn
N=(n-1)^2;%�������ģ
v=ones(n-1,1);
u=ones(N,1);
A1=eye(n-1)*4+full(spdiags([v v],[-1,1],n-1,n-1))*(-1);
A=kron(eye(n-1),A1);
A=A+full(spdiags([u u],[-n+1,n-1],N,N))*(-1);
B=A*n^2;
for i=1:N-n+1
    B(i+1:i+n-1,i)=B(i+1:i+n-1,i)/B(i,i);
    B(i+1:i+n-1,i+1:i+n-1)=B(i+1:i+n-1,i+1:i+n-1)-B(i+1:i+n-1,i)*B(i,i+1:i+n-1);
end%guass��Ԫ
for i=N-n+2:N
    B(i+1:N,i)=B(i+1:N,i)/B(i,i);
    B(i+1:N,i+1:N)=B(i+1:N,i+1:N)-B(i+1:N,i)*B(i,i+1:N);
end%����B�洢��L,U����Ϣ
z = zeros(N,1);
for i=1:n-1
    z(i)=b(i)-B(i,1:i-1)*z(1:i-1,1);
end
for i=n:N
    z(i)=b(i)-B(i,i-n+1:i-1)*z(i-n+1:i-1,1);
end
x = zeros(N,1);
for i=0:n-2
    x(N-i)=(z(N-i)-B(N-i,N-i+1:N)*x(N-i+1:N,1))/B(N-i,N-i);
end
for i=n-1:N-1
    x(N-i)=(z(N-i)-B(N-i,N-i+1:N-i+n-1)*x(N-i+1:N-i+n-1,1))/B(N-i,N-i);
end
end

