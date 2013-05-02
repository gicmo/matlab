function [ W ] = whiten_filter (data)
%whiten_filter create a whitening filter (ZCA) for the input data
%   rows of data are observations
%
% cf. A. J. Bell, T. J. Sejnowski, Vision Res. 37, 3327?3338 (1997).
%   (c) Christian Kellner <kellner@bio.lmu.de>
%       License: BSD-3 clause

X = bsxfun(@minus, data, mean(data, 2));

[~, nelm] = size(data);
C = (X*X')/(nelm-1);
[E, D] = eig(C);

W = E * diag(1./(diag(D)).^(1/2)) * E';

end

