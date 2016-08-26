% Test createObjArray.m

% Author: Lasse Osterhagen

%% Test 1: Simple object array
config.constructor = 'TestClassB';
config.param.simpleProp1 = {'a1', 'a2', 'a3'};
config.param.simpleProp2 = [11, 12, 13];
outArray = depInj.createObjMatrix(config);
assert(isa(outArray, 'TestClassB'));
assert(length(outArray) == 3);
for idx = 1:3
    assert(strcmp(outArray(idx).simpleProp1, config.param.simpleProp1(idx)));
    assert(outArray(idx).simpleProp2 == config.param.simpleProp2(idx));
end

%% Test 2: Hierarchical object array
config.constructor = 'TestClassA';
config.param.simpleProp1 = [1, 2];
config.param.testClassB = repmat(struct('method', 'TestClassB', ...
    'simpleProp1', 11, 'simpleProp2', 12), 1, 2);
config.param.testClassB(2).simpleProp1 = 21;
config.param.testClassB(2).simpleProp2 = 22;
outArray = depInj.createObjArray(config);
assert(isa(outArray, 'TestClassA'));
assert(length(outArray) == 2);
assert(outArray(1).testClassB.simpleProp1 == 11);
assert(outArray(1).testClassB.simpleProp2 == 12);
assert(outArray(2).testClassB.simpleProp1 == 21);
assert(outArray(2).testClassB.simpleProp2 == 22);

%% Test 3: Integration into createObjectFromTree
config.method = 'depInj.createObjArray';
config.constructor = 'TestClassB';
config.param.simpleProp1 = [11, 12];
config.param.simpleProp2 = [21, 22];
outArray = depInj.createObjFromTree(config);
assert(isa(outArray, 'TestClassB'));
assert(length(outArray) == 2);

%% Test 4: Using globals
config.method = 'depInj.createObjArray';
config.constructor = 'TestClassB';
config.param.simpleProp1 = [11, 12];
gl.simpleProp2 = 'global_prop2';
outArray = depInj.createObjFromTree(config, gl);
assert(outArray(1).simpleProp1 == 11);
assert(outArray(2).simpleProp1 == 12);
assert(strcmp(outArray(1).simpleProp2, gl.simpleProp2));
assert(strcmp(outArray(2).simpleProp2, gl.simpleProp2));
