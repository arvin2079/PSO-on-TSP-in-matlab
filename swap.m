function res = swap(node_sequence, swap)
    temp = node_sequence(swap(1));
    node_sequence(swap(1)) = node_sequence(swap(2));
    node_sequence(swap(2)) = temp;
    res = node_sequence;
    clear temp;
end
