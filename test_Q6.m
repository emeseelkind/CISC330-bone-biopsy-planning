
function test_Q6()
    % Define ground truth cases
    % 1: Pure Translation
    M1_tool = [1; 0; 0];
    M2_tool = [0; 1; 0];
    M3_tool = [0; 0; 1];
    Ptool = [1; 1; 1];
    vtool = [0; 0; 1];
    % translation_vector = [1; 1; 1];
    M1_ct = M1_tool + [1; 1; 1];
    M2_ct = M2_tool + [1; 1; 1];
    M3_ct = M3_tool + [1; 1; 1];

    [Pct_trans, Vct_trans] = reg_tracked_needle_CT_frame(M1_tool, M2_tool, M3_tool, Ptool, vtool, M1_ct, M2_ct, M3_ct);
    disp('Pure Translation:');
    disp('Pct:'); disp(Pct_trans);
    disp('Vct:'); disp(Vct_trans);

    % 2: Pure Rotation
    M1_tool = [1; 0; 0];
    M2_tool = [0; 1; 0];
    M3_tool = [0; 0; 1];
    Ptool = [1; 1; 1];
    vtool = [0; 0; 1];

    % Define rotation angles (for example, 90 degrees around z-axis)
    theta = deg2rad(90); 
    R_rot = [cos(theta), -sin(theta), 0; sin(theta), cos(theta), 0; 0, 0, 1];

    % Rotate markers
    M1_ct = R_rot * M1_tool;
    M2_ct = R_rot * M2_tool;
    M3_ct = R_rot * M3_tool;

    [Pct_rot, Vct_rot] = reg_tracked_needle_CT_frame(M1_tool, M2_tool, M3_tool, Ptool, vtool, M1_ct, M2_ct, M3_ct);
    disp('Pure Rotation:');
    disp('Pct:'); disp(Pct_rot);
    disp('Vct:'); disp(Vct_rot);

    %clc
    % 3: Both Translation and Rotation
    M1_tool = [1; 0; 0];
    M2_tool = [0; 1; 0];
    M3_tool = [0; 0; 1];
    Ptool = [1; 1; 1];
    vtool = [0; 0; 1];

    % Rotate markers
    M1_ct = R_rot * M1_tool + [1; 1; 1];
    M2_ct = R_rot * M2_tool + [1; 1; 1];
    M3_ct = R_rot * M3_tool + [1; 1; 1];

    [Pct_both, Vct_both] = reg_tracked_needle_CT_frame(M1_tool, M2_tool, M3_tool, Ptool, vtool, M1_ct, M2_ct, M3_ct);
    disp('Both Translation and Rotation:');
    disp('Pct:'); disp(Pct_both);
    disp('Vct:'); disp(Vct_both);
end


