

function test_Q7()
    figure;
    subplot(2,2,1);
    A1 = [0, 0.5];
    P1 = [0, 0];
    v1 = [1, 0];
    computed_dist1 = dist_of_point_from_line(A1, P1, v1);
    fprintf('Test Case 1: Computed Distance = %.4f\n', computed_dist1);
    
    hold on;
    plot([P1(1), P1(1) + v1(1)], [P1(2), P1(2) + v1(2)], 'b-', 'LineWidth', 2); % Line
    plot(A1(1), A1(2), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Point A1
    xlabel('X');
    ylabel('Y');
    title('Test Case 1: Point and Line');
    axis equal;
    grid on;
    hold off;

    subplot(2,2,2);
    A2 = [1, 2];
    P2 = [0, 0];
    v2 = [3, 3];
    computed_dist2 = dist_of_point_from_line(A2, P2, v2);
    fprintf('Test Case 2: Computed Distance = %.4f\n', computed_dist2);
    
    hold on;
    line_direction = [P2(1) + v2(1), P2(2) + v2(2)];
    plot([P2(1), line_direction(1)], [P2(2), line_direction(2)], 'b-', 'LineWidth', 2); % Line
    plot(A2(1), A2(2), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Point A2
    xlabel('X');
    ylabel('Y');
    title('Test Case 2: Point and Line');
    axis equal;
    grid on;
    hold off;
    fprintf("See figure 4\n");
end
