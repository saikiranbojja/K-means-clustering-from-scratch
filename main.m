X=load('X.dat');
size(X);
[clusters,centeroids]=k_means(X, 3);
draw_clusters(X,clusters,centeroids );