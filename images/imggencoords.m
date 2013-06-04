function [coords] = imggencoords(m, n, patchsize, tiling)
%imgallpatches Generate all coordinates from an image
%   (c) Christian Kellner <kellner@bio.lmu.de>
%       License: BSD-3 clause

if ~exist('tiling', 'var'); tiling = 1; end


sm = gen_coords(m, patchsize, tiling);
sn = gen_coords(n, patchsize, tiling);

cm = repmat(sm, 1, length(sn));
cn = sort(repmat(sn, 1, length(sm)));

coords = [cm; cn];
end

function [y] = gen_coords(x, patchsize, tiling)

r = mod(x, tiling) - (patchsize - 1);
x = x + r * (r < 1);
y = 1:tiling:x;

end