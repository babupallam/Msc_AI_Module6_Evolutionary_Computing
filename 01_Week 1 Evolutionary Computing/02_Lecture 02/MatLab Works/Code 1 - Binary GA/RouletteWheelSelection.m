function i = RouletteWheelSelection(p)
    % Note: Here we have used Fitness Proportionate Selection Operator
    %     - find probability of each individual -- p
    %     - find cumulative probability c 1xnVar matrix
    %     - find random value r - scalar value 1x1
    %     - find the index of first element with r<c 

    %generating random probability
    r = rand*sum(p);
    %generating cumulative probability
    c = cumsum(p);
    i = find(r <= c, 1, 'first');% condition;#outputs;direction
    % Note: find works in such a way that, traverse through each element in
    % the matrix to check with r value and get the value as a result
end