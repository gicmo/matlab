function [S] = setfield_idx (S, key, value, idx)
%setfield_idx set a field in a struct at a given position
%   (c) Christian Kellner <kellner@bio.lmu.de>
%       License: BSD-3 clause

S.(key) = value;

if ischar(idx)
  idx = findfield(S, idx) + 1;
end

cols =1:length(fieldnames (S)); 
S = orderfields (S, [cols(1:idx-1), cols(end), cols(idx:end-1)]);

end

function [idx] = findfield(S, name)

idx = 0;
fields = fieldnames (S);

for n = 1:length(fields)
  if strcmpi (fields(n), name)
    idx = n;
    break;
  end
end

end