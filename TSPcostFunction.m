function cost = TSPcostFunction(node_sequence, node_positions)
    cost = 0;
    for i = 1:length(node_sequence) - 1
        cost = cost + measureDist(node_positions(node_sequence(i), :), ...
            node_positions(node_sequence(i + 1), :));
    end

end

function dist = measureDist(a, b)
    dist = sqrt((a(1) - b(1))^2 + (a(2) - b(2))^2);
end