
for n=92:99
    x=sin([1/n:1/n:1-1/n]*pi);
    y=sin([1/n:1/n:1-1/n]*pi);
    f=2*pi^2*kron(x,y)';
    N=(n-1)^2;
    v=ones(n-1,1);
    u=ones(N,1);
A1=eye(n-1)*4+full(spdiags([v v],[-1,1],n-1,n-1))*(-1);
A=kron(eye(n-1),A1);
A=A+full(spdiags([u u],[-n+1,n-1],N,N))*(-1);
A=A*n^2;
%     t1=clock;
%     r0=LUsolve1(A,f);
%     t2=clock;
%     T1(n)=etime(t2,t1);
%     t1=clock;
%     r0=squareLDL(A,f);
%     t2=clock;
%     T2(n)=etime(t2,t1);
    t1=clock;
    r0=gauss_possion(n,f);
    t2=clock;
    T3(n)=etime(t2,t1);
    t1=clock;
    r0=A\f;
    t2=clock;
    T4(n)=etime(t2,t1);
    n
end
