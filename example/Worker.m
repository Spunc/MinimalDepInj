classdef Worker < handle
%WORKER is a demonstration class for MinimalDepInj.

% Author: Lasse Osterhagen
    
properties
    workBehavior % instance of WorkBehavior
end

methods

    function this = Worker(config)
        % To allow a class being used within the dependency injection
        % framework, it must define a constructor with a single struct
        % argument.
        
        % Parameters that have to be assigned to properties during object
        % construction, can be found within the config struct under the
        % field name that is the same as the name of the property.
        this.workBehavior = config.workBehavior;
    end

    function doWork(this)
        %DOWORK displays a working message for testing purposes.
        this.workBehavior.work()
    end

end
    
end
