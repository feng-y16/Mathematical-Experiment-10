function [A] = randomize_matrix(A,f)
A=double(logical(A));
for i=1:1:length(A)
    for j=1:1:length(A)
        if A(i,j)~=0
            A(i,j)=f();
        end
    end
end
end