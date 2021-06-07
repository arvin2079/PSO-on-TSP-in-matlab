function res = subtract(node_sequence1, node_sequence2)
    res = [];
    for i=1:length(node_sequence1)
        for j=i:length(node_sequence1)
            if node_sequence2(i) == node_sequence1(j) && i ~= j
                res = [res, [i; j]];
                node_sequence1 = swap(node_sequence1, res(:, end));
            end
        end
    end
end