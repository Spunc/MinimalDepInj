function objArray = createObjArray(s)
%CREATEOBJARRAY creates an array of objects of a single class.
%   Use this class in the dependency injection framework
%   (depInj.createObjFromTree()).
%   For the method field, write 'depInj.createObjArray'. Another field
%   named 'constructor' contains the constructor method for all objects. A
%   third field named 'param' contains a struct with field names
%   corresponding to the parameters needed for object creation. The values
%   of the struct are matrices of the same size as the target (output)
%   matrix, containing the values for the objects.
%
%   Examples of a root struct for an objectArray:
%   config.method = 'depInj.createObjArray';
%   config.constructor = 'SomeClassConstructor';
%   config.param.param1 = [1 2; 3 4];
%   config.param.param2 = {'val1', 'val2'; 'val3', 'val4'};

% Author: Lasse Osterhagen

% Validate arguments
assert(isstruct(s), 'createObjArray:InvalidFormat', ...
    'Array of objects template must be a struct.');
assert(isfield(s, 'constructor'), 'createObjArray:InvalidFormat', ...
    'Array of objects template must have a field named constructor.');
assert(isfield(s, 'param'), 'createObjArray:InvalidFormat', ...
    'Array of objects template must have a field named param.');
assert(isstruct(s.param), 'createObjArray:InvalidFormat', ...
    'The field param must be a struct');
param = s.param;
paramCell = struct2cell(param);
assert(all(cellfun(@isvector, paramCell)), ...
    'createObjArray:InvalidFormat', ...
    'All param values must be vectors.');
outLen = length(paramCell{1});
assert(all(cellfun(@(x) isequal(length(x), outLen), paramCell)), ...
    'createObjArray:InvalidFormat', ...
    'Sizes of all param arrays must be the same.');

objArray(outLen) = eval(s.constructor);
fns = fieldnames(param);
for objIdx = 1:numel(objArray)
    config = struct('method', s.constructor);
    for fieldIdx=1:length(fns)
        fn = fns{fieldIdx};
        config.(fn) = param.(fn)(objIdx);
    end
    objArray(objIdx) = depInj.createObjFromTree(config);
end
