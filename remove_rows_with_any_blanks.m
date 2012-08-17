function [cleaned,idx] = remove_rows_with_any_blanks(toclean, item)
% 20120126
% 20120307
% given a cell array toclean, removes rows containing any blank elements.
% if given a second argument, removes any rows containing that element.
% idx contains indexes of elements that were removed

cleaned = cell(size(toclean));
i=1;
n=size(toclean,1);
idx = [];

for r=1:size(toclean,1)
    % keep this row?
    keep = 1;
    for c=1:size(toclean,2)
        el = toclean{r,c};
        if nargin < 2
            % check if empty
            if isempty(el)
                keep = 0;
                break;
            end
        elseif nargin == 2
            if ischar(item) && strcmp(item,el)
                keep = 0;
                break;
            elseif item==el
                keep = 0;
                break;
            end 
        end
    end
    if keep
        cleaned(i,:)=toclean(r,:);
        i=i+1;
    else
        idx(end+1)=i;
        n=n-1;
    end
end
cleaned=cleaned(1:n,:);