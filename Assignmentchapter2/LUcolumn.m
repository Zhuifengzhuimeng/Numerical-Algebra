function [ L,U ,u ] =LUcolumn(A )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

n = size(A,1);
u=zeros(n,1);%��¼�û�����P
U=zeros(n,n);
L=zeros(n,n);

B=A;
for i=1:n-1
    [a1,a2]=max(B(i:n,i));
    u(i)=a2+i-1;
    t1=B(i,:);
    B(i,:)=B(a2+i-1,:);
    B(a2+i-1,:)=t1;
    B(i+1:n,i)=B(i+1:n,i)/B(i,i);
    B(i+1:n,i+1:n)=B(i+1:n,i+1:n)-B(i+1:n,i)*B(i,i+1:n);
end%����B�洢��L,U����Ϣ
for i=1:n
    U(i,:)=[zeros(1,i-1),B(i,i:n)];
    L(i,:)=[B(i,1:i-1),1,zeros(1,n-i)];
end
end

