fpsi-admin
==========

This repo contains the code to make a visualization of the network of nanopublications for the formalization paper special issue.

Run `make.sh` to run the process.

It runs the SPARQL queries in the `.rq` files (via grlc) and saves the results in the folder `sparql-results` as CSV files. Then, it merges these files into `np-graph.csv` and transforms it into a dot file (`np-graph.dot`), which is then used to visualize via Graphviz. The resulting visualization is in `np-graph.svg`.
