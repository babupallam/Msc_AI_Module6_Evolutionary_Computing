function [o1, o2] = applyLinearCrossover(p1, p2,pC, CostFunction,empty_individual)
%compare with a random probability with crossover probability
if rand() < pC
    %initialize array for 3 offprings
    offSprings = repmat(empty_individual, 3, 1);
    %generate three crossovers and calculate costs
    offSprings(1).Position =  (1/2).*p1 + (1/2).*p2;
    %calculate the cost
    offSprings(1).Cost = CostFunction( offSprings(1).Position(1),  offSprings(1).Position(2));

    offSprings(2).Position= (3/2).*p1 - (1/2).*p2;
    %calculate the cost
    offSprings(2).Cost = CostFunction( offSprings(2).Position(1),  offSprings(2).Position(2));

    offSprings(3).Position = (3/2).*p2 - (1/2).*p1;
    %calculate the cost
    offSprings(3).Cost = CostFunction( offSprings(3).Position(1),  offSprings(3).Position(2));

    %extract the two best solutions
    [~, so] = sort([offSprings.Cost], "descend");
    offSprings = offSprings(so);
    % Remove Extra Individuals
    o1 = offSprings(1).Position;
    o2 = offSprings(2).Position;
else
    o1 = p1;
    o2 = p2;
end
end

