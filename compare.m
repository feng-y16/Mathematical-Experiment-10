function [out1,out2,out3] = compare(A,iter,times)
A=double(logical(A));
tol=1;
alpha=0.15;
min_iter=iter;
max_iter=iter;
out1=[];
out3=[];
for i=1:1:times
    [per_GG,~,t_GG]=MC_per(A,@f_GG,tol,alpha,min_iter,max_iter);
    [per_KKLLL,~,t_KKLLL]=MC_per(A,@f_KKLLL,tol,alpha,min_iter,max_iter);
    [per_N,~,t_N]=MC_per(A,@f_N,tol,alpha,min_iter,max_iter);
    tic;
    per=Nperm(A);
    t_A=toc;
    out1=[out1;per_GG,per_KKLLL,per_N,per];
    out3=[out3;t_GG,t_KKLLL,t_N,t_A];
end
error=zeros(1,4);
temp=mean(out1);
if temp(4)~=0
    error(1)=(temp(1)-temp(4))/temp(4);
    error(2)=(temp(2)-temp(4))/temp(4);
    error(3)=(temp(3)-temp(4))/temp(4);
else
    error=temp;
end
out1=full(out1);
out2=full([mean(out1);error;var(out1)]);
out3=full(mean(out3));
end