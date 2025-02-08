function o = Mutate(p, mu, sigma)

    flag = (rand(size(p)) < mu);

    o = p;
    r = randn(size(p));
    o(flag) = p(flag) + sigma*r(flag);
        %sigma*r(flag) 
        %   ==> flag =0, they they wont do any mutation
        %   ==> flag=1, they add sigma times r
        % so sigma is more like a parameter that controls the spread of
        % that variable from the parent
    
end