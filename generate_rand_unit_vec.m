%{ 
Generate-Random-Unit-Vector 
• Task: Generate a unit vector in random direction
• Output: vector (x, y, z)
• Testing: the function several times (N=10 or so) and plot resulting points on the canonical unit sphere
and inspect the results.
• Hints: Look up the relevant lecture slides. Think of “Polar Spherical” coordinates of vector of unit
length, with random polar angles. 
%}

function [x,y,z] = generate_rand_unit_vec()
    x = randn(); 
    y = randn(); 
    z = randn();
    mag = sqrt(x^2 + y^2 + z^2);
    x = x/mag;
    y = y/mag;
    z = z/mag;
    [x,y,z]; 
end