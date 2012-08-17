% creates a lookup table using strings from first column of cell array,
% indexing data from second column of cell array
function out = construct_lookupstruct(cellarray)
    out = struct;
    for i=1:length(cellarray)
        key = genvarname(cellarray{i,1});
        out.(key) = cellarray{i,2};
    end
end