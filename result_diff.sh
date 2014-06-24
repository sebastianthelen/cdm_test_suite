#!/bin/bash      


for i in `seq 1 14`;
do
diff3 virtuoso/results/normalized_sparql$i.json allegrograph/results/normalized_sparql$i.json stardog/results/normalized_sparql$i.json > diff/result_diff$i.txt
done 

