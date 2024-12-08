
function max_value = knapsack0_1(values, weights, W, n)
    dp = zeros(n+1, W+1);

    
    for i = 1:n
        for w = 0:W
            if weights(i) <= w then
                dp(i+1, w+1) = max(dp(i, w+1), dp(i, w - weights(i) + 1) + values(i));
            else
                dp(i+1, w+1) = dp(i, w+1);  // If the item is too heavy, don't include it
            end
        end
    end

    max_value = dp(n+1, W+1);
endfunction


values = [60, 100, 120];  
weights = [10, 20, 30];   
W = 50;                   
n = length(values);     

max_value = knapsack0_1(values, weights, W, n);
disp("Maximum value in the knapsack:");
disp(max_value);
