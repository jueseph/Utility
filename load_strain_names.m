function strnames = load_strain_names(csvfn)
% load strain names for a 96w plate
% JW 20120130
strnames=csv2cell(csvfn);
if size(strnames,1)<8 || size(strnames,2)<12
    strnames{8,12}='';
end
strnames=strnames(1:8,1:12);