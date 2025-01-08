

function test_Q9()
    figure;
    
    subplot(1, 3, 1);
    Cin = [0, 0, 0];  
    Rin = 1;        
    Pct1 = [0, 0, 2]; 
    vct1 = [0, 0, -1];
    
    [TargetingError1, MaxLengthOfTissueCore1, NeedleInsertionDepth1] = evaluate_biopsy_plan(Cin, Rin, Pct1, vct1);
    visualize_case(Cin, Rin, Pct1, vct1);
    title('Needle Intersects the Tumor');
    
    subplot(1, 3, 2);
    Pct2 = [0, 1, 2]; 
    vct2 = [0, 0, -1];
    [TargetingError2, MaxLengthOfTissueCore2, NeedleInsertionDepth2] = evaluate_biopsy_plan(Cin, Rin, Pct2, vct2);
    visualize_case(Cin, Rin, Pct2, vct2);
    title('Needle Touches the Tumor');
    
    subplot(1, 3, 3);
    Pct3 = [0, 2, 2]; 
    vct3 = [0, 0, -1];
    [TargetingError3, MaxLengthOfTissueCore3, NeedleInsertionDepth3] = evaluate_biopsy_plan(Cin, Rin, Pct3, vct3);
    visualize_case(Cin, Rin, Pct3, vct3);
    title('Needle Misses the Tumor');
    
    fprintf('Ground Truth Case 1: Needle intersects the tumor\n');
    fprintf('Targeting Error: %.4f\n', TargetingError1);
    fprintf('Max Length of Tissue Core: %.4f\n', MaxLengthOfTissueCore1);
    fprintf('Needle Insertion Depth: %.4f\n\n', NeedleInsertionDepth1);
    
    fprintf('Ground Truth Case 2: Needle touches the tumor\n');
    fprintf('Targeting Error: %.4f\n', TargetingError2);
    fprintf('Max Length of Tissue Core: %.4f\n', MaxLengthOfTissueCore2);
    fprintf('Needle Insertion Depth: %.4f\n\n', NeedleInsertionDepth2);
    
    fprintf('Ground Truth Case 3: Needle misses the tumor\n');
    fprintf('Targeting Error: %.4f\n', TargetingError3);
    fprintf('Max Length of Tissue Core: %.4f\n', MaxLengthOfTissueCore3);
    fprintf('Needle Insertion Depth: %.4f\n\n', NeedleInsertionDepth3);

    
    fprintf("See figure 5\n");
end

function visualize_case(Cin, Rin, Pct, vct)
    % Create a mesh grid for plotting the tumor as a sphere
    [X, Y, Z] = sphere(50); 
    X = Rin * X + Cin(1);
    Y = Rin * Y + Cin(2);
    Z = Rin * Z + Cin(3);
    
    % Plot tumor = sphere
    surf(X, Y, Z, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
    hold on;
    
    % Plot needle= line
    t = linspace(-3, 3, 100); 
    needle_line = Pct + t' * vct;  
    plot3(needle_line(:, 1), needle_line(:, 2), needle_line(:, 3), 'r-', 'LineWidth', 2);
   
    plot3(Pct(1), Pct(2), Pct(3), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);

    axis equal;
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
    grid on;
    hold off;
    
end
