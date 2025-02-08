function g = InequalityConstraints(x1, x2, R)

% two constrants for this problem are defined below
% Constraints g(x1, x2) >= 0
g(:,:,1) = (x1-5).^2 + x2.^2 - 26;
g(:,:,2) = 4*x1 + x2 - 20;

% If Constraint satisfied, then make it 0
g(g > 0) = 0;

% Penalty = Σ R*|{g(u1,u2)}|
g = sum(R.*abs(g),3);

% Remove extra dimensions
g = squeeze(g);
