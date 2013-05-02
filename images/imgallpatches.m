function [data, pos] = imgallpatches(img, patchsize, tiling)
%imgallpatches Generate all patches from an image
%   (c) Christian Kellner <kellner@bio.lmu.de>
%       License: BSD-3 clause

if ~exist('tiling', 'var'); tiling = 1; end

[m, n, c] = size (img);

sm = gen_coords(m, patchsize, tiling);
sn = gen_coords(n, patchsize, tiling);

cm = repmat(sm, 1, length(sn));
cn = sort(repmat(sn, 1, length(sm)));

pos = [cm; cn];

samplesize = patchsize^2 * c;
npats = length(pos);
data = zeros (samplesize, npats);

for k=1:npats
  rm = pos(1,k):pos(1,k)+patchsize-1;
  rn = pos(2,k):pos(2,k)+patchsize-1;
  
  patch = img(rm, rn, :);
  data(:,k) = reshape (patch, samplesize, 1);
end

end


function [y] = gen_coords(x, patchsize, tiling)

r = mod(x, tiling) - (patchsize - 1);
x = x + r * (r < 1);
y = 1:tiling:x;

end
