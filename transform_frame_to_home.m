%{
Transform-from-Home-to-Frame
• Task: Compute the transformation that takes the perspective from home frame to v frame.
• Input: (Ov, v1, v2, v3), for centre and the 3 base vectors in v frame
• Output: 4x4 homogeneous transformation matrix for “frame-to-home”,
%}

function T_v_to_h = transform_frame_to_home(O_v, v1, v2, v3)    
    % frame rotation to home
    R = [v1(:) v2(:) v3(:)];
    R = [R; 0,0,0];
    R= [R,[0;0;0;1]];
    % frame translation to home
    T = O_v(:);
    i=eye(4);
    i(1:3, 4) = T;
    T_v_to_h = R * i;
    
end