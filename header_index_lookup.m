% turns a cell array into a struct indexing values of the array into its
% indices. helpful for searching arrays by header row/column
% jue 20110309
function out = header_index_lookup(header)
    out = struct;
    for i=1:length(header)
        out.(genvarname(header{i})) = i;
    end
end
