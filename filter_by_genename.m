function filtered = filter_by_genename(tofilter, genenames)
% 20120126 
% filters the rows of a cell array tofilter so that only genes that appear 
% in the list genenames remain
% assumes that the first column of tofilter contains strings representing
% gene names

filtered = cell(size(tofilter));
n=size(tofilter,1);
i=1;

for r=1:size(tofilter,1)
    name = tofilter{r,1};  
    % search through name list
    found=0;
    for j=1:length(genenames)
        if strcmp(name,genenames{j})
            found=1;
            break;
        end
    end
    
    if found
        filtered(i,:)=tofilter(r,:);
        i=i+1;
    else
        n=n-1;
    end
end
filtered=filtered(1:n,:);