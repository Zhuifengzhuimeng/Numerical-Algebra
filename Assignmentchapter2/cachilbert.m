for i=5:20
    [infinity,cond]=hilbert_condition(i);
    fprintf('%d &%.3d &%.3d\\\\\n',i,infinity,cond);
end