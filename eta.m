function out = eta(data)
    out = var(data) / mean(data)^2;
end