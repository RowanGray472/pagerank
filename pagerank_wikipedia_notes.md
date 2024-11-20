## Wikipedia Notes

1. algorithm used to rank webpages
2. counts number and quality of links and uses that to determine priority
3. numerical weight for any element E is denoted PR(E)
4. results from a graph where pages are nodes and hyperlinks are edges
5. some pages are given the 'authority hub' status like mayoclinic.org- their edges are weighted more
6. pagerank is defined recursively- depends both on the number of pages linking to it and how good those pages are
7. this problem is used in other places- like determining the winner of tournaments better
8. developed by larry page and sergey brin at stanford in 1996- they then started google
9. the algorithm outputs a probability distribution that is the likelyhood that any given person clicking randomly on links would arrive at a given page
10. pagerank requires iterations
11. applying it where b c and d all have one link to a
    1. PR(A) = PR(B) + PR(C) + PR(D)
    2. PR starts out as just 1/(number of nodes)
12. applying it where b has two links, c has one, and d has thre
    1. PR(A) = PR(B)/2 + PR(C) + PR(D)/3
13. applying it in a general case, where u is a node, v is a set of nodes in b, and L is the number of links from that page
    1. PR(u) = sum{v}(PR(v)/L(v))
14. the damping factor- the probability that at any given step a person will continue following links as opposed to jumping
    1. it's usually assumed to be 0.85
15. this changes the formula(where the number of nodes is denoted by N) to
    1. PR(u) = (1-d)/n + d(sum{v}(PR(v)/L(v)))
16. in pagerank, sites with no links are called 'sinks' and we represent them by saying they have links to all other sites, because after going there a user *has* to go to a random site
17. more difficult linear algebra stuff
    1. pagerank values are the *dominant right eigenvector* of the modified adjacency matrix (scaled to sum to 1)
    2. the matrix calculation looks like this
        1. one column, N rows, each has (1-d)/N in it- this is added to
        2. d * an NxN matrix where each element is the number of links outbound from page j to page i
18. so the iterative pagerank of a page is the probability of getting to that page after a large number of clicks
    1. when this converges depends on the size of your database
19. disadvantage of pagerank- favors older pages
20. the way you actually run this algorithm- run the formula specified in 17. - taking the output and putting it back into the input for the probability matrix, until the difference between the two matrix goes below some value

## Wikipedia's Python Implementation. Docstring is theirs, comments are mine.

```
import numpy as np

def pagerank(M, d: float = 0.85):
    """PageRank algorithm with explicit number of iterations. Returns ranking of nodes (pages) in the adjacency matrix.

    Parameters
    ----------
    M : numpy array
        adjacency matrix where M_i,j represents the link from 'j' to 'i', such that for all 'j'
        sum(i, M_i,j) = 1
    d : float, optional
        damping factor, by default 0.85

    Returns
    -------
    numpy array
        a vector of ranks such that v_i is the i-th rank from [0, 1],

    """
    N = M.shape[1] # setting N to the total number of values
    w = np.ones(N) / N # creating a column vector w filled with 1/Ns
    M_hat = d * M 
    v = M_hat @ w + (1 - d) # adding the dominant right eigenvalue of M_hat to w + 1 - d
    while(np.linalg.norm(w - v) >= 1e-10): # setting the threshold
        w = v # resetting v every time
        v = M_hat @ w + (1 - d) # iterative calculation
    return v

M = np.array([[0, 0, 0, 0],
              [0, 0, 0, 0],
              [1, 0.5, 0, 0],
              [0, 0.5, 1, 0]])
v = pagerank(M, 0.85)
```
