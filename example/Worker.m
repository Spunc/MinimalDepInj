classdef Worker < handle
    
    properties
        workBehavior
    end
    
    methods
        
        function this = Worker(config)
            this.workBehavior = config.workBehavior;
        end
        
        function doWork(this)
            this.workBehavior.work()
        end
        
    end
    
end
