function filename = getfigname(prefix,usedate,usetime)
%GETFIGNAME
%
%   Created 20120814 JW
if exist('usedate')~=1
    usedate = true;
end
if exist('usetime')~=1
    usetime = true;
end

filename = prefix;
if usedate
    filename = [filename '_' datestr(now,'yyyymmdd')];
end
if usetime
    filename = [filename '_' datestr(now,'HHMMSS')];
end

filename = underscorify(filename);