%% 20111213
function tokeep = which_cells_to_keep(rplast, rpcurr, maxdist)
    % match current cells against those in previous frame
    tokeep = [];
    for i=1:length(rpcurr)
        % pick a cell in current frame
        cen=rpcurr(i).Centroid;
        % are we close to a cell in a previous frame?
        foundmatch = 0;
        for j=1:length(rplast)
            if pdist([cen; rplast(j).Centroid]) > maxdist
                % don't do anything and keep looking
            else
                % we are close; this means the same cell was segmented in
                % both frames
                foundmatch=1;
                break;
            end
        end
        
        % this cell was segmented in both frames; keep it
        if foundmatch
            tokeep(end+1) = i;
        end
    end
end