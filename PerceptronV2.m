%% Sarikakis Ilias - Ioannis AM:1428
%%
function p = PerceptronV2(X1,X2,X3,Y)
    W0 = -1+rand(1,1)*2;
    W1 = -1+rand(1,1)*2;     % Weights initialization with randomly selected values.
    W2 = -1+rand(1,1)*2;
    W3 = -1+rand(1,1)*2;
    
    B = 1;
    LR = 0.3; 	% Bias, Learning Rate, and maximum number of Epochs initialization
    Epoch = 100;
    Epoch_completed = 0;
    
    epsilon = 0.01;
    Wk = [W0, W1, W2, W3];  % epsilon, Wk, and Wk_Plus1 initialization
    Wk_Plus1 = zeros(size(Wk));
%% Perceptron Algorithm
    while ((Epoch ~= 0)) % Algorithm ends once we have run out of Epochs
                                                     
                                                     
        p=Decision(W1,W2,W3,W0);    % Calling the Decision function with
                                    % the current weights to create a plane.
                                    
        for i=1:size(Y,2)   % Algorithm execution for every pattern
            P_output = B*W0 + X1(1,i)*W1 + X2(1,i)*W2 + X3(1,i)*W3; % Perceptron output based on the current weights
            if P_output > 0    % Positive perceptron output
                
                if Y(1,i) ~= 1          % Negative expective output Y
                    
                    W0 = W0 + LR*-1*B;
                    W1 = W1 + LR*-1*X1(1,i); % Weight changes
                    W2 = W2 + LR*-1*X2(1,i); % We were expecting a negative output, but
                    W3 = W3 + LR*-1*X3(1,i); % we got a positive perceptron output. *(-1)
                end
            elseif P_output <= 0 % Negative perceptron output
                
                if Y(1,i) ~= -1 % Negative expective output Y
                    
                    W0 = W0 + LR*1*B;
                    W1 = W1 + LR*1*X1(1,i); % Weight changes
                    W2 = W2 + LR*1*X2(1,i); % We were expecting a positive output, but
                    W3 = W3 + LR*1*X3(1,i); % we got a negative perceptron output. *1
                end
            end
        end
        
        Wk_Plus1=[W0,W1,W2,W3]; % Wk_Plus1 gets updated with the new weights
        distance = Distance(Wk, Wk_Plus1);  % The distance between the old and the new
                                            % weights gets calculated
                                            
        if(distance < epsilon)  % End condition
            disp(Epoch_completed);  % Display of completed Epochs
            delete(p);      % Removing and updating the plane with the final weights
            p=Decision(W1,W2,W3,W0);
            return;
        else
            Wk = Wk_Plus1;  % The old weights get updated with the newer weights
        end
        
        Epoch = Epoch - 1;    % Epoch reduction after its completion
        Epoch_completed = Epoch_completed + 1;
        delete(p);      % Removing the plane at the end of the epoch, so that
    end                 % it will get refreshed with the new weights during the next epoch.
end