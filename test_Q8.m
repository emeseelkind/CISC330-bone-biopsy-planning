
function test_Q8()
    C = [0, 0, 0];
    R = 2;

    P = [1, 1, 1];
    v = [1, 1, 1];
    [numIntersections, P1, P2] = intersect_line_and_sphere(P, v, C, R);
    fprintf('Test Case 1: Two intersections\n');
    fprintf('Number of Intersections: %d\n', numIntersections);
    disp('Intersection Points:');
    disp(P1);
    disp(P2);

    P = [0, 0, 2];
    v = [1, 1, 0];
    [numIntersections, P1, P2] = intersect_line_and_sphere(P, v, C, R);
    fprintf('Test Case 2: Tangent intersection (1 point)\n');
    fprintf('Number of Intersections: %d\n', numIntersections);
    disp('Intersection Point:');
    disp(P1);

    P = [0, 0, 3];
    v = [1, 1, 0];
    [numIntersections, P1, P2] = intersect_line_and_sphere(P, v, C, R);
    fprintf('Test Case 3: No intersections\n');
    fprintf('Number of Intersections: %d\n', numIntersections);
end