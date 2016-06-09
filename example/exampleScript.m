%% Create a Worker object for gardening

% loads variable 'config' into workspace
load configGardener;
% create Worker object by dependency injection
worker = depInj.createObjFromTree(config);
% call method on Worker object
worker.doWork();

%% Create a Worker object for singing
% loads variable 'config' into workspace
load configSinger;
% create Worker object by dependency injection
worker = depInj.createObjFromTree(config);
% call method on Worker object
worker.doWork();
