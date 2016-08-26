% Test createObjMatrix.m

% Author: Lasse Osterhagen

%% Test 1: Simple object matrix
config.constructor = 'TestClassB';
config.param.simpleProp1 = {'a1', 'a2', 'a3'};
config.param.simpleProp2 = [11, 12, 13];
outMatrix = depInj.createObjMatrix(config);
assert(isa(outMatrix, 'TestClassB'));
assert(length(outMatrix) == 3);
for idx = 1:3
    assert(strcmp(outMatrix(idx).simpleProp1, config.param.simpleProp1(idx)));
    assert(outMatrix(idx).simpleProp2 == config.param.simpleProp2(idx));
end

%% Test 2: Hierarchical object matrix
config.constructor = 'TestClassA';
config.param.simpleProp1 = [1, 2];
config.param.testClassB = repmat(struct('method', 'TestClassB', ...
    'simpleProp1', 11, 'simpleProp2', 12), 1, 2);
config.param.testClassB(2).simpleProp1 = 21;
config.param.testClassB(2).simpleProp2 = 22;
outMatrix = depInj.createObjMatrix(config);
assert(isa(outMatrix, 'TestClassA'));
assert(length(outMatrix) == 2);
assert(outMatrix(1).testClassB.simpleProp1 == 11);
assert(outMatrix(1).testClassB.simpleProp2 == 12);
assert(outMatrix(2).testClassB.simpleProp1 == 21);
assert(outMatrix(2).testClassB.simpleProp2 == 22);

%% Test 3: Integration into createObjectFromTree
config.method = 'depInj.createObjMatrix';
config.constructor = 'TestClassB';
config.param.simpleProp1 = [11, 12];
config.param.simpleProp2 = [21, 22];
outMatrix = depInj.createObjFromTree(config);
assert(isa(outMatrix, 'TestClassB'));
assert(length(outMatrix) == 2);

%% Test 4: Using globals
config.method = 'depInj.createObjMatrix';
config.constructor = 'TestClassB';
config.param.simpleProp1 = [11, 12];
gl.simpleProp2 = 'global_prop2';
outMatrix = depInj.createObjFromTree(config, gl);
assert(outMatrix(1).simpleProp1 == 11);
assert(outMatrix(2).simpleProp1 == 12);
assert(strcmp(outMatrix(1).simpleProp2, gl.simpleProp2));
assert(strcmp(outMatrix(2).simpleProp2, gl.simpleProp2));
