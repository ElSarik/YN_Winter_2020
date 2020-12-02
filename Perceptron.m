%% Sarikakis Ilias - Ioannis AM:1428
%%
function p = Perceptron(X1,X2,X3,Y)
    W0 = 0.2;
    W1 = 1;     % Weights initialization with randomly selected values.
    W2 = 0.6;
    W3 = 1.1;
    
    B = 1;
    LR = 0.3; 	% Bias, Learning Rate, and maximum number of Epochs initialization
    Epoch = 100;
    
    no_change = 0; % no_change is a counter that shows how many patterns
                    % have been correctly classified (without weight changes).
                    % The counter is being used as a condition to end the
                    % algorithm once every pattern has been classified.
%% Perceptron Algorithm
    while ((Epoch ~= 0) && (no_change < size(Y,2))) % Algorithm ends once we have run out of Epochs
                                                     % or there has been no change on the pattern weights
                                                     
        p=Decision(W1,W2,W3,W0);    % Calling the Decision function with
                                    % the current weights to create a plane.
                                    
        for i=1:size(Y,2)   % Algorithm execution for every pattern
            P_output = B*W0 + X1(1,i)*W1 + X2(1,i)*W2 + X3(1,i)*W3; % Perceptron output based on the current weights
            if P_output > 0    % Positive perceptron output
                
                if Y(1,i) == 1          % Positive expective output Y
                    no_change = no_change + 1;  % No weight changes - increase counter
                    
                else                    % Negative expective output Y
                    no_change = 0;          % Counter Reset
                    W0 = W0 + LR*-1*B;
                    W1 = W1 + LR*-1*X1(1,i); % Weight changes
                    W2 = W2 + LR*-1*X2(1,i); % We were expecting a negative output, but
                    W3 = W3 + LR*-1*X3(1,i); % we got a positive perceptron output. *(-1)
                end
            elseif P_output <= 0 % Negative perceptron output
                
                if Y(1,i) == -1         % Negative expected output Y
                    no_change = no_change + 1;  % No weight changes - increase counter
                
                else                    % Positive expective output Y
                    no_change = 0;          % Counter Reset
                    W0 = W0 + LR*1*B;
                    W1 = W1 + LR*1*X1(1,i); % Weight changes
                    W2 = W2 + LR*1*X2(1,i); % We were expecting a positive output, but
                    W3 = W3 + LR*1*X3(1,i); % we got a negative perceptron output. *1
                end
            end
        end
        Epoch = Epoch - 1;    % Epoch reduction after its completion
        delete(p);      % Removing the plane at the end of the epoch, so that
    end                 % it will get refreshed with the new weights during the next epoch.
    
    p=Decision(W1,W2,W3,W0);    % Plot of the final boundary plane, based on the final weights. 
end