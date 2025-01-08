
function test_Q5()
    % Test 1: Pure translation
    disp("Test 1: Pure translation");
    disp("test 1a, translation: Ov[3;0;0] v1[1;0;0] v2[0;1;0] v3[0;0;1]");
    T_v_to_h = transform_frame_to_home([2;0;0],[1;0;0],[0;1;0],[0;0;1])
    
    disp("test 1b, translation: Ov[0;0;-2] v1[1;0;0] v2[0;1;0] v3[0;0;1]");
    T_v_to_h = transform_frame_to_home([0;0;-2],[1;0;0],[0;1;0],[0;0;1])
    
    % Test 2: Pure rotation
    disp("Test 2: Pure rotation");
    % Ov[0;0;0] is no translation
    disp("test 2a, rotation: Ov[0;0;0] v1[1;0;0] v2[0;1;0] v3[0;0;1]");
    T_v_to_h = transform_frame_to_home([0;0;0],[1;0;0],[0;1;0],[0;0;1])
    
    disp("test 2b, rotation: Ov[0;0;0] v1[1;0;0] v2[0;1;0] v3[0;0;1]");
    T_v_to_h = transform_frame_to_home([0;0;0],[1;1;1],[0;1;0],[0;0;1])

    % Test 3: Both
    disp("Test 3: Both");

    disp("test 3a, both: Ov[3;2;1] v1[1;2;3] v2[4;5;6] v3[7;8;9]")
    T_v_to_h = transform_frame_to_home([3;2;1],[1;2;3],[4;5;6],[7;8;9])
    
    disp("test 3b, both: Ov[0;-1;-2] v1[1;2;3] v2[4;5;6] v3[7;8;9]")
    T_v_to_h = transform_frame_to_home([0;-1;-2],[1;2;3],[4;5;6],[7;8;9])
end

