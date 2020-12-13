%% Sarikakis Ilias - Ioannis AM:1428
%% Weight distance calculation
function dist = Distance(Wk, Wk_Plus1)
    dist = 0;
    for i=1:size(Wk)
        dist = dist + ((Wk(1,i)-Wk_Plus1(1,i)).^2).^(1/2);
%         disp(dist);
    end
end