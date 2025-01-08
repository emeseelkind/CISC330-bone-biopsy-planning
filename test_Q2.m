
function test_Q2()
    % Generate points on a unit sphere for ground truth
    n_points = 100; 
    % Spherical coordinates (theta, phi, r)
    theta = 2 * pi * rand(n_points, 1);
    phi = acos(2 * rand(n_points, 1) - 1);
    % Convert spherical coordinates to Cartesian coordinates
    x = cos(theta) .* sin(phi);
    y = sin(theta) .* sin(phi);
    z = cos(phi);
    % Ground truth points on sphere
    points_in = [x, y, z];  
    
    % Fit the sphere to the ground truth points
    [C, R] = best_fitting_inner_sphere(points_in);
    % 10% noise
    noise_mag = 0.1;  
    noise = noise_mag * (randn(n_points, 3) ./ vecnorm(randn(n_points, 3), 2, 2));
    points_noisy = points_in + noise;
    [C_noisy, R_noisy] = best_fitting_inner_sphere(points_noisy);
    
    figure;
    hold on;
    axis equal;
    grid on;
    view(3); 
    scatter3(points_in(:, 1), points_in(:, 2), points_in(:, 3), 36, 'r', '.');
    scatter3(points_noisy(:, 1), points_noisy(:, 2), points_noisy(:, 3), 36, 'b', '.');
    
    [xx, yy, zz] = sphere(50); 
    surf(C(1) + R * xx, C(2) + R * yy, C(3) + R * zz, 'FaceAlpha', 0.1, 'EdgeColor', 'none', 'FaceColor', 'r');
    surf(C_noisy(1) + R_noisy * xx, C_noisy(2) + R_noisy * yy, C_noisy(3) + R_noisy * zz, 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'FaceColor', 'b');
    
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('Best-fitting inner sphere');
    hold off;
    fprintf("See figure 2\n");
end