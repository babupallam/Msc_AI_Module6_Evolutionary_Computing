if any(it == genNumber(:))

    %this line of code below is to  make sure that all graphs come into
    %seperate
    figure(it);

    hold on;
    % plot the contour graph

    % Prepare Mesh for Contour Plots
    [X,Y] = meshgrid(VarMin:0.1:VarMax, VarMin:0.1:VarMax);
    %create the possible solution space with X and Y
    Z = (X.^2 + Y - 11).^2 + (X + Y.^2 - 7).^2;

    % Contour Plot of Constraints (Shaded Region is Infeasible)
    C = Constraints(X, Y, R);
    contourf(X,Y, C, [eps eps], 'linewidth', 1, 'linecolor','b');

    % Contour Plot of Cost Function
    Z = CostFunction(X,Y);
    colormap(sky);
    contour(X,Y, Z, 5);
    %assign limits to the graph for a close view
    %mark the points in the contour graph for the iteration 'it'
    for loop = 1:nPop
        hold on;
        scatter(pop(loop).Position(1),pop(loop).Position(2),"filled","b" );
        title(['RGA Himmelblau Function' num2str(it) "th Generation"]);
        hold on
        scatter(bestsol.Position(1), bestsol.Position(2),"filled","o","r");
        hold off
    end
    ylim([3 6]);
    xlim([3 6]);
    % axis equal
    hold off
end
