#!/usr/bin/env bash

wget -O np-graph.csv http://grlc.io/api-git/peta-pico/fpsi-admin/get-np-graph.csv

cat np-graph.head.dot > np-graph.dot

cat np-graph.csv \
  | sed '1d' \
  | sed -r 's/","(.*)","/" \1 "/g' \
  | sed 's/""//g' \
  >> np-graph.dot

cat np-graph.tail.dot >> np-graph.dot

dot -Tsvg np-graph.dot > np-graph.svg
