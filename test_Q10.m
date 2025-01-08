
function test_Q10()
    % Define original marker positions (example)
    M1 = [10, 0, 0];  % Marker 1 position (replace with actual values)
    M2 = [0, 10, 0];  % Marker 2 position (replace with actual values)
    M3 = [0, 0, 10];  % Marker 3 position (replace with actual values)

    error_magnitude_steps = 0:0.5:5;  % Error magnitude from 0 to 5 mm in 0.5 mm increments
    num_trials = 50;  % Number of trials per error magnitude
    max_depth = 100;  % Maximum insertion depth (mm)
    clinical_threshold = 3;  % Clinical targeting error threshold (mm)

    [error_magnitude_steps, avg_targeting_error, pass_rate] = simulate_targeting_error(M1, M2, M3, error_magnitude_steps, num_trials, max_depth, clinical_threshold);


    % Plot the results
    figure;
    subplot(1, 2, 1);
    plot(error_magnitude_steps, avg_targeting_error, '-o');
    xlabel('Marker Localization Error Magnitude (mm)');
    ylabel('Average Targeting Error (mm)');
    title('Targeting Error vs. Localization Error');
    
    subplot(1, 2, 2);
    plot(error_magnitude_steps, pass_rate * 100, '-o');
    xlabel('Marker Localization Error Magnitude (mm)');
    ylabel('Pass Rate (%)');
    title('Pass Rate vs. Localization Error');
    fprintf("See figure 6\n");
    
end