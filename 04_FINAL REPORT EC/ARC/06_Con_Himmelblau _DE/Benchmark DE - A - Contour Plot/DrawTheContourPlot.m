if any(it == genNumber(:))
    
    %this line of code below is to  make sure that all graphs come into
    %seperate
    figure(it);
    
    hold on;
    % plot the contour graph

    % Prepare Mesh for Contour Plots
    x1 = linspace(VarMin(1),VarMax(1));
    x2 = linspace(VarMin(end),VarMax(end));
    [X1,X2] = meshgrid(x1,x2);

    % Contour Plot of Constraints (Shaded Region is Infeasible)
    C = Constraints(X1, X2, R);
    contourf(X1, X2, C, [eps eps], 'linewidth', 2, 'linecolor','g');

    % Contour Plot of Cost Function
    Z = CostFunction(X1,X2);
    colormap(bone)
    contour(X1, X2, log(Z), 5);


    %mark the points in the contour graph for the iteration 'it'
    for loop = 1:nPop
        hold on;
        scatter(plotX(it,loop),plotY(it,loop),"filled","y" );
        title(['RGA Himmelblau Function' num2str(it) "th Generation"]);
        hold on
        scatter(BestSol.Position(1), BestSol.Position(2),"filled","o","r");
        hold off
    end
    axis equal
    hold off
end
