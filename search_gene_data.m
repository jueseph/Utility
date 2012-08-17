function results = search_gene_data(genenames, data, cols)
% 20120126

% retrieves data about a list of genes from a table whose first column
% contains gene names (systematic); returns results in the same order as
% the original gene list

if nargin < 3
    results = cell(length(genenames),size(data,2)-1);
else
    results = cell(length(genenames),length(cols));
end

for r=1:length(genenames)
    for i=1:length(data)
        if strcmp(data{i,1},genenames{r})
            % found match
            if nargin < 3
                results(r,:) = data(i,2:end);
            else
                results(r,:) = data(i,cols);
            end
            break;
        end
    end
end