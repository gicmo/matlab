function [data, pos] = imgallpatches(img, patchsize, tiling)
%imgallpatches Generate all patches from an image
%   (c) Christian Kellner <kellner@bio.lmu.de>
%       License: BSD-3 clause

if ~exist('tiling', 'var'); tiling = 1; end

[m, n, c] = size (img);
pos = imggencoords(m, n, patchsize, tiling);
npats = length(pos);

samplesize = patchsize^2 * c;
data = zeros (samplesize, npats);

for k=1:npats
  rm = pos(1,k):pos(1,k)+patchsize-1;
  rn = pos(2,k):pos(2,k)+patchsize-1;
  
  patch = img(rm, rn, :);
  data(:,k) = reshape (patch, samplesize, 1);
end

end

