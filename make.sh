#!/usr/bin/env bash

wget -O sparql-results/superpatterns.csv http://grlc.io/api-git/peta-pico/fpsi-admin/get-superpatterns.csv
wget -O sparql-results/reviews.csv http://grlc.io/api-git/peta-pico/fpsi-admin/get-reviews.csv
wget -O sparql-results/review-to-superpattern.csv http://grlc.io/api-git/peta-pico/fpsi-admin/get-review-to-superpattern.csv
wget -O sparql-results/superpattern-to-classdef.csv http://grlc.io/api-git/peta-pico/fpsi-admin/get-superpattern-to-classdef.csv

cat sparql-results/*.csv > np-graph.csv

cat np-graph.head.dot > np-graph.dot

cat np-graph.csv \
  | sed '1d' \
  | sed -r 's/","(.*)","/" \1 "/g' \
  | sed 's/""/"/g' \
  | sed 's/ "$//g' \
  >> np-graph.dot

cat np-graph.tail.dot >> np-graph.dot

dot -Tsvg np-graph.dot > np-graph.svg
