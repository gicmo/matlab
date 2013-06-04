function [ rev ] = getCurRev ()
%GETCURREV get the current git revision
%   (c) Christian Kellner <kellner@bio.lmu.de>
%       License: BSD-3 clause

if exist ('.git', 'dir') ~= 7
  rev = 'Not a git checkout';
  return;
end

fd = fopen (fullfile ('.git', 'HEAD'));
curbranch = textscan (fd, '%s');
path = char (curbranch{1}(2));
rev = fileread (fullfile ('.git', path));
fclose (fd);

end

