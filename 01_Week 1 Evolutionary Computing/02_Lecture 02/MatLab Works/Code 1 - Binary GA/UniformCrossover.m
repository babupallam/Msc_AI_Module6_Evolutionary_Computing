function [o1, o2] = UniformCrossover(p1, p2)

    alpha = randi([0, 1], size(p1));%each bit is taken from either parent with same probabillity
        % Note:
            % - unlike other operators, here each gene considers seperately
        % 
    o1 = alpha.*p1 + (1-alpha).*p2;
    o2 = alpha.*p2 + (1-alpha).*p1;

end