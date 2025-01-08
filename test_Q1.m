% generate_rand_unit_vec.m

function test_q1()
    n= 10;
    vector_matx = zeros(n, 3);
    figure;
    [X, Y, Z] = sphere(50); % Create a sphere for visualization
    surf(X, Y, Z, 'FaceAlpha', 0.3, 'EdgeColor', 'none'); % Plot the unit sphere
    hold on;
    
    for i = 1:n
        [x,y,z] = generate_rand_unit_vec();
        quiver3(0,0,0,x,y,z,'LineWidth', 1.5, 'MaxHeadSize', 0.5)
    end
    xlabel('X'); 
    ylabel('Y'); 
    zlabel('Z');
    title('Random Unit Vectors on the Unit Sphere');
    axis equal;
    grid on;
    hold off;
    fprintf("See figure 1\n");
end