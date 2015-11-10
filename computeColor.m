function img = computeColor(u,v)

nanIdx = isnan(u) | isnan(v);
u(nanIdx) = 0;
v(nanIdx) = 0;
colorwheel = makeColorwheel();
ncols = size(colorwheel, 1);
rad = sqrt(u.^2+v.^2);         
a = atan2(-v, -u)/pi;
fk = (a+1) /2 * (ncols-1) + 1;  % -1~1 maped to 1~ncols
k0 = floor(fk);                 % 1, 2, ..., ncols
k1 = k0+1;
k1(k1==ncols+1) = 1;
f = fk - k0;

for i = 1:size(colorwheel,2)
    tmp = colorwheel(:,i);
    col0 = tmp(k0)/255;
    col1 = tmp(k1)/255;
    col = (1-f).*col0 + f.*col1;  
    idx = rad <= 1;  
    col(idx) = 1-rad(idx).*(1-col(idx));    % increase saturation with radius
    col(~idx) = col(~idx)*0.75;             % out of range
    img(:,:, i) = uint8(floor(255*col.*(1-nanIdx)));        
end
end