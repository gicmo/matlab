function [idx] = findfield(S, name)
%findfield get the position of a field with a given name in a struct
%   (c) Christian Kellner <kellner@bio.lmu.de>
%       License: BSD-3 clause

idx = 0;
fields = fieldnames (S);

for n = 1:length(fields)
  if strcmpi (fields(n), name)
    idx = n;
    break;
  end
end

end