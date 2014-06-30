#!/bin/bash

#  run_test_suite.sh
#  
#
#  Created by S. Thelen, P. Gratz on 30/06/14.
#

rm log.csv
rm -rf results
mkdir results

query[0]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX owl: <http://www.w3.org/2002/07/owl#> SELECT DISTINCT ?s  WHERE { ?s cdm:act_consolidated_consolidates_resource_legal ?o. [] owl:annotatedSource ?as; owl:annotatedProperty cdm:act_consolidated_consolidates_resource_legal. ?c owl:sameAs ?as; owl:sameAs ?o.  FILTER (!sameTerm(?as,?o)) }'
query[1]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX owl: <http://www.w3.org/2002/07/owl#> SELECT (group_concat(distinct(?identifier); separator=" ") AS ?ids) ?cellarURI  WHERE { ?cellarURI owl:sameAs ?pid. {?pid cdm:work_id_document ?identifier.} UNION {?pid cdm:dossier_identifier ?identifier.}} GROUP BY ?cellarURI ORDER BY ?ids'
query[2]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX owl: <http://www.w3.org/2002/07/owl#> PREFIX cdma: <http://publications.europa.eu/ontology/annotation#> PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#> select distinct ?s ?as   WHERE { ?s a cdm:resource_legal. ?cellar owl:sameAs ?s; owl:sameAs ?as. FILTER (regex(str(?s), "resource/celex/")) FILTER NOT EXISTS { ?s cdm:resource_legal_id_celex ?w} FILTER NOT EXISTS { ?as cdm:resource_legal_id_celex ?w. } } '
query[3]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> PREFIX owl: <http://www.w3.org/2002/07/owl#> PREFIX dc: <http://purl.org/dc/elements/1.1/> PREFIX skos: <http://www.w3.org/2004/02/skos/core#> PREFIX at: <http://publications.europa.eu/ontology/authority/> SELECT ?c (group_concat(distinct ?id; separator=" ") as ?ids)  WHERE {  ?s a cdm:case-law; cdm:work_date_document ?date; cdm:work_id_document ?id. ?c owl:sameAs ?s; owl:sameAs ?sa. FILTER NOT EXISTS { ?s cdm:ecli ?o } FILTER NOT EXISTS { ?sa cdm:ecli ?o } } GROUP BY ?c'
query[4]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX owl: <http://www.w3.org/2002/07/owl#> PREFIX cdma: <http://publications.europa.eu/ontology/annotation#> PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> SELECT   ?p (count(DISTINCT *) as ?count)  WHERE { ?s  ?p ?o. ?s cdm:manifestation_manifests_expression?/cdm:expression_belongs_to_work?/cdm:work_date_document ?date. FILTER (?date > "2013-01-01"^^xsd:date && ?date < "2014-01-01"^^xsd:date ) } GROUP BY ?p ORDER BY ?p'
query[5]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> PREFIX owl: <http://www.w3.org/2002/07/owl#> PREFIX dc: <http://purl.org/dc/elements/1.1/> PREFIX skos: <http://www.w3.org/2004/02/skos/core#> PREFIX at: <http://publications.europa.eu/ontology/authority/> SELECT ?uri ?date ?title ?lang ?mtype ?thumbnail (group_concat(distinct ?pid;separator=";") as ?ids) (group_concat(distinct ?clabel;separator=";") as ?collections) (group_concat(distinct ?alabel;separator=";") as ?authors)(group_concat(distinct ?slabel;separator=";") as ?subjects) (group_concat(distinct ?item;separator=";") as ?documents) { SELECT distinct ?uri ?pid ?clabel ?alabel ?slabel ?date ?title ?lang ?mtype ?item ?thumbnail  WHERE { ?uri cdm:work_date_document ?date;    cdm:work_part_of_collection_document ?coll; cdm:work_created_by_agent ?author; cdm:is_about ?subject; cdm:work_id_document ?pid.?e cdm:expression_belongs_to_work ?uri; cdm:expression_uses_language ?l; cdm:expression_title ?title. ?l dc:identifier ?lang;  at:op-mapped-code ?code; skos:prefLabel ?llabel. ?code dc:source "iso-639-1"; at:legacy-code ?lcode. ?subject skos:prefLabel ?slabel. ?coll skos:prefLabel ?clabel. ?author skos:prefLabel ?alabel. ?m cdm:manifestation_manifests_expression ?ex; cdm:manifestation_type ?mtype. ?ce owl:sameAs ?ex; owl:sameAs ?e. ?cm owl:sameAs ?m; cdm:manifestation_has_item ?item. OPTIONAL { ?m cdm:manifestation_has_thumbnail ?thumbnail.} FILTER (?date = "2014-05-21"^^xsd:date) FILTER (lang(?llabel)=?lcode) FILTER (lang(?slabel)=?lcode) FILTER (lang(?clabel)=?lcode) FILTER (lang(?alabel)=?lcode) }} GROUP BY ?uri ?title ?lang ?date ?mtype ?thumbnail ORDER BY ?date ?uri ?lang ?mtype'
query[6]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX owl: <http://www.w3.org/2002/07/owl#> PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> SELECT DISTINCT ?class ?prop ?domain  WHERE {  ?class rdfs:subClassOf+ cdm:resource_legal . ?class rdfs:subClassOf* ?domain . ?prop rdfs:domain ?domain . } ORDER BY ?class ?domain '
query[7]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX owl: <http://www.w3.org/2002/07/owl#> PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> SELECT DISTINCT ?class ?prop ?domain ?exactcard ?mincard ?maxcard  WHERE {  ?class rdfs:subClassOf+ cdm:resource_legal . ?class rdfs:subClassOf* ?domain . ?prop rdfs:domain ?domain . OPTIONAL {  ?s1 owl:onProperty ?prop ; owl:cardinality ?exactcard . }  OPTIONAL {?s2 owl:onProperty ?prop ; owl:maxCardinality ?maxcard .  } OPTIONAL {  ?s3 owl:onProperty ?prop ; owl:minCardinality ?mincard . }} ORDER BY ?class ?domain ?prop'
query[8]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> SELECT DISTINCT ?oj ?act ?celex ?manif ?page_first ?page_last ?date_pub ?oj_id   WHERE { ?act cdm:published_in ?oj . ?oj cdm:identifier ?oj_id . ?oj cdm:official-journal_year  ?d . ?act cdm:work_has_expression ?expr . ?expr cdm:expression_uses_language <http://publications.europa.eu/resource/authority/language/ENG> . ?manif cdm:manifests ?expr .?manif cdm:manifestation_type "print"^^xsd:string . ?manif cdm:page_first ?page_first . ?manif cdm:page_last ?page_last . ?oj cdm:date_publication ?date_pub . OPTIONAL {?act cdm:id_celex ?celex } . FILTER ( ?date_pub >= "2011-12-31"^^xsd:date) FILTER ( ?date_pub <= "2013-01-01"^^xsd:date) FILTER regex(?oj_id, "^oj:", "i") }'
query[9]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> SELECT DISTINCT ?oj ?act ?celex ?manif ?page_first ?page_last ?date_pub ?oj_id  WHERE { ?act cdm:published_in ?oj. ?oj cdm:identifier ?oj_id. ?oj cdm:official-journal_number  "337"^^xsd:positiveInteger. ?oj cdm:part_of <http://publications.europa.eu/resource/authority/document-collection/OJ-C>. ?act cdm:work_has_expression ?expr. ?expr cdm:expression_uses_language <http://publications.europa.eu/resource/authority/language/ENG>. ?manif cdm:manifests ?expr . ?manif cdm:manifestation_type "print"^^xsd:string. ?manif cdm:page_first ?page_first. ?manif cdm:page_last ?page_last. ?oj cdm:date_publication ?date_pub. OPTIONAL {?act cdm:id_celex ?celex }. FILTER regex(?oj_id, "^oj:", "i") }'
query[10]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> select distinct ?uri  WHERE { ?uri cdm:work_date_document ?d. FILTER NOT EXISTS { ?uri cdm:work_date_creation_legacy ?cd } } order by ?uri'
query[11]='PREFIX ORACLE_SEM_FS_NS: <http://oracle.com/semtech#timeout=300> PREFIX cdm: <http://publications.europa.eu/ontology/cdm#> PREFIX owl: <http://www.w3.org/2002/07/owl#> PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> SELECT distinct ?a  WHERE { ?a a cdm:expression; cdm:manifested_by ?b; cdm:belongs_to ?w. ?w cdm:work_date_document ?d. FILTER ( ?d > "2011-12-31"^^xsd:date) {?b a cdm:manifestation_official-journal} UNION {?b a cdm:manifestation_official-journal_part} MINUS {?c a cdm:manifestation; cdm:manifestation_type ?t; cdm:manifests ?a. FILTER regex(?t, "pdf")}}'

for j in 0 1 2 3 4
do
	for i in 0 1 2 3 4 5 6 7 8 9 10 11
	do
	printf "%d,%d," "$j" "$i" >> log.csv
	t=$((/usr/bin/time -f'%e' curl -G --silent --max-time '300' --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql' --data-urlencode 'query='"${query[$i]}"'' > results/sparql$i-$j.xml) 2>&1)
	printf "%s," "$t" >> log.csv
	xsltproc ../extract_bindings.xslt results/sparql$i-$j.xml >> log.csv;
	printf "\n" >> log.csv
	done
done