clc;
clear;
close all;

% Initialization of swarm parameters
n=2;                    % Number of dimentions
MaxIt=50;              % Maximum Iterations
c1=1.5;                 % Personal Acceleration Coefficient
c2=2.7;                 % Social Acceleration Coefficient
GlobalBest=0;           % Global Best of Cost function
nPop=50;                % Particle Swarm Size
Swarm_gbest=[0 0];      % Best swarm potition
Swarm_gbest_z=inf;       % Best swarm potition on z 
v_max=0;                % Max Particle Velocity

% Initial swarm positioning

x_range=-3:0.1:3;
y_range=-3:0.1:3;
[xs, ys]=meshgrid(x_range, y_range);
in = [xs(:), ys(:)];
out=ones(1,size(xs,1)*size(xs,2))*Inf;

for i=1:size(xs,1)*size(xs,2)
out(1,i)=ackley(in(i,:));
end

zs = reshape(out, size(xs));

swarm=(-3)+rand(nPop,n)*6;
part_best_pos=swarm; 
velocity=rand(nPop,2)*v_max;
output=zeros(1,20);

for i=1:size(swarm,1)
    output(1,i)=ackley(swarm(i,:));
    if output(1,i) < Swarm_gbest_z
        Swarm_gbest_z = output(1,i);
        Swarm_gbest = [swarm(i,1) swarm(i,2)];
    end
end

swarm_best_pos_z=output;

show3DPlot = 1;
showContourPlot = 0;

if (show3DPlot == 1)
    figure(1);
    surf(xs,ys,zs);
    colormap('gray');
    hold on
    plot3(swarm(:,1),swarm(:,2),output,'r*');
    hold off
end

if (showContourPlot == 1)
    figure(2);
    contour(xs,ys,zs,5);
    colormap('gray');
    hold on
    plot(swarm(:,1),swarm(:,2),'r*');
    hold off
end

%% Main loop

k=1;
e=0.01;
while k<=MaxIt && (abs(Swarm_gbest_z-GlobalBest)> e)
    r1=rand(1,1); % Random real number between [0,1]
    r2=rand(1,1); % Random real number between [0,1]
    for i=1:size(velocity,1)
%         velocity(i,1) = wm*velocity(i,1) + (c1*r1*(part_best_pos(i,1)-swarm(i,1)))+(c2*r2*(Swarm_gbest(1,1)-swarm(i,1)));
%         velocity(i,2) = wm*velocity(i,2) + (c1*r1*(part_best_pos(i,2)-swarm(i,2)))+(c2*r2*(Swarm_gbest(1,2)-swarm(i,2)));
        %ADDED v_max INSTEAD OF wm
        velocity(i,1) = v_max*velocity(i,1) + (c1*r1*(part_best_pos(i,1)-swarm(i,1)))+(c2*r2*(Swarm_gbest(1,1)-swarm(i,1)));
        velocity(i,2) = v_max*velocity(i,2) + (c1*r1*(part_best_pos(i,2)-swarm(i,2)))+(c2*r2*(Swarm_gbest(1,2)-swarm(i,2)));
    end
    
    for i=1:size(swarm,1)
        swarm(i,1) = swarm(i,1) + (velocity(i,1));
        swarm(i,2) = swarm(i,2) + (velocity(i,2));
        
        % Relocate adrift particles inside the predefined search area
        if (swarm(i,1) > 3) || (swarm(i,2) > 3)
            swarm(i,1) = (-3+rand(1,1)*(3-(-3)));
            swarm(i,2) = (-3+rand(1,1)*(3-(-3)));
        end
        if (swarm(i,1) < ((-1)*3)) || (swarm(i,2) < ((-1)*3))
            swarm(i,1) = (-3+rand(1,1)*(3-(-3)));
            swarm(i,2) = (-3+rand(1,1)*(3-(-3)));
        end
        
        output(1,i)=ackley(swarm(i,:));
        
        if output(1,i) < Swarm_gbest_z
            Swarm_gbest_z = output(1,i);
            Swarm_gbest = [swarm(i,1) swarm(i,2)];
        end
        
        if output(1,i) < swarm_best_pos_z(1,i)
            swarm_best_pos_z(1,i) = output(1,i);
            part_best_pos(i,1) = swarm(i,1);
            part_best_pos(i,2) = swarm(i,2);
        end
    end
    
    if (show3DPlot == 1)
        refresh(figure(1));
        surf(xs,ys,zs);
        colormap('gray');
        hold on
        plot3(swarm(:,1),swarm(:,2),output,'r*');
        pause(0.1)
        hold off
    end
    if (showContourPlot == 1)
        refresh(figure(2));
        contour(xs,ys,zs,5);
        colormap('gray');
        hold on
        plot(swarm(:,1),swarm(:,2),'r*');
        pause(0.1)
        hold off
    end
    k=k+1;
end

function [y] = ackley(xx, a, b, c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% INPUTS:
%
% xx = [x1, x2, ..., xd]
% a = constant (optional), with default value 20
% b = constant (optional), with default value 0.2
% c = constant (optional), with default value 2*pi
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    d = length(xx);

    if (nargin < 4)
        c = 2*pi;
    end
    if (nargin < 3)
        b = 0.2;
    end
    if (nargin < 2)
        a = 20;
    end

    sum1 = 0;
    sum2 = 0;
    for ii = 1:d
        xi = xx(ii);
        sum1 = sum1 + xi^2;
        sum2 = sum2 + cos(c*xi);
    end

    term1 = -a * exp(-b*sqrt(sum1/d));
    term2 = -exp(sum2/d);

    y = term1 + term2 + a + exp(1);
end