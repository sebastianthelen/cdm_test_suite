#!/bin/bash

#  run_test_suite.sh
#  
#
#  Created by Patrick Gratz on 13/06/14.
#
time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+SELECT+DISTINCT+%3fs+WHERE+%7b+%3fs+cdm%3aact_consolidated_consolidates_resource_legal+%3fo.+%5b%5d+owl%3aannotatedSource+%3fas%3b+owl%3aannotatedProperty+cdm%3aact_consolidated_consolidates_resource_legal.+%3fc+owl%3asameAs+%3fas%3b+owl%3asameAs+%3fo.++FILTER+(!sameTerm(%3fas%2c%3fo))+%7d' > results/sparql1.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+SELECT+(group_concat(distinct(%3fidentifier)%3b+separator%3d%22+%22)+AS+%3fids)+%3fcellarURI+WHERE+%7b+%3fcellarURI+owl%3asameAs+%3fpid.+%7b%3fpid+cdm%3awork_id_document+%3fidentifier.%7d+UNION+%7b%3fpid+cdm%3adossier_identifier+%3fidentifier.%7d%7d+GROUP+BY+%3fcellarURI+ORDER+BY+%3fids' > results/sparql2.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+PREFIX+cdma%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fannotation%23%3e+PREFIX+xsd%3a+%3chttp%3a%2f%2fwww.w3.org%2f2001%2fXMLSchema%23%3e+PREFIX+rdfs%3a%3chttp%3a%2f%2fwww.w3.org%2f2000%2f01%2frdf-schema%23%3e+select+distinct+%3fs+%3fas++WHERE+%7b+%3fs+a+cdm%3aresource_legal.+%3fcellar+owl%3asameAs+%3fs%3b+owl%3asameAs+%3fas.+FILTER+(regex(str(%3fs)%2c+%22resource%2fcelex%2f%22))+FILTER+NOT+EXISTS+%7b+%3fs+cdm%3aresource_legal_id_celex+%3fw%7d+FILTER+NOT+EXISTS+%7b+%3fas+cdm%3aresource_legal_id_celex+%3fw.+%7d+%7d' > results/sparql3.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+xsd%3a+%3chttp%3a%2f%2fwww.w3.org%2f2001%2fXMLSchema%23%3e+PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+PREFIX+dc%3a+%3chttp%3a%2f%2fpurl.org%2fdc%2felements%2f1.1%2f%3e+PREFIX+skos%3a+%3chttp%3a%2f%2fwww.w3.org%2f2004%2f02%2fskos%2fcore%23%3e+PREFIX+at%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fauthority%2f%3e+SELECT+%3fc+group_concat(distinct+%3fid%3b+separator%3d%22+%22)+WHERE+%7b++%3fs+a+cdm%3acase-law%3b+cdm%3awork_date_document+%3fdate%3b+cdm%3awork_id_document+%3fid.+%3fc+owl%3asameAs+%3fs%3b+owl%3asameAs+%3fsa.+FILTER+NOT+EXISTS+%7b+%3fs+cdm%3aecli+%3fo+%7d+FILTER+NOT+EXISTS+%7b+%3fsa+cdm%3aecli+%3fo+%7d+%7d+GROUP+BY+%3fc' > results/sparql4.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+PREFIX+cdma%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fannotation%23%3e+PREFIX+xsd%3a+%3chttp%3a%2f%2fwww.w3.org%2f2001%2fXMLSchema%23%3e+SELECT+++%3fp+(count(DISTINCT+*)+as+%3fcount)+WHERE+%7b+%3fs++%3fp+%3fo.+%3fs+cdm%3amanifestation_manifests_expression%3f%2fcdm%3aexpression_belongs_to_work%3f%2fcdm%3awork_date_document+%3fdate.+FILTER+(%3fdate+%3e+%222013-01-01%22%5e%5exsd%3adate+%26%26+%3fdate+%3c+%222014-01-01%22%5e%5exsd%3adate+)+%7d+GROUP+BY+%3fp+ORDER+BY+%3fp' > results/sparql5.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+xsd%3a+%3chttp%3a%2f%2fwww.w3.org%2f2001%2fXMLSchema%23%3e+PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+PREFIX+dc%3a+%3chttp%3a%2f%2fpurl.org%2fdc%2felements%2f1.1%2f%3e+PREFIX+skos%3a+%3chttp%3a%2f%2fwww.w3.org%2f2004%2f02%2fskos%2fcore%23%3e+PREFIX+at%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fauthority%2f%3e+SELECT+%3furi+%3fdate+%3ftitle+%3flang+%3fmtype+%3fthumbnail+(group_concat(distinct+%3fpid%3bseparator%3d%22%3b%22)+as+%3fids)+(group_concat(distinct+%3fclabel%3bseparator%3d%22%3b%22)+as+%3fcollections)+(group_concat(distinct+%3falabel%3bseparator%3d%22%3b%22)+as+%3fauthors)(group_concat(distinct+%3fslabel%3bseparator%3d%22%3b%22)+as+%3fsubjects)+(group_concat(distinct+%3fitem%3bseparator%3d%22%3b%22)+as+%3fdocuments)+%7b+SELECT+distinct+%3furi+%3fpid+%3fclabel+%3falabel+%3fslabel+%3fdate+%3ftitle+%3flang+%3fmtype+%3fitem+%3fthumbnail+WHERE+%7b+%3furi+cdm%3awork_date_document+%3fdate%3b++++cdm%3awork_part_of_collection_document+%3fcoll%3b+cdm%3awork_created_by_agent+%3fauthor%3b+cdm%3ais_about+%3fsubject%3b+cdm%3awork_id_document+%3fpid.%3fe+cdm%3aexpression_belongs_to_work+%3furi%3b+cdm%3aexpression_uses_language+%3fl%3b+cdm%3aexpression_title+%3ftitle.+%3fl+dc%3aidentifier+%3flang%3b++at%3aop-mapped-code+%3fcode%3b+skos%3aprefLabel+%3fllabel.+%3fcode+dc%3asource+%22iso-639-1%22%3b+at%3alegacy-code+%3flcode.+%3fsubject+skos%3aprefLabel+%3fslabel.+%3fcoll+skos%3aprefLabel+%3fclabel.+%3fauthor+skos%3aprefLabel+%3falabel.+%3fm+cdm%3amanifestation_manifests_expression+%3fex%3b+cdm%3amanifestation_type+%3fmtype.+%3fce+owl%3asameAs+%3fex%3b+owl%3asameAs+%3fe.+%3fcm+owl%3asameAs+%3fm%3b+cdm%3amanifestation_has_item+%3fitem.+OPTIONAL+%7b+%3fm+cdm%3amanifestation_has_thumbnail+%3fthumbnail.%7d+FILTER+(%3fdate+%3d+%222014-05-21%22%5e%5exsd%3adate)+FILTER+(lang(%3fllabel)%3d%3flcode)+FILTER+(lang(%3fslabel)%3d%3flcode)+FILTER+(lang(%3fclabel)%3d%3flcode)+FILTER+(lang(%3falabel)%3d%3flcode)+%7d%7d+GROUP+BY+%3furi+%3ftitle+%3flang+%3fdate+%3fmtype+%3fthumbnail+ORDER+BY+%3fdate+%3furi+%3flang+%3fmtype' > results/sparql6.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+PREFIX+rdfs%3a+%3chttp%3a%2f%2fwww.w3.org%2f2000%2f01%2frdf-schema%23%3e+PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+SELECT+DISTINCT+%3fclass+%3fprop+%3fdomain+WHERE+%7b++%7b+%3fprop+a+owl%3aDatatypeProperty+%7d+UNION+%7b+%3fprop+a+owl%3aObjectProperty+%7d+.+%3fclass+rdfs%3asubClassOf%2b+cdm%3aresource_legal+.+%3fclass+rdfs%3asubClassOf*+%3fdomain+.+%3fprop+rdfs%3adomain+%3fdomain+.+%7d+ORDER+BY+%3fclass+%3fdomain' > results/sparql7.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+PREFIX+rdfs%3a+%3chttp%3a%2f%2fwww.w3.org%2f2000%2f01%2frdf-schema%23%3e+PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+SELECT+DISTINCT+%3fclass+%3fprop+%3fdomain+%3fexactcard+%3fmincard+%3fmaxcard+WHERE+%7b++%7b+%3fprop+a+owl%3aDatatypeProperty+%7d++UNION++%7b+%3fprop+a+owl%3aObjectProperty+%7d+.++%3fclass+rdfs%3asubClassOf%2b+cdm%3aresource_legal+.+%3fclass+rdfs%3asubClassOf*+%3fdomain+.+%3fprop+rdfs%3adomain+%3fdomain+.+OPTIONAL+%7b++%3fs1+owl%3aonProperty+%3fprop+%3b+owl%3acardinality+%3fexactcard+.+%7d++OPTIONAL+%7b%3fs2+owl%3aonProperty+%3fprop+%3b+owl%3amaxCardinality+%3fmaxcard+.++%7d+OPTIONAL+%7b++%3fs3+owl%3aonProperty+%3fprop+%3b+owl%3aminCardinality+%3fmincard+.+%7d%7d+ORDER+BY+%3fclass+%3fdomain+%3fprop' > results/sparql8.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+xsd%3a+%3chttp%3a%2f%2fwww.w3.org%2f2001%2fXMLSchema%23%3e+SELECT+DISTINCT+%3foj+%3fact+%3fcelex+%3fmanif+%3fpage_first+%3fpage_last+%3fdate_pub+%3foj_id++WHERE+%7b+%3fact+cdm%3apublished_in+%3foj+.+%3foj+cdm%3aidentifier+%3foj_id+.+%3foj+cdm%3aofficial-journal_year++%3fd+.+%3fact+cdm%3awork_has_expression+%3fexpr+.+%3fexpr+cdm%3aexpression_uses_language+%3chttp%3a%2f%2fpublications.europa.eu%2fresource%2fauthority%2flanguage%2fENG%3e+.+%3fmanif+cdm%3amanifests+%3fexpr+.%3fmanif+cdm%3amanifestation_type+%22print%22%5e%5exsd%3astring+.+%3fmanif+cdm%3apage_first+%3fpage_first+.+%3fmanif+cdm%3apage_last+%3fpage_last+.+%3foj+cdm%3adate_publication+%3fdate_pub+.+OPTIONAL+%7b%3fact+cdm%3aid_celex+%3fcelex+%7d+.+FILTER+(+%3fdate_pub+%3e%3d+%222011-12-31%22%5e%5exsd%3adate)+FILTER+(+%3fdate_pub+%3c%3d+%222013-01-01%22%5e%5exsd%3adate)+FILTER+regex(%3foj_id%2c+%22%5eoj%3a%22%2c+%22i%22)+%7d' > results/sparql9.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+xsd%3a+%3chttp%3a%2f%2fwww.w3.org%2f2001%2fXMLSchema%23%3e+SELECT+DISTINCT+%3foj+%3fact+%3fcelex+%3fmanif+%3fpage_first+%3fpage_last+%3fdate_pub+%3foj_id+WHERE+%7b+%3fact+cdm%3apublished_in+%3foj.+%3foj+cdm%3aidentifier+%3foj_id.+%3foj+cdm%3aofficial-journal_number++%22337%22%5e%5exsd%3apositiveInteger.+%3foj+cdm%3apart_of+%3chttp%3a%2f%2fpublications.europa.eu%2fresource%2fauthority%2fdocument-collection%2fOJ-C%3e.+%3fact+cdm%3awork_has_expression+%3fexpr.+%3fexpr+cdm%3aexpression_uses_language+%3chttp%3a%2f%2fpublications.europa.eu%2fresource%2fauthority%2flanguage%2fENG%3e.+%3fmanif+cdm%3amanifests+%3fexpr+.+%3fmanif+cdm%3amanifestation_type+%22print%22%5e%5exsd%3astring.+%3fmanif+cdm%3apage_first+%3fpage_first.+%3fmanif+cdm%3apage_last+%3fpage_last.+%3foj+cdm%3adate_publication+%3fdate_pub.+OPTIONAL+%7b%3fact+cdm%3aid_celex+%3fcelex+%7d.+FILTER+regex(%3foj_id%2c+%22%5eoj%3a%22%2c+%22i%22)+%7d' > results/sparql10.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+select+distinct+%3furi+WHERE+%7b+%3furi+cdm%3awork_date_document+%3fd.+FILTER+NOT+EXISTS+%7b+%3furi+cdm%3awork_date_creation_legacy+%3fcd+%7d+%7d+order+by+%3furi' > results/sparql11.json

