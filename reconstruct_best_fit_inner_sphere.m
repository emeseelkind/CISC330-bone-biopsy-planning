%{ 
Reconstruct-Best-Fitting-Inner-Sphere
• Task: Reconstruct the best-fitting snug inner sphere from a set of contour points. Explain your
approach in text or in comments.
• Input: [points-in] as points on the tumor’s contour
• Output: [C, R] as center point and radius.
%}


function [C, R] = fit_sphere(points_in)
    % Fit a sphere to the given points using least squares
    % Input: points_in (Nx3 matrix of contour points)
    % Output: C (1x3 center point)
    %         R (radius)


    A = [2*points_in(:,1), 2*points_in(:,2), 2*points_in(:,3), ones(size(points_in, 1), 1)];
    b = sum(points_in.^2, 2); 
    x = A\b;
    C = x(1:3)';
    R = sqrt(x(4) + sum(C.^2));
end

function [C, R] = reconstruct_sphere(points_in, k, threshold)
    % Input: k (outlier factor), threshold (RMS threshold)
    % Output: C (center), R (radius)
    
    [C, R] = fit_sphere(points_in);
    for i = 1:10  
        % Calculate distances from each point to the fitted sphere
        dist = sqrt(sum((points_in - C).^2, 2)) - R;
        RMS = sqrt(mean(dist.^2));
        outliers = abs(dist) > k * RMS;
        if sum(outliers) == 0 || RMS < threshold
            break;
        end
        points_in(outliers, :) = [];
        [C, R] = fit_sphere(points_in);
    end
end

function reconstruct_best_fit_inner_sphere_test()
    % Ground truth sphere: radius 1, center at origin
    n = 20;  % Number of points
    [X, Y, Z] = sphere(n-1);  % Generate points on a sphere
    points_in = [X(:), Y(:), Z(:)];
    
    % Apply random error: 10% of radius
    random_errors = 0.1 * randn(size(points_in));
    noisy_points = points_in + random_errors;
    
    % Fit the sphere with outlier rejection
    outlier_rejection_factor = 2;  
    RMSE_threshold = 0.01; 
    [C, R] = reconstruct_sphere(noisy_points, outlier_rejection_factor, RMSE_threshold);
    fprintf('Center point of the sphere is: [%.4f, %.4f, %.4f]\n', C(1), C(2), C(3));
    fprintf('Radius of the sphere is: %.4f\n', R);

    % Visualize results
    figure;
    scatter3(noisy_points(:,1), noisy_points(:,2), noisy_points(:,3), 'filled');
    hold on;
    
    % Plot the reconstructed sphere
    [X_fit, Y_fit, Z_fit] = sphere(50);
    X_fit = C(1) + R * X_fit;
    Y_fit = C(2) + R * Y_fit;
    Z_fit = C(3) + R * Z_fit;
    surf(X_fit, Y_fit, Z_fit, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
    
    % Plot the ground truth sphere for comparison
    surf(X, Y, Z, 'FaceAlpha', 0.1, 'EdgeColor', 'none');
    
    xlabel('X'); ylabel('Y'); zlabel('Z');
    title('Reconstructed Sphere with Noisy Points');
    axis equal;
    grid on;
    hold off;
end

% Run the test
reconstruct_best_fit_inner_sphere_test();

