function [out] = f_GG(~)
out=randi(2);
if out==1
    out=-1;
end
if out==2
    out=1;
end
end