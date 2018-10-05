    A=zeros(40,40);
    for i=1:40
        for j=1:40
            A(i,j)=1/(i+j-1);
        end
    end
    x=ones(40,1);
    b=sum(A,2);
    t1=clock;
    x1=square(A,b);
    t2=clock;
    r1=norm(x1-x,2)
    T_1=etime(t2,t1)
    t1=clock;
    x2=squareLDL(A,b);
    t2=clock;
    r2=norm(x2-x,2);
    T_2=etime(t2,t1)
    t1=clock;
    x3=A\b;
    t2=clock;
    r3=norm(x3-x,2)
    T_3=etime(t2,t1)
    t1=clock;
    x4=LUcolumnsolve(A,b);
    t2=clock;
    r4=norm(x4-x,2);
    T_4=etime(t2,t1)

