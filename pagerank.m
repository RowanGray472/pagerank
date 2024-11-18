function [output_vector] = pagerank(input_matrix, damping_factor, jump_vector)
    %%% This function calculates the page rank of all nodes in an inputted
    %%% adjacency matrix.
    %%% VARIABLES
    %%% input_matrix - the inputted adjacency matrix
    %%% damping_factor - the chance that any given click is to a hyperlink
    %%% *within* a page, rather than to another random page
    %%% jump_vector - the set of probabilities of what page a user will go
    %%% to when they *jump* ie go to a random page not a hyperlink
    %%% threshold - the difference in vector magnitude necessary to stop
    %%% the iteration
    %%% iteration_matrix - the matrix we're iterating on. it's different
    %%% from the inputted matrix because we normalize each column so that
    %%% the values add up to one. if a column is all zeros we fill it with
    %%% the jump vector because the user's next option *has* to be to a
    %%% jump
    
    % setting up starting variables
    matrix_size = size(input_matrix, 1);
    output_vector = ones(matrix_size, 1) / matrix_size;
    threshold = 1e-6; 
    difference = Inf;
    
    % set default jump vector
    if nargin < 3
        jump_vector = ones(matrix_size, 1) / matrix_size; 
    end
    % Set default damping factor
    if nargin < 2
        damping_factor = 0.85;
    end
    
    % initializing the iteration matrix
    iteration_matrix = zeros(matrix_size);
    for j = 1:matrix_size
        column_sum = sum(input_matrix(:, j));
        if column_sum == 0
            iteration_matrix(:, j) = jump_vector;
        else
            iteration_matrix(:, j) = input_matrix(:, j) / column_sum;
        end
    end

    % converging
    while difference > threshold
        new_output_vector = damping_factor * iteration_matrix * output_vector + ...
                            (1 - damping_factor) * jump_vector;
        difference = norm(new_output_vector - output_vector, 1); % gets the magnitude of the vector
        output_vector = new_output_vector;
    end
end
