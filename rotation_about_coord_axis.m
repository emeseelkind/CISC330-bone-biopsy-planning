%{
Task: Generate a transformation matrix to rotate a point about a principal coordinate axis (x, y, or z
axis) by a given rotation angle.
• Input: axis (for ‘x’, ‘y’, or ‘z’), rotation angle
• Output: Homogeneous rotation matrix (4x4)
%}

function homogeneous_transformation_matrix = rotation_about_coord_axis(axis, angle)
    if axis == 'x'
        homogeneous_transformation_matrix = [1, 0, 0, 0; 0, cos(angle), -sin(angle), 0; 0, sin(angle), cos(angle), 0; 0, 0, 0, 1];
    elseif axis == 'y'
        homogeneous_transformation_matrix = [cos(angle), 0, sin(angle), 0; 0, 1, 0, 0; -sin(angle), 0, cos(angle), 0; 0, 0, 0, 1];
    elseif axis == 'z'
        homogeneous_transformation_matrix = [cos(angle), -sin(angle), 0, 0; sin(angle), cos(angle), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
    else
        error('Invalid axis. Choose x, y, or z.');
    end
end
