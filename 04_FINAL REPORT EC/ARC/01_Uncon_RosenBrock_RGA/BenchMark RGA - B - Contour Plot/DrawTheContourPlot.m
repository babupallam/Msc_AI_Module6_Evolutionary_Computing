if any(it == genNumber(:))
    %this line of code below is to  make sure that all graphs come into
    %seperate
    figure(it);
    % plot the contour graph
    %create mesh
    [X,Y] = meshgrid(VarMin:0.1:VarMax, VarMin:0.1:VarMax);
    %create the possible solution space with X and Y
    Z = 100*(Y-X.^2).^2+(1-X).^2;
    %draw contour
    colormap(bone)
    contour(X,Y,Z);

    %mark the points in the contour graph for the iteration 'it'
    for loop = 1:nPop
        hold on;
        scatter(plotX(it,loop),plotY(it,loop),"filled","k" );
        title(['RGA - RosenBrock Function' num2str(it) "th Generation"]);
        hold on
        scatter(bestsol.Position(1), bestsol.Position(2),"filled","o","r");
        hold off
    end
end
