%{
Task: Compute an orthonormal frame from three marker points. Place center in the center of gravity.
• Input: (A, B, C) for the three marker points
• Output: Oe, (e1, e2, e3) for the centre (Oe) and three base vectors (e1, e2, e3).
%}

function test_Q3()
    figure;
    hold on;
    axis equal;
    % Ground truth points for right-angled triangle in XY-plane
    A = [0, 0, 0];
    B = [1, 0, 0];
    C = [0, 1, 0];
    
    % Compute orthonormal frame
    [Oe, e1, e2, e3, needle] = generate_orthonormal_frame(A, B, C);

    scatter3(A(1), A(2), A(3), 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
    scatter3(B(1), B(2), B(3), 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g');
    scatter3(C(1), C(2), C(3), 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b');
    scatter3(Oe(1), Oe(2), Oe(3), 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'm');
    
    quiver3(Oe(1), Oe(2), Oe(3), e1(1), e1(2), e1(3), 1, 'r', 'LineWidth', 2);
    quiver3(Oe(1), Oe(2), Oe(3), e2(1), e2(2), e2(3), 1, 'g', 'LineWidth', 2);
    quiver3(Oe(1), Oe(2), Oe(3), e3(1), e3(2), e3(3), 1, 'b', 'LineWidth', 2);
    quiver3(Oe(1), Oe(2), Oe(3), needle(1), needle(2), needle(3), 1, 'k', 'LineWidth', 2);
    
    text(A(1), A(2), A(3), 'A', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    text(B(1), B(2), B(3), 'B', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    text(C(1), C(2), C(3), 'C', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    text(Oe(1), Oe(2), Oe(3), 'Oe', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    
    legend('A', 'B', 'C', 'Center (Oe)', 'e1 (red)', 'e2 (green)', 'e3 (blue)', 'needle (black)', 'Location', 'best');
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
    title('Generate Orthonormal Frame');
    grid on;
    view(3);
    fprintf("See figure 3\n");
end
