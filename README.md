# pagerank

This repo contains an implementation of Google's pagerank algorithm in MATLAB. The basic idea of the algorithm is to generate a rank of pages by how many times a specific page is hyperlinked to in other pages.

Setting up Github actions to work with MATLAB is really annoying and maybe not even possible with my license so to test this just clone the repo and run the `test_pagerank.m` file. 

Here's an example of how you might call the algorithm, where `adj_matrix` is the inputted adjacency matrix, `damping_factor` is your damping factor, and `jump_vector` is your jump vector.

```
adj_matrix = [0 2 3 3 4 2; 
              0 2 3 3 5 5; 
              0 4 3 1 2 5; 
              0 0 0 3 1 2; 
              0 5 3 5 4 4;
              0 0 2 3 1 5];
damping_factor = 0.5;
jump_vector = [0.001; 0.009; 0.09; 0.7; 0.15; 0.05];

pagerank(adj_matrix, damping_factor, jump_vector);
```

And here's what the output will look like

```
    0.0825
    0.0983
    0.1084
    0.4238
    0.2017
    0.0853
```

It's stored in a column vector, the same size as the inputted adjacency matrix.
