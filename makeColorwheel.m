function colorwheel = makeColorwheel()
%   color encoding scheme
%   adapted from the color circle idea described at
%   http://members.shaw.ca/quadibloc/other/colint.htm
RY = 15;
YG = 6;
GC = 4;
CB = 11;
BM = 13;
MR = 6;

ncols = RY + YG + GC + CB + BM + MR;
colorwheel = zeros(ncols, 3); % r g b
col = 0;
%RY
colorwheel(1:RY, 1) = 255;
colorwheel(1:RY, 2) = floor(255*(0:RY-1)/RY);
col = col+RY;
%YG
colorwheel(col+(1:YG), 1) = 255 - floor(255*(0:YG-1)/YG);
colorwheel(col+(1:YG), 2) = 255;
col = col+YG;
%GC
colorwheel(col+(1:GC), 2) = 255;
colorwheel(col+(1:GC), 3) = floor(255*(0:GC-1)/GC);
col = col+GC;
colorwheel(col+(1:CB), 2) = 255 - floor(255*(0:CB-1)/CB);
colorwheel(col+(1:CB), 3) = 255;
col = col+CB;
%BM
colorwheel(col+(1:BM), 3) = 255;
colorwheel(col+(1:BM), 1) = floor(255*(0:BM-1)/BM);
col = col+BM;
%MR
colorwheel(col+(1:MR), 3) = 255 - floor(255*(0:MR-1)/MR);
colorwheel(col+(1:MR), 1) = 255;
end