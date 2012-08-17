function [results,idx] = search_gene_data2(genenames, data, cols)
% 20120224 
% 20120320
% retrieves data about a list of genes from a table whose first column
% contains gene names (i.e. PHO84); returns results in the same order as
% the original gene list

% TODO: debug: blank row gets returned when gene doesn't match
if nargin < 3
    results = cell(length(genenames),size(data,2)-1);
else
    results = cell(length(genenames),length(cols));
end

idx = [];
for r=1:length(genenames)
    for i=1:length(data)
        if strcmp(data{i,1},genenames{r})
            % found match
            if nargin < 3
                results(r,:) = data(i,2:end);
            else
                results(r,:) = data(i,cols);
            end
            idx(r) = i;
            break;
        end
    end
end