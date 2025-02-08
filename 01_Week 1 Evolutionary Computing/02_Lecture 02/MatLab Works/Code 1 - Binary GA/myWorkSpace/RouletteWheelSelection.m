function i  = RouletteWheelSelection(p)
    %random probability
    r = rand*sum(p);
    %cumulative probability
    c = cumsum(p);
    i= find(r<c,1,"first");
end