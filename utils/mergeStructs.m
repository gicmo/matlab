function [ base ] = mergeStructs(base, override)
%mergeStructs merge structs override into the base struct
%   (c) Christian Kellner <kellner@bio.lmu.de>
%       License: BSD-3 clause

keys = fieldnames (override);

for n = 1:length(keys)
  key = char (keys(n));
  
  if isfield (base, key) && isempty (override.(key))
      base = rmfield(base, key);
  elseif isfield (base, key) && isstruct (override.(key))
      base.(key) = mergeStructs(base.(key), override.(key));  
  else
      base.(key) = override.(key);
  end
   
end

end

