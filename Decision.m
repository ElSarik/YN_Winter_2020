%% Sarikakis Ilias - Ioannis AM:1428
%% Plane creation function
function ret_mesh = Decision(a,b,c,d)
    x1 = -0.5:0.1:3.5;
    x2 = -0.5:0.1:3.5;
    [x1,x2] = meshgrid(x1,x2);
    x3 = (-a/c)*x1 + (-b/c)*x2 + (-d/c);
    ret_mesh = surf(x1,x2,x3);
    pause(0.5);
end