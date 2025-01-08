%{
Task: Develop module to compute the intersection(s) of line and sphere
• Input:
o [P, v] – Line defined by fixed point and direction vector
o [C,R] – Sphere defined by center and radius
• Output:
o Number of Intersections
o P1 – intersection 1
o P2 – intersection 2
%}
function [numIntersections, P1, P2] = intersect_line_and_sphere(P, v, C, R)
    P_to_C = P - C;
    a = dot(v, v); 
    b = 2 * dot(v, P_to_C); 
    c = dot(P_to_C, P_to_C) - R^2; 
    discriminant = b^2 - 4*a*c;
    P1 = [];
    P2 = [];
    if discriminant < 0
        numIntersections = 0;
    % find the intersection P1
    elseif discriminant == 0
        numIntersections = 1;
        t = -b / (2*a);
        P1 = P + t * v;
    else
        numIntersections = 2;
        % find the intersections
        t1 = (-b + sqrt(discriminant)) / (2*a);
        t2 = (-b - sqrt(discriminant)) / (2*a);
        P1 = P + t1 * v;
        P2 = P + t2 * v;
    end
end