function [o1, o2] = applyRealLinearCrossover(p1, p2, gamma)
    %gamma has no use in RealLinearCrossover, please ignore it -- babu
    offSpring = zeros(3,numel(p1));
    %generate three crossovers
    offSpring(1,:) = (1/2).*p1 + (1/2).*p2;
    offSpring(2,:) = (3/2).*p1 - (1/2).*p2;
    offSpring(3,:) = (3/2).*p2 - (1/2).*p1;
    
    % o2---p1---o1---p2----o3
    %take two best from those
    %to get best, I picked two random from offSpring array and make it as o1 and o2;
    o1 = offSpring(randi(3),:);
    o2 = offSpring(randi(3),:);
    %sort it;

end

