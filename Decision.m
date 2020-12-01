%ToDo: Rename function / file name
function ret_mesh = Decision(a,b,c,d)
    x1 = -3:0.1:6;
    x2 = -3:0.1:6;
    [x1,x2] = meshgrid(x1,x2);
    x3 = (-a/c)*x1 + (-b/c)*x2 + (-d/c);
    ret_mesh = surf(x1,x2,x3);
end