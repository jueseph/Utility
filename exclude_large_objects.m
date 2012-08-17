% removes objects larger than a threshold from binary image
function bwout = exclude_large_objects(bw,thresh,conn)
    if ~exist('conn')
        conn=4;
    end
    %Get connected objects
    CC = bwconncomp(bw, conn);

    %Compute the area of each component:
    S = regionprops(CC, 'Area');

    %Remove large objects:
    bwout = ismember(L, find([S.Area] >= P));
end