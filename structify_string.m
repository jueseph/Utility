% converts arbitrary string to one valid for use as a struct field
function out = structify_string(s)
    out = strrep(s, '-', '_');
    out = strrep(out, ' ', '_');
    if regexp(out,'^\d')
        out = ['_' out];
    end
end