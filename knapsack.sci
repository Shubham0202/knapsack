function knapsack_greedy(weights, values, capacity)
    n = length(weights);
    ratios = values ./ weights;
    [ratios, indices] = gsort(ratios, 'r');  // Corrected sorting argument
    
    total_value = 0;
    total_weight = 0;
    selected_items = zeros(1, n);
    
    for i = 1:n
        if total_weight + weights(indices(i)) <= capacity then
            total_weight = total_weight + weights(indices(i));
            total_value = total_value + values(indices(i));
            selected_items(indices(i)) = 1;
        else
            break;
        end
    end
    
    disp("Selected items: " + string(find(selected_items == 1)));
    disp("Total value: " + string(total_value));
    disp("Total weight: " + string(total_weight));
endfunction

weights = [10, 20, 30];
values = [60, 100, 120];
capacity = 50;
knapsack_greedy(weights, values, capacity);
