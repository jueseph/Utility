% returns a cell array of the names of subfolders of path
% created 12/15/2010
function out = subfolder_names(path)
    nodes = dir(path);
    out = cell(length(nodes),1);
    i=3;    % exclude . and ..
    j=1;
    while i<=length(nodes)
        if nodes(i).isdir
            out{j} = nodes(i).name;
            j = j+1;
        end
        i = i+1;
    end
    out = out(1:j-1,1);
end
    