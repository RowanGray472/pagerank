% This file gives a set of test cases to the pagerank function.
% We have to use a tolerance level because of floating point

tol = 1e-4; % Set a tolerance level

% Test 1: Basic Case

adj_matrix = [1 0 0; 
              0 1 0; 
              0 0 1];
result = pagerank(adj_matrix);
expected = [1/3; 1/3; 1/3];

if all(abs(result - expected) < tol)
    disp('Test #1 passed!');
else
    disp('Test #1 failed.');
end

% Test 2: Another Basic Case- but BIG

adj_matrix = [1 2 3 0 4 2; 
              0 2 3 3 1 5; 
              1 4 3 1 2 5; 
              0 0 0 3 1 2; 
              1 4 3 5 4 2;
              0 4 2 3 1 1];
result = pagerank(adj_matrix);
expected = [0.2180; 0.1349; 0.2202; 0.0635; 0.2503; 0.1132];

if all(abs(result - expected) < tol)
    disp('Test #2 passed!');
else
    disp('Test #2 failed.');
end

% Test 3: Missing Columns/Rows

adj_matrix = [1 0 0;
              0 0 0;
              1 2 0];
result = pagerank(adj_matrix);
expected = [0.3264; 0.1877; 0.4859];

if all(abs(result - expected) < tol)
    disp('Test #3 passed!');
else
    disp('Test #3 failed.');
end

% Test 4: Normal Matrix but with Damping and a Jump Vector

adj_matrix = [1 0 0; 
              0 1 0; 
              0 0 1];
damping_factor = 0.23;
jump_vector = [0.3; 0.5; 0.2];
result = pagerank(adj_matrix, damping_factor, jump_vector);
expected = [0.3; 0.5; 0.2];

if all(abs(result - expected) < tol)
    disp('Test #4 passed!');
else
    disp('Test #4 failed.');
end

% Test 5: Everything all at the same time

adj_matrix = [0 2 3 3 4 2; 
              0 2 3 3 5 5; 
              0 4 3 1 2 5; 
              0 0 0 3 1 2; 
              0 5 3 5 4 4;
              0 0 2 3 1 5];
damping_factor = 0.5;
jump_vector = [0.001; 0.009; 0.09; 0.7; 0.15; 0.05];
result = pagerank(adj_matrix, damping_factor, jump_vector);
expected = [0.0825; 0.0983; 0.1084; 0.4238; 0.2017; 0.0853];

if all(abs(result - expected) < tol)
    disp('Test #5 passed!');
else
    disp('Test #5 failed.');
end