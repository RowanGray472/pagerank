function [output_vector] = pagerank(input_matrix, damping_factor)
    %%% DOCSTRING
    %%% Text here
    % Set default damping factor if not provided
    if nargin < 2
        damping_factor = 0.85;
    end
    matrix_size = size(input_matrix, 1);
    disp(input_matrix)
    threshold_vector = ones(1, matrix_size) * 0.01;
    counter = 1;
    output_vector = zeros(1, matrix_size);
    for i = 1:matrix_size
                for j = 1:matrix_size
                    if i == j
                        output_vector(i) = (sum(input_matrix(:, i)) + ...
                            sum(input_matrix(i, :)))/matrix_size;
                    end
                end                       
    end   
    difference_output_vector = output_vector - zeros(1, matrix_size);
    while all(difference_output_vector < threshold_vector, 'all') == 0
        input_matrix_current = input_matrix^counter;
        for i = 1:matrix_size
                for j = 1:matrix_size
                    if i == j
                        new_output_vector(i) = (sum(input_matrix_current(:, i)) + ...
                            sum(input_matrix_current(i, :)))/matrix_size;
                        difference_output_vector = new_output_vector-output_vector;
                        output_vector = new_output_vector;
                    end
                end                       
        end        
        counter = counter + 1;
    end


    % Perform calculation and return the size of the resulting matrix
    % thing to write now- for each node, return the sum of all the other
    % nodes divided by the size
    % for i and j where i = j in matrix. sum all values of i j held
    % constand and all values of j for i held constant. then divide by
    % size. return that vector of length size
    for i = 1:matrix_size
        for j = 1:matrix_size
            if i == j
                output_vector(i) = (sum(input_matrix_next(:, i)) + ...
                    sum(input_matrix_next(i, :)))/matrix_size;
            end
        end
    end
                
end

% we're interested to see where the adjacency matrix converges
% we need a process to see where it converges and a definition of what
% converging means
% 0.01