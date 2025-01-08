

function [error_magnitude_steps, avg_targeting_error, pass_rate] = simulate_targeting_error(M1, M2, M3, error_magnitude_steps, num_trials, max_depth, clinical_threshold)

    avg_targeting_error = zeros(size(error_magnitude_steps));
    pass_rate = zeros(size(error_magnitude_steps));
    
    for i = 1:length(error_magnitude_steps)
        current_error_magnitude = error_magnitude_steps(i);
        targeting_errors = zeros(1, num_trials);
        
        for trial = 1:num_trials
            % Simulate marker localization error
            random_direction1 = randn(1, 3);
            random_direction2 = randn(1, 3);
            random_direction3 = randn(1, 3);
            
            % Normalize and scale by the error magnitude
            M1_prime = M1 + (random_direction1 / norm(random_direction1)) * current_error_magnitude;
            M2_prime = M2 + (random_direction2 / norm(random_direction2)) * current_error_magnitude;
            M3_prime = M3 + (random_direction3 / norm(random_direction3)) * current_error_magnitude;            
            % Compute erroneous tool tip and tool axis
            
            [P_prime, v_prime] = register_needle_to_ct_frame(M1_prime, M2_prime, M3_prime);
            
            % Target point assumed at origin for simplicity
            target_point = [0, 0, 0];
            
            % Compute targeting error as the perpendicular distance to the needle axis
            diffVec = target_point - P_prime;
            crossProd = cross(v_prime, diffVec);
            targeting_error = norm(crossProd) / norm(v_prime);
            
            targeting_errors(trial) = targeting_error;
        end
        
        % Store average targeting error and pass rate for current error magnitude
        avg_targeting_error(i) = mean(targeting_errors);
        pass_rate(i) = sum(targeting_errors <= clinical_threshold) / num_trials;
    end
    
end

% Function to compute the needle's tool tip and axis in the erroneous pose
function [P_prime, v_prime] = register_needle_to_ct_frame(M1_prime, M2_prime, M3_prime)
    % Compute the needle axis (v_prime) as a vector from M1_prime to M2_prime
    v_prime = M2_prime - M1_prime;
    
    % Normalize the needle axis vector
    v_prime = v_prime / norm(v_prime);
    
    % Compute the tool tip (P_prime) as the midpoint between M1_prime and M3_prime
    P_prime = (M1_prime + M3_prime) / 2;
end
