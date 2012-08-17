% doubling time
% jue 20110427
% t in minutes
function out = doubling_time(OD1,t1,OD2,t2)
    out = (t2-t1)./(log2(OD2)-log2(OD1));
end