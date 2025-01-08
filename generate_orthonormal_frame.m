%{
Task: Compute an orthonormal frame from three marker points. Place center in the center of gravity.
• Input: (A, B, C) for the three marker points
• Output: Oe, (e1, e2, e3) for the centre (Oe) and three base vectors (e1, e2, e3).
• Testing: Sketch up on paper at two ground truth cases. Examine if your program produces the expected
output.
• Hints: Look up the relevant lecture slide. In constructing a “ground truth”, think of a simple spatial
arrangement, such as vertices of a right-angle triangle with unit legs, placed in (0,0,0) in one of the
principal coordinate planes.
%}

function [Oe, e1, e2, e3, needle] = generate_orthonormal_frame(A, B, C)
    Oe = (A + B + C) / 3;
    e1 = (B - A) / norm(B - A);
    e2 = (C - A) - (dot((C - A), e1) * e1);  
    e2 = e2 / norm(e2);           
    e3 = cross(e1, e2);
    e3 = e3 / norm(e3);  
    needle = -e3;
end
