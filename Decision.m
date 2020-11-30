function ret_mesh = Decision(a,b,c,d)
    x1 = -3:0.1:6;
    x2 = -3:0.1:6;
    [x1,x2] = meshgrid(x1,x2);
%     a = 1;
%     b = -1.5;
%     c = 0.5;
%     d = -1.5;

    x3 = (-a/c)*x1 + (-b/c)*x2 + (-d/c);
%     figure(1);
    ret_mesh = mesh(x1,x2,x3);
end