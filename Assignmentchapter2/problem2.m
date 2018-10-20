for n=5:30
    A=diag(ones(n,1));
    for j=1:n
        A(j,1:j-1)=(-1)*ones(1,j-1);
    end
    for j=1:n
        A(j,n)=1;
    end
    x=randn(n,1);
    b=A*x;
    x0=LUcolumnsolve(A,b);

    
    relatederror=norm(x0-x,inf)/norm(x,inf);
    
    res=b-A*x0;
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
            if t<norm(w,1)
                t=norm(w,1);
            end
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
    errorest=cond*norm(res,inf)/norm(b,inf);
    fprintf('%d &%e &%e\\\\\n',n,relatederror,errorest);
end