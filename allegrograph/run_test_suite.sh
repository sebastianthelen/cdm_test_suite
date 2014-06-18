#!/bin/bash

#  run_test_suite.sh
#  
#
#  Created by Patrick Gratz on 13/06/14.
#
time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X WHERE {?X rdf:type ub:GraduateStudent . ?X ub:takesCourse <http://www.Department0.University0.edu/GraduateCourse0>} ORDER BY DESC(?X)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql1.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X ?Y ?Z WHERE {?X rdf:type ub:GraduateStudent . ?Y rdf:type ub:University . ?Z rdf:type ub:Department . ?X ub:memberOf ?Z . ?Z ub:subOrganizationOf ?Y . ?X ub:undergraduateDegreeFrom ?Y} ORDER BY DESC(?X) DESC(?Y) DESC(?Z)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql2.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X WHERE {?X rdf:type ub:Publication . ?X ub:publicationAuthor <http://www.Department0.University0.edu/AssistantProfessor0>} ORDER BY DESC(?X)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql3.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X ?Y1 ?Y2 ?Y3 WHERE {?X rdf:type ub:Professor . ?X ub:worksFor <http://www.Department0.University0.edu> . ?X ub:name ?Y1 . ?X ub:emailAddress ?Y2 .?X ub:telephone ?Y3} ORDER BY DESC(?X) DESC(?Y1) DESC(?Y2) DESC(?Y3)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql4.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X WHERE {?X rdf:type ub:Person . ?X ub:memberOf <http://www.Department0.University0.edu>} ORDER BY DESC(?X)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql5.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X WHERE {?X rdf:type ub:Student} ORDER BY DESC(?X)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql6.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X ?Y WHERE {?X rdf:type ub:Student . ?Y rdf:type ub:Course . ?X ub:takesCourse ?Y . <http://www.Department0.University0.edu/AssociateProfessor0> ub:teacherOf ?Y} ORDER BY DESC(?X) DESC(?Y)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql7.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X ?Y ?Z WHERE {?X rdf:type ub:Student . ?Y rdf:type ub:Department . ?X ub:memberOf ?Y . ?Y ub:subOrganizationOf <http://www.University0.edu> . ?X ub:emailAddress ?Z} ORDER BY DESC(?X) DESC(?Y) DESC(?Z)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql8.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X ?Y ?Z WHERE {?X rdf:type ub:Student . ?Y rdf:type ub:Faculty . ?Z rdf:type ub:Course . ?X ub:advisor ?Y . ?Y ub:teacherOf ?Z . ?X ub:takesCourse ?Z} ORDER BY DESC(?X) DESC(?Y) DESC(?Z)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql9.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X WHERE {?X rdf:type ub:Student . ?X ub:takesCourse <http://www.Department0.University0.edu/GraduateCourse0>} ORDER BY DESC(?X)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql10.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X WHERE {?X rdf:type ub:ResearchGroup . ?X ub:subOrganizationOf <http://www.University0.edu>} ORDER BY DESC(?X)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql11.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X ?Y WHERE {?X rdf:type ub:Chair . ?Y rdf:type ub:Department . ?X ub:worksFor ?Y . ?Y ub:subOrganizationOf <http://www.University0.edu>} ORDER BY DESC(?X) DESC(?Y)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql12.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X WHERE {?X rdf:type ub:Person . <http://www.University0.edu> ub:hasAlumnus ?X} ORDER BY DESC(?X)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql13.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://localhost:10035/repositories/lubm' --data-urlencode 'query=PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX ub: <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#> SELECT DISTINCT ?X WHERE {?X rdf:type ub:UndergraduateStudent} ORDER BY DESC(?X)' --data-urlencode 'queryLn=SPARQL' --data-urlencode 'infer=true'  > results/sparql14.json

for i in `seq 1 14`;
do
    xsltproc -o results/normalized_sparql$i.json ../extract_bindings.xslt results/sparql$i.json;
    TMP=`cat results/normalized_sparql$i.json | tr -d " \t\n"`;
    printf "$TMP\n" > results/tmp.json && mv results/tmp.json results/normalized_sparql$i.json
done
