function [out] = f_KKLLL(~)
out=randi(3);
if out==1
    out=1;
end
if out==2
    out=-0.5-sqrt(3)/2i;
end
if out==3
    out=-0.5+sqrt(3)/2i;
end
end
