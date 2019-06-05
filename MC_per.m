function [per,flag,t] = MC_per(A,f,tol,alpha,min_iter,max_iter)
A=double(logical(A));
iter=0;
result=[];
per=0;
flag=0;
tic;
while(iter<max_iter)
    A_temp=randomize_matrix(A,f);
    result=[result,det(A_temp)*conj(det(A_temp))];
    per=per+result(end);
    iter=iter+1;
    if iter>=min_iter
        n=var(result)/tol^2/alpha;
        if iter>=n
            flag=1;
            break;
        end
    end
end
per=per/iter;
t=toc;
end