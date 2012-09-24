function newdata = rotateplatedata(platedata)
%20120919
newdata = cell(8,12);
for r=1:8
    for c=1:12
        newr = 8-r+1;
        newc = 12-c+1;
        newdata{newr,newc} = platedata{r,c};
    end
end