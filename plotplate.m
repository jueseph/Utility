function [fh ah] = plotplate(plate,plotfunc,varargin)
%PLOTPLATE makes a 8x12 grid of plots. 
% 
% 20120821
p = inputParser;
addRequired(p,'plate',@isstruct);
addRequired(p,'plotfunc',@(x) isa(x,'function_handle'));
addOptional(p,'rowrange',1:8,@isnumeric);
addOptional(p,'colrange',1:12,@isnumeric);
addParamValue(p,'xlimits','',@isnumeric);
addParamValue(p,'ylimits','',@isnumeric);
addParamValue(p,'fixaxes',true,@islogical);

parse(p,plate,plotfunc,varargin{:});
plate = p.Results.plate;
plotfunc = p.Results.plotfunc;
rowrange = p.Results.rowrange;
colrange = p.Results.colrange;
xlimits = p.Results.xlimits;
ylimits = p.Results.ylimits;
fixaxes = p.Results.fixaxes;

% fullscreen on dell 24" monitor
fwidth = 1920;
fheight = 1200;

fh = figure('position',[0 0 fwidth fheight]);

% hmarg = [.07 .03];
% vmarg = [.02 .01];
% hgap = .02;
% vgap = .025;

wmarg = [50 10];
hmarg = [60 10];
wgap = 25;
hgap = 25;

ah = tight_subplot(8,12,[hgap wgap],hmarg,wmarg,'pixels');

stdxlim = [];
stdylim = [];
% each well gets a plot
for r=rowrange
    for c=colrange
        idx = 12*(r-1)+c;
        axes(ah(idx));
        
        % get data
        data = plate.data{r,c};
        if ~isempty(data)
            plotfunc(data,r,c);
            if ~isempty(xlimits),   xlim(xlimits),  end
            if ~isempty(ylimits),   ylim(ylimits),  end
        end
    end
end
