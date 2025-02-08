function z = RosenBrockFunction(in)
    x=in(1);
    y=in(2);
     z =100*(y-x.^2).^2+(x-1).^2;
end