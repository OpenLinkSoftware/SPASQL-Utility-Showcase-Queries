-- Cleanup 

SPARQL 
CLEAR GRAPH <urn:covid19:data:meshup> ;

SPARQL

CLEAR GRAPH <urn:covid19:meshup:demo> ;

DELETE
FROM sys_rdf_schema
WHERE RS_NAME = 'urn:covid19:meshup:ifp:rule'  ;


-- Adding IFP Relations to Meshup Named Graph

SPARQL

PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX schema: <http://schema.org/> 
PREFIX owl:    <http://www.w3.org/2002/07/owl#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX testing-2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2#> 
PREFIX nextstrain: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#> 
PREFIX sarscov2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#> 
PREFIX nextstrain-ncov: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv#> 


INSERT DATA INTO  <urn:covid19:data:meshup> { 
											   consolidated:id owl:equivalentProperty testing-2:dbpedia_country_id, nextstrain:dbpedia_country_id ;
                                                                            a owl:InverseFunctionalProperty ;
                                                                            rdfs:subPropertyOf lod:ifp_like .

                                               nextstrain:genebank_accession owl:equivalentProperty sarscov2:Accession, nextstrain-ncov:genebank_accession ;
                                                                            a owl:InverseFunctionalProperty ;
                                                                            rdfs:subPropertyOf lod:ifp_like .

											}  ;

-- Make Rule

RDFS_RULE_SET
   (
        'urn:covid19:meshup:ifp:rule' ,'urn:covid19:data:meshup'
   ) ;

-- Verify Rule Creation

SELECT RS_NAME
FROM sys_rdf_schema
WHERE RS_NAME = 'urn:covid19:meshup:ifp:rule'  ;



--  Test 1

SPARQL

DEFINE input:inference 'urn:covid19:meshup:ifp:rule' 

PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX schema: <http://schema.org/> 
PREFIX owl:    <http://www.w3.org/2002/07/owl#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX testing-2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2#> 
PREFIX nextstrain: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#> 
PREFIX sarscov2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#> 

SELECT DISTINCT ?s ?p ?o 
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry>
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#row%3D1311> ?p ?o.
        BIND (<https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#row%3D1311> as ?s) 
      } 
LIMIT 100 ;

--  Test 2

SPARQL

# DEFINE input:inference 'urn:covid19:meshup:ifp:rule' 

PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX schema: <http://schema.org/> 
PREFIX owl:    <http://www.w3.org/2002/07/owl#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX testing-2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2#> 
PREFIX nextstrain: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#> 
PREFIX sarscov2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#> 

SELECT DISTINCT ?s ?p ?o 
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry>
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#row%3D1311> ?p ?o.
        BIND (<https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#row%3D1311> as ?s) 
      } 
LIMIT 100 ;

--  Test 3

SPARQL

DEFINE input:inference 'urn:covid19:meshup:ifp:rule' 

PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX schema: <http://schema.org/> 
PREFIX owl:    <http://www.w3.org/2002/07/owl#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX testing-2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2#> 
PREFIX nextstrain: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#> 
PREFIX sarscov2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#> 

SELECT DISTINCT ?s ?p ?o 
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry>
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#row%3D25> ?p ?o.
        BIND (<https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#row%3D25> as ?s) 
      } 
LIMIT 100 ;

--  Test 4

SPARQL

# DEFINE input:inference 'urn:covid19:meshup:ifp:rule' 

PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX schema: <http://schema.org/> 
PREFIX owl:    <http://www.w3.org/2002/07/owl#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX testing-2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2#> 
PREFIX nextstrain: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#> 
PREFIX sarscov2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#> 

SELECT DISTINCT ?s ?p ?o 
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry>
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#row%3D25> ?p ?o.
        BIND (<https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#row%3D25> as ?s) 
      } 
LIMIT 100 ;

-- Test 5

SPARQL

DEFINE input:inference 'urn:covid19:meshup:ifp:rule' 

PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX schema: <http://schema.org/> 
PREFIX owl:    <http://www.w3.org/2002/07/owl#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX testing-2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2#> 
PREFIX nextstrain: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#> 
PREFIX sarscov2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#> 

SELECT DISTINCT ?s ?p ?o 
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry>
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#row%3D626> ?p ?o.
        BIND (<https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#row%3D626> as ?s) 
      } 
LIMIT 100 ;

-- Test 6

SPARQL

# DEFINE input:inference 'urn:covid19:meshup:ifp:rule' 

PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX schema: <http://schema.org/> 
PREFIX owl:    <http://www.w3.org/2002/07/owl#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX testing-2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2#> 
PREFIX nextstrain: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#> 
PREFIX sarscov2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#> 

SELECT DISTINCT ?s ?p ?o 
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain>
FROM <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry>
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#row%3D626> ?p ?o.
        BIND (<https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#row%3D626> as ?s) 
      } 
LIMIT 100 ;
