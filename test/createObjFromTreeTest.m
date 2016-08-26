% Test createObjFromTreeTest.m

% Author: Lasse Osterhagen

% Set up for tests 1 to 3

% Create TestClassB config template
classBConf.method = 'TestClassB';
classBConf.simpleProp1 = 'B_simpleProp1';
classBConf.simpleProp2 = 'B_simpleProp2';

% Create TestClassA config template
treeConf.method = 'TestClassA';
treeConf.simpleProp1 = 'A_simpleProp1';
treeConf.testClassB = classBConf;

% Create TestClassA object by dependency injection
testClassA = depInj.createObjFromTree(treeConf);

%% Test 1: Layer 1 simple properties
assert(strcmp(testClassA.simpleProp1, treeConf.simpleProp1));

%% Test 2: Layer 2 class properties
assert(isa(testClassA.testClassB, 'TestClassB'));

%% Test 3: Layer 2 simple properties
assert(strcmp(testClassA.testClassB.simpleProp1, classBConf.simpleProp1));
assert(strcmp(testClassA.testClassB.simpleProp2, classBConf.simpleProp2));

%% Test 4 Layer 1 with global properties
% Create class config template with a missing property field
classBC = rmfield(classBConf, 'simpleProp2');
% Create a global config template with the missing property field
gl.simpleProp2 = 'global_simpleProp2';
testClassB = depInj.createObjFromTree(classBC, gl);
assert(strcmp(testClassB.simpleProp1, classBC.simpleProp1));
assert(strcmp(testClassB.simpleProp2, gl.simpleProp2));

%% Test 5: Layer 2 with global properties
% Create individual class config templates
classBC.method = 'TestClassB';
classBC.simpleProp2 = 'B_simpleProp2';
treeC.method = 'TestClassA';
treeC.testClassB = classBC;
% Create global config template
gl.simpleProp1 = 'global_simpleProp1';
% Create object
testClassA = depInj.createObjFromTree(treeC, gl);
assert(strcmp(testClassA.simpleProp1, gl.simpleProp1));
assert(strcmp(testClassA.testClassB.simpleProp1, gl.simpleProp1));

%% Test 6: Overwrite global properties
% Create class config template with missing property field at first layer
treeC = rmfield(treeConf, 'simpleProp1');
% Create globel config template
gl.simpleProp1 = 'global_simpleProp1';
testClassA = depInj.createObjFromTree(treeC, gl);
assert(strcmp(testClassA.simpleProp1, gl.simpleProp1));
assert(strcmp(testClassA.testClassB.simpleProp1, treeC.testClassB.simpleProp1));
