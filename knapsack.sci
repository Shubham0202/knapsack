
function [total_value, selected_items] = knapsackGreedy(weights, values, capacity, n)
    ratio = values ./ weights;  
      [sorted_ratios, indices] = gsort(ratio, "d"); 
    sorted_weights = weights(indices);
    sorted_values = values(indices);
    total_value = 0;  
    selected_items = zeros(1, n);  (1 if selected)
    remaining_capacity = capacity;  
    for i = 1:n
        if sorted_weights(i) <= remaining_capacity then
            remaining_capacity = remaining_capacity - sorted_weights(i);
            total_value = total_value + sorted_values(i);
            selected_items(indices(i)) = 1;  
        else
            fraction = remaining_capacity / sorted_weights(i);
            total_value = total_value + sorted_values(i) * fraction;
            selected_items(indices(i)) = fraction; 
            break;  
        end
    end
endfunction
weights = [10, 20, 30];  
values = [60, 100, 120]; 
capacity = 50;  
n = length(weights); 
[total_value, selected_items] = knapsackGreedy(weights, values, capacity, n);
disp("Total value of selected items:");
disp(total_value);
disp("Selection of items (1 for fully selected, fraction for partially selected, 0 for not selected):");
disp(selected_items);