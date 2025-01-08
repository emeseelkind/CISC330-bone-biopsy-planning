

function test_Q4()
   disp("Test for 135 degrees about x axis:");
   homogeneous_transformation_matrix1 = rotation_about_coord_axis('x',75);
   rotated_point1 = apply_rotation_to_point(homogeneous_transformation_matrix1, [2, 3, 4]);
   disp("Rotated point: ");
   disp(rotated_point1);

   disp("Test with 90 degrees about y axis:");
   homogeneous_transformation_matrix2 = rotation_about_coord_axis('y',90);
   rotated_point2 = apply_rotation_to_point(homogeneous_transformation_matrix2, [2, 1, 1]);
   disp("Rotated point: ");
   disp(rotated_point2);

   disp("Test with -45 degrees about y axis:")
   homogeneous_transformation_matrix3 = rotation_about_coord_axis('z',-45);
   rotated_point3 = apply_rotation_to_point(homogeneous_transformation_matrix3, [1, 3, 0]);   
   disp("Rotated point: ");
   disp(rotated_point3);

end

function rotated_point = apply_rotation_to_point(rotation_matrix, point)
    % Pad the vector with a 1 to multiply = [x, y, z, 1]
    point_homogeneous = [point, 1]';
    rotated_point_homogeneous = rotation_matrix * point_homogeneous;
    rotated_point = rotated_point_homogeneous(1:3)';
end