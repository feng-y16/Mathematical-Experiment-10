function [T] = compare_Nperm(n,s,times)
n_num=length(n);
s_num=length(s);
T=zeros(n_num,s_num);
for i=1:1:n_num
    for j=1:1:s_num
        A=sprand(n(i),n(i),s(j));
        for k=1:1:times
            [~,t]=Nperm(A);
            T(i,j)=T(i,j)+t;
        end
    end
end
T=T/times;
end