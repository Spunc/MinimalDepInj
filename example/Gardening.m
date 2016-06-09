classdef Gardening < WorkBehavior
%GARDENING is part of the MinimalDepInj example.
%   It implements the WorkBehavior interface.

% Author: Lasse Osterhagen

methods

    function this = Gardening(~)
    end

    function work(~)
        disp('Mowing the lawn.');
    end

end
    
end
