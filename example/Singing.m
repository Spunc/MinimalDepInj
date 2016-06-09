classdef Singing < WorkBehavior
%SINGING is part of the MinimalDepInj example.
%   It implements the WorkBehavior interface.

% Author: Lasse Osterhagen

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
