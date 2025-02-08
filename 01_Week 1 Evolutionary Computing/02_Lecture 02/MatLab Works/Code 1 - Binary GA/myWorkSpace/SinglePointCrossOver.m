function [o1,o2] = SinglePointCrossOver(p1,p2)
    nVar = length(p1);
    j = randi(1,nVar-1);

    o1 = [p1(1:j) p2(j+1:end)];
    o2 = [p2(1:j) p1(j+1:end)];


end