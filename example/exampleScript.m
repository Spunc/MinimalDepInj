% Script that demonstates the usage of MinimalDepInj.

% Author: Lasse Osterhagen


%% Creating an instance of SimpleClass

% SimpleClass is a simple class that only has two properties of ordinary
% Matlab types.

% ----- Creating the configuration struct -----

% 1. The starting point for the object creation is the struct field
% 'method'. The value of 'method' is the name of the class (as char array)
% of which an instance should be created.
config.method = 'SimpleClass';

% 2. Next, we have to add struct fields for the object properties. The
% property names of 'SimpleClass' are: 'property1' and 'property2'. The
% values that are assigned to the struct fields will later be assigned to
% the object properties.
config.property1 = 1;
config.property2 = 'Hello!';

% The configuration struct is now complete. It can be saved to a .mat file
% to retrieve it later for object creation.

% ----- Creating an object from a configuration struct -----

% To create an object according to the construction plan described in the
% configuration struct, call 'depInj.createObjFromTree(config)', with
% config being the configuration struct.
obj = depInj.createObjFromTree(config);

% ----- Test the object -----
obj.show();

%% Creating a Worker object for singing

% Worker is a class that has a hierarchical structure. That means,
% properties of Worker are object instances that again will be created by
% dependency injection.
%
% The property 'workBehavior' must be an instance of the abstract class
% (interface) 'WorkBehavior'. We want 'workBehavior' to be an instance of
% 'Singing', which is an implementation for 'WorkBehavior'.

% ----- Creating the configuration struct -----

% 1. Creating the configuration struct for 'Singing':
singingConfig.method = 'Singing';
singingConfig.songTitle = 'Greensleeves'; % songTitle is a property of Singing

% 2. Creating the configuration struct for 'Worker':
config.method = 'Worker';
% Assign the configuration struct for 'Gardening' to the property
% 'workBehavior':
config.workBehavior = singingConfig;

% Alternatively, you can create the configuration struct in one go:
config.method = 'Worker';
config.workBehavior.method = 'Singing';
config.workBehavior.songTitle = 'Greensleeves';

% ----- Creating an object from a configuration struct -----

vocalist = depInj.createObjFromTree(config);

% ----- Test the object -----

vocalist.doWork();

%% Creating a Worker object for gardening

% Now, we create a Worker object with the property 'workBehavior' being an
% instance of 'Gardening'. The configuration struct was created analogous
% to what has been shown above. It was then saved to the file
% 'configGardenern.mat'.

% 1. Load configuration struct into workspace
load configGardener; % variable name is 'config'

% 2. Create Worker object by dependency injection
worker = depInj.createObjFromTree(config);

% 3. Call method on Worker object
worker.doWork();
