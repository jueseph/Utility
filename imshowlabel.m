% displays labelmatrix as randomly colored objects
% created 1/5/2011 Jue Wang
function out = imshowlabel(im)
    rgb=label2rgb(im,'jet','k','shuffle');
    imshow(rgb)
end