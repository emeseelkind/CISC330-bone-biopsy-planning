%{
Task: Develop software to compute the salient parameters of the current biopsy plan. A
ssume that we modelled tumor with a sphere. 
The plan is to insert the needle along its current trajectory. 
Compute the following for the physician’s consideration:
o Targeting error, as distance of the needle axis from the tumor center
o Maximum length of the tissue core that we could harvest from the tumor.
o Required needle insertion depth for harvesting this tissue core.
• Input:
o [Cin, Rin] – center and radius of the tumor model in CT frame
o [Pct, vct] – Needle tip position and needle direction vector in CT frame
• Output:
o Targeting Error
o MaxLengthOfTissueCore
o NeedleInsertionDepth
%}

function [TargetingError, MaxLengthOfTissueCore, NeedleInsertionDepth] = evaluate_biopsy_plan(Cin, Rin, Pct, vct)
    vct = vct / norm(vct);
    
    % Compute targeting error (distance from line to tumor center)
    diffVec = Cin - Pct;
    crossProd = cross(vct, diffVec);
    TargetingError = norm(crossProd) / norm(vct);
    
    % Check if needle intersects the tumor
    if TargetingError > Rin
        MaxLengthOfTissueCore = 0;
        % No intersection
        NeedleInsertionDepth = NaN;  
    else
        % Compute max length of tissue core (chord length)
        MaxLengthOfTissueCore = 2 * sqrt(Rin^2 - TargetingError^2);
        % Projection of tumor center onto needle axis
        projection = dot(diffVec, vct);  
        insertionDepthAtEntry = sqrt(Rin^2 - TargetingError^2);
        NeedleInsertionDepth = projection - insertionDepthAtEntry;
    end
end