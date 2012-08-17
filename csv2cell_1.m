%% 20110727
% 20120224 updated to take arbitrary delimiters
% 20120413 fix number conversion with multi-number-containing strings
% TODO: don't parse delimiters in between quotes
function table = csv2cell(fn,delim)

    if nargin < 2
        delim = ',';
    end
    
    inf = fopen(fn,'r');
    table = cell(100,100);
    nrows = 0;
    ncols = 0;
    
    while ~feof(inf)
        line = fgetl(inf);
        nrows = nrows + 1;
        if nrows > size(table,1)
            % double row capacity
            newtable = cell([2 1].*size(table));
            newtable(1:size(table,1),1:size(table,2)) = table(:,:);
            table = newtable;
        end
        tokens = regexp(line,delim,'split');
        ncols = max(ncols,length(tokens));
        while ncols > size(table,2)
            % double column capacity
            newtable = cell([1 2].*size(table));
            newtable(1:size(table,1),1:size(table,2)) = table(:,:);
            table = newtable;
        end
        for i = 1:length(tokens)
            token = tokens{i};
            num = str2double(token);
            if isempty(num) || isnan(num)
                % store as string
                table{nrows,i} = token;
            else
                table{nrows,i} = num;
            end 
        end
    end
    table = table(1:nrows,1:ncols);
    fclose(inf);
end