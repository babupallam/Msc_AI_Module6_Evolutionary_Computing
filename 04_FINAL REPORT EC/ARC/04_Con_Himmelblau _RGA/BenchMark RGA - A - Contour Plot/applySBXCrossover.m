function [o1, o2] = applySBXCrossover(parent1, parent2, pC, gamma)
%p1 and p2 are parents, parent 1 and parent 2 , and both are of same size
%gamma is spread factor for crossover

%compare with ramdom probability with the crossover probability
if rand() < pC

    % Compare cost of parent1 and parent2 and ensure that parent1<parent2
    % by swapping both
    if parent1.Cost > parent2.Cost
        temp = parent2;
        parent2 = parent1;
        parent1 = temp;
    end

    %perform crossover
    %initialize offprings of parent size
    o1 = zeros(size(parent1.Position));
    o2 = zeros(size(parent1.Position));
    % for each index/ variable in parent we do perform the following
    % operations and generate the curresponding two variables for each offspring o1 and o2
    for l=1:length(parent1.Position)

        %step1: Generate random probabilities which is in between 0 and 1
        u = rand();
        %step2: Determine beta value corresponding to u value
        %check the condition
        if(u <= 0.5)
            beta = (2*u)^(1/(gamma+1));
        else
            beta = (1/(2*(1-u)))^(1/(gamma+1));
        end

        %perform crossover and generate the variables of o1 and o2
        %curresponding to p1 and p2
        o1(l) = 0.5 * ((parent1.Position(l) + parent2.Position(l)) - beta * (parent2.Position(l)-parent1.Position(l)));
        o2(l) = 0.5 * ((parent1.Position(l) + parent2.Position(l)) + beta * (parent2.Position(l)-parent1.Position(l)));


    end
else
    %no crossover
    o1 = parent1.Position;
    o2 = parent2.Position;
end
end
