classdef Singing < WorkBehavior
    
    properties
        songTitle
    end
    
    methods
        
        function this = Singing(config)
            this.songTitle = config.songTitle;
        end
        
        function work(this)
            disp(['Singing the song: ''', this.songTitle, '''.']);
        end
    end
    
end
