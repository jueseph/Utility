function out = jue_colorgradient(c, n, cmax)
    % progressively lighten
    out = repmat(c,n,1) + repmat(linspace(0,cmax,n)',1,3) .* repmat(~c,n,1);
end