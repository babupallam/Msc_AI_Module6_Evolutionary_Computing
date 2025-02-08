function out = SortPopulation(pop)
    [~,so] =sort([pop.Cost]);
    out =pop(so);
end