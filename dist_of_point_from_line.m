%{
Task: Develop module to compute the distance of a point from a line
• Input:
o A – point
o [P, v] – Line defined by fixed point and direction vector
• Output:
o Distance
%}

function distance = dist_of_point_from_line(A, P, v)
    x1 = A(1);
    y1 = A(2);
    x2 = P(1);
    y2 = P(2);
    vx = v(1);
    vy = v(2);
    % Compute the normal vector to the line
    normal = [-vy, vx]; 
    PA = [x1 - x2, y1 - y2];
    distance = abs(dot(PA, normal)) / norm(v);
end
