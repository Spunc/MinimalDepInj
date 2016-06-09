classdef SimpleClass < handle
%SIMPLECLASS is a demonstration class for MinimalDepInj.
%   It only has two properties of ordinary Matlab types and a
%   show()-function to display those properties.
%
% Author: Lasse Osterhagen

properties
    property1
    property2
end

methods

    function this = SimpleClass(config)
        this.property1 = config.property1;
        this.property2 = config.property2;
    end

    function show(this)
        % displays the properties.
        disp(this.property1);
        disp(this.property2);
    end

end
    
end

