function [T] = compare_KKLLL(n,s,times)
n_num=length(n);
s_num=length(s);
T=zeros(n_num,s_num);
for i=1:1:n_num
    for j=1:1:s_num
        A=sprand(n(i),n(i),s(j));
        for k=1:1:times
            [~,~,t]=MC_per(A,@f_KKLLL,1,0.15,5000,5000);
            T(i,j)=T(i,j)+t;
        end
    end
end
T=T/times;
end