time curl -G --silent --header "Accept: application/sparql-results+xml" 'http://opsrv603:8282/joseki/sparql?query=PREFIX+ORACLE_SEM_FS_NS%3A+%3Chttp%3A%2F%2Foracle.com%2Fsemtech%23timeout%3D300%2Cqid%3D123%3E+PREFIX+cdm%3a+%3chttp%3a%2f%2fpublications.europa.eu%2fontology%2fcdm%23%3e+PREFIX+owl%3a+%3chttp%3a%2f%2fwww.w3.org%2f2002%2f07%2fowl%23%3e+PREFIX+xsd%3a+%3chttp%3a%2f%2fwww.w3.org%2f2001%2fXMLSchema%23%3e%0d%0aSELECT+distinct+%3fa+WHERE+%7b+%3fa+a+cdm%3aexpression%3b+cdm%3amanifested_by+%3fb%3b+cdm%3abelongs_to+%3fw.+%3fw+cdm%3awork_date_document+%3fd.+FILTER+(+%3fd+%3e+%222011-12-31%22%5e%5exsd%3adate)+%7b%3fb+a+cdm%3amanifestation_official-journal%7d+UNION+%7b%3fb+a+cdm%3amanifestation_official-journal_part%7d+MINUS+%7b%3fc+a+cdm%3amanifestation%3b+cdm%3amanifestation_type+%3ft%3b+cdm%3amanifests+%3fa.+FILTER+regex(%3ft%2c+%22pdf%22)%7d%7d' > results/sparql12.json


for i in `seq 1 12`;
do
    xsltproc -o results/normalized_sparql$i.json ../extract_bindings.xslt results/sparql$i.json;
	TMP=`cat results/normalized_sparql$i.json | tr -d " \t\n"`;
    printf "$TMP\n" > results/tmp.json && mv results/tmp.json results/normalized_sparql$i.json
done
