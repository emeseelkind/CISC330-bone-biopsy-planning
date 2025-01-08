%{ 
Task: Reconstruct the best-fitting snug inner sphere from a set of contour points. Explain your
approach in text or in comments.
• Input: [points-in] as points on the tumor’s contour
• Output: [C, R] as center point and radius.
%}


function [C, R] = best_fitting_inner_sphere(points_in)
    A = [points_in, ones(size(points_in, 1), 1)];
    b = sum(points_in.^2, 2);
    
    % Solve the normal equations to find the sphere parameters
    x = A \ b;
    % The center of the sphere
    C = 0.5 * x(1:3)';
    % The radius of the sphere
    R = sqrt(sum(C.^2) + x(4));
    

end
