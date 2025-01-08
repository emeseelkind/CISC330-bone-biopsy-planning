%{
Task: Register the tracked needle’s tip and tool axis vector to CT imaging frame, by using the utility
functions you have developed above.
• Input:
o M1tool, M2tool, M3tool – three markers in tool model frame
o Ptool – tool tip in tool model frame
o vtool – tool axis vector in tool model frame
o M1ct, M2ct, M3ct – three markers in CT frame
• Output:
o Pct – tool tip in CT frame
o Vct – tool axis vector in CT frame
%}

function [Pct, Vct] = reg_tracked_needle_CT_frame(M1_tool, M2_tool, M3_tool, Ptool, vtool, M1_ct, M2_ct, M3_ct)
    % Generate orthonormal frames by using Q3 for the tool model frame
    [O_tool, e1_tool, e2_tool, e3_tool, needle] = generate_orthonormal_frame(M1_tool, M2_tool, M3_tool);
    
    % Generate orthonormal frames by using Q3 for the CT frame
    [O_ct, e1_ct, e2_ct, e3_ct, needle] = generate_orthonormal_frame(M1_ct, M2_ct, M3_ct);
    
    % Compute transformation matrix from tool frame to CT frame by using Q5
    T_f_to_h1= transform_frame_to_home(O_tool, e1_tool, e2_tool, e3_tool);
    T_f_to_h2= transform_frame_to_home(O_ct, e1_ct, e2_ct, e3_ct);
    T_tool_to_ct =  T_f_to_h1 *inv(T_f_to_h2 );
                   
    % Transform tool tip Ptool to CT frame
    Ptool_hom = [Ptool; 1];  
    Pct_hom = T_tool_to_ct * Ptool_hom; 
    Pct = Pct_hom(1:3); 
    
    % Transform tool axis vector (vtool)
    % To transform the axis vector, we only rotate it, no translation is applied.
    vtool_start = [Ptool; 1];
    vtool_end = [Ptool + vtool; 1];
    Vct_start = T_tool_to_ct * vtool_start;
    Vct_end = T_tool_to_ct * vtool_end; 

    %vtool_end_hom = [Ptool + vtool; 1];  
    %vtool_end_ct_hom = T_tool_to_ct * vtool_end_hom;  
    Vct = Vct_end(1:3) - Vct_start(1:3); 
    Vct = Vct / norm(Vct);
end
