b=ones(84,1)*15;
b(1)=7;
b(84)=14;
A=full(spdiags([ones(84,1)*8,ones(84,1)*6,ones(84,1)],[-1 0 1],84,84));
x1=LUsolve(A,b);
x2=LUcolumnsolve(A,b);
c=ones(84,1);
r1=norm(x1-c,2)
r2=norm(x2-c,2)