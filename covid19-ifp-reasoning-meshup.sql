-- Cleanup 

SPARQL 
CLEAR GRAPH <urn:covid19:data:meshup> ;

DELETE
FROM sys_rdf_schema
WHERE RS_NAME = 'urn:covid19:meshup:ifp:rule'  ;


-- Adding IFP Relations to Meshup NamedGRAPH

SPARQL

PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX schema: <http://schema.org/> 
PREFIX owl:    <http://www.w3.org/2002/07/owl#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX testing-2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2#> 
# PREFIX nextstrain: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#> 
PREFIX nextstrain-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#> 
PREFIX sarscov2: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry#> 
# PREFIX nextstrain-ncov: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv#> 
PREFIX dbpedia-iso-mappings: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=DBpedia_Country_ISO_Code_Mappings#> 
PREFIX us-covid-tracker-daily: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#> 
PREFIX us-covid-tracker-todate: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_To_Date#> 

INSERT { 
         GRAPH <urn:covid19:data:meshup> { 
                                            consolidated:id owl:equivalentProperty testing-2:dbpedia_country_id, nextstrain-csv:dbpedia_country_id .
                                                            # a owl:InverseFunctionalProperty ;
                                                            # rdfs:subPropertyOf lod:ifp_like .

                                            dbpedia-iso-mappings:code owl:equivalentProperty us-covid-tracker-daily:iso_code, us-covid-tracker-todate:iso_code .

                                            nextstrain-csv:genebank_accession owl:equivalentProperty sarscov2:Accession ;
                                                                      a owl:InverseFunctionalProperty ;
                                                                      rdfs:subPropertyOf lod:ifp_like .

                                            consolidated:class owl:equivalentClass nextstrain-csv:class, testing-2:class .
											                    }  
        };

-- Make Rule

RDFS_RULE_SET
   (
        'urn:covid19:meshup:ifp:rule' ,'urn:covid19:data:meshup'
   ) ;

-- Verify Rule Creation

SELECT RS_NAME
FROM sys_rdf_schema
WHERE RS_NAME = 'urn:covid19:meshup:ifp:rule'  ;

-- Aesthetic Rules for /about and /describe services where an annotation property
-- is designated at the preferred entity label

SPARQL

PREFIX nextstrain-sheet-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#> 
PREFIX nextstrain-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#>
PREFIX worldometer: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=worldometers&range=A3:K168#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv#> 
PREFIX wikipedia: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Wikipedia_Testing_By_Country#>

INSERT INTO GRAPH <virtrdf-label> 

{
  nextstrain-sheet-csv:strain rdfs:subPropertyOf  virtrdf:label  .
  nextstrain-sheet:strain rdfs:subPropertyOf  virtrdf:label  .
  worldometer:Country__Other rdfs:subPropertyOf  virtrdf:label  .
  consolidated:location rdfs:subPropertyOf  virtrdf:label  .
  nextstrain-metadata-tsv:strain rdfs:subPropertyOf  virtrdf:label  .
  wikipedia:Country_or_region rdfs:subPropertyOf  virtrdf:label  .
} ;

rdfs_rule_set ('virtrdf-label', 'virtrdf-label');
p_score_init ();

SPARQL

PREFIX nextstrain-sheet-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#> 
PREFIX nextstrain-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain#>
PREFIX worldometer: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=worldometers&range=A3:K168#>
PREFIX consolidated: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#>
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv#> 
PREFIX wikipedia: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Wikipedia_Testing_By_Country#>

INSERT INTO GRAPH <facets> 

  {
    nextstrain-sheet-csv:strain rdfs:subPropertyOf  virtrdf:label  .
    nextstrain-sheet:strain rdfs:subPropertyOf  virtrdf:label  .
    worldometer:Country__Other rdfs:subPropertyOf  virtrdf:label  .
    consolidated:location rdfs:subPropertyOf  virtrdf:label  .
    nextstrain-metadata-tsv:strain rdfs:subPropertyOf  virtrdf:label  .
    wikipedia:Country_or_region rdfs:subPropertyOf  virtrdf:label  .
  } ;

--Making the rule from theGRAPH:
rdfs_rule_set ('facets', 'facets');

-- extend to other rules e.g. facet using virtrdf-label rule.

rdfs_rule_set ('facets', 'virtrdf-label');

-- verify rule existence

SELECT rs_name FROM sys_rdf_schema
WHERE rs_name = 'facets' OR rs_name = 'virtrdf-label' ;

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
PREFIX consolidated-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
PREFIX testing-2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2> 
# PREFIX nextstrain-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain> 
PREFIX nextstrain-sheet-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv> 
PREFIX sarscov2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry> 
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv> 

SELECT DISTINCT ?s ?p iri(?o)
FROM testing-2-sheet:
FROM consolidated-sheet:
# FROM nextstrain-sheet:
FROM nextstrain-sheet-csv:
FROM sarscov2-sheet:
FROM nextstrain-metadata-tsv:
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#row%3D1311> 
        nextstrain-sheet-csv:dbpedia_country_id ?o.
        BIND (nextstrain-sheet-csv:dbpedia_country_id as ?p)
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
PREFIX consolidated-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
PREFIX testing-2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2> 
# PREFIX nextstrain-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain> 
PREFIX nextstrain-sheet-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv> 
PREFIX sarscov2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry> 
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv> 

SELECT DISTINCT ?s ?p iri(?o)
FROM testing-2-sheet:
FROM consolidated-sheet:
# FROM nextstrain-sheet:
FROM nextstrain-sheet-csv:
FROM sarscov2-sheet:
FROM nextstrain-metadata-tsv:
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated#row%3D1311> 
        nextstrain-sheet-csv:dbpedia_country_id ?o.
        BIND (nextstrain-sheet-csv:dbpedia_country_id as ?p)
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
PREFIX consolidated-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
PREFIX testing-2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2> 
# PREFIX nextstrain-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv> 
PREFIX nextstrain-sheet-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv> 
PREFIX sarscov2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry> 
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv> 

SELECT DISTINCT ?s ?p ?o 
FROM testing-2-sheet:
FROM consolidated-sheet:
# FROM nextstrain-sheet:
FROM nextstrain-sheet-csv:
FROM sarscov2-sheet:
FROM nextstrain-metadata-tsv:
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#row%3D737> ?p ?o.
        BIND (<https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#row%3D737> as ?s) 
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
PREFIX consolidated-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
PREFIX testing-2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2> 
# PREFIX nextstrain-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv> 
PREFIX nextstrain-sheet-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv> 
PREFIX sarscov2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry> 
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv> 

SELECT DISTINCT ?s ?p ?o 
FROM testing-2-sheet:
FROM consolidated-sheet:
# FROM nextstrain-sheet:
FROM nextstrain-sheet-csv:
FROM sarscov2-sheet:
FROM nextstrain-metadata-tsv:
WHERE { 
        <https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#row%3D737> ?p ?o.
        BIND (<https://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#row%3D737> as ?s) 
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
PREFIX consolidated-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
PREFIX testing-2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2> 
PREFIX nextstrain-sheet-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv> 
# PREFIX nextstrain-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain> 
PREFIX sarscov2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry> 
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv>  

SELECT DISTINCT ?s AS ?entity ?p AS ?attribute ?o2 AS ?value 
FROM testing-2-sheet:
FROM consolidated-sheet:
# FROM nextstrain-sheet:
FROM nextstrain-sheet-csv:
FROM sarscov2-sheet:
FROM nextstrain-metadata-tsv:
WHERE { 
        <http://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#row%3D1312> ?p ?o.
        FILTER (CONTAINS(STR(?p),'csv'))
        BIND (<http://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#row%3D1312> as ?s) 
        BIND (IF (CONTAINS(STR(?o),'http'),IRI(?o),?o) AS ?o2)
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
PREFIX consolidated-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Consolidated>
PREFIX testing-2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=Testing_By_Country2> 
PREFIX nextstrain-sheet-csv: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv> 
# PREFIX nextstrain-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain> 
PREFIX sarscov2-sheet: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=SARS_COV_2_Ancestry> 
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv>  

SELECT DISTINCT ?s AS ?entity ?p AS ?attribute ?o2 AS ?value 
FROM testing-2-sheet:
FROM consolidated-sheet:
# FROM nextstrain-sheet:
FROM nextstrain-sheet-csv:
FROM sarscov2-sheet:
FROM nextstrain-metadata-tsv:
WHERE { 
        <http://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#row%3D1312> ?p ?o.
        FILTER (CONTAINS(STR(?p),'csv'))
        BIND (<http://linkeddata.uriburner.com/about/id/entity/https/docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=nextstrain_csv#row%3D1312> as ?s) 
        BIND (IF (CONTAINS(STR(?o),'http'),IRI(?o),?o) AS ?o2)
      } 
LIMIT 100 ;

-- Test 7
SPARQL

DEFINE input:inference 'urn:covid19:meshup:ifp:rule' 

PREFIX dbpedia-iso-mappings: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=DBpedia_Country_ISO_Code_Mappings#> 
PREFIX us-covid-tracker-daily: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#> 
PREFIX us-covid-tracker-todate: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_To_Date#> 

SELECT xsd:dateTime(?s16) AS ?dateChecked
       xsd:string(?s15) AS ?state
       xsd:integer(?s2) AS ?total
       xsd:integer(?s3) AS ?totalTestResults
       xsd:integer(?s4) AS ?totalTestResultsIncrease
       xsd:integer(?s5) AS ?negativeIncrease
       xsd:integer(?s6) AS ?negative
       xsd:integer(?s7) AS ?positive
       xsd:integer(?s8) AS ?positiveIncrease
       xsd:integer(?s9) AS ?pending
       xsd:integer(?s8) AS ?hospitalizedIncrease
       xsd:integer(?s9) AS ?hospitalized
       xsd:integer(?s10) AS ?death
       xsd:integer(?s10) AS ?deathIncrease
       ?code 
       ?dbpediaID
       ?s1 AS ?id 
FROM NAMED <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily>
FROM NAMED <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=DBpedia_Country_ISO_Code_Mappings>
WHERE 
  { 
    GRAPH <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily>
      {
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#total> ?s2}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#totalTestResults> ?s3}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#totalTestResultsIncrease> ?s4}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#negativeIncrease> ?s5}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#negative> ?s6}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#positive> ?s7}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#positiveIncrease> ?s8}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#pending> ?s9}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#death> ?s10}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#hospitalizedIncrease> ?s11}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#hospitalized> ?s12}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#deathIncrease> ?s13}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#iso_code> ?s14}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#state> ?s15}  . 
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#dateChecked> ?s16}  . 
          OPTIONAL {?s1 dbpedia-iso-mappings:code ?code } .

          # FILTER ( ?code = ?s14) . 
      }

     GRAPH <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=DBpedia_Country_ISO_Code_Mappings>
             {
                   OPTIONAL {
                              ?s2 dbpedia-iso-mappings:state ?dbpediaID; dbpedia-iso-mappings:code ?code.
                              FILTER ( ?code = ?s14) . 
                            } .
            }

  }
ORDER BY DESC 1 5
LIMIT 20 ;

-- Test 8

SPARQL

# DEFINE input:inference 'urn:covid19:meshup:ifp:rule' 

PREFIX dbpedia-iso-mappings: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=DBpedia_Country_ISO_Code_Mappings#> 
PREFIX us-covid-tracker-daily: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#> 
PREFIX us-covid-tracker-todate: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_To_Date#> 

SELECT xsd:dateTime(?s16) AS ?dateChecked
       xsd:string(?s15) AS ?state
       xsd:integer(?s2) AS ?total
       xsd:integer(?s3) AS ?totalTestResults
       xsd:integer(?s4) AS ?totalTestResultsIncrease
       xsd:integer(?s5) AS ?negativeIncrease
       xsd:integer(?s6) AS ?negative
       xsd:integer(?s7) AS ?positive
       xsd:integer(?s8) AS ?positiveIncrease
       xsd:integer(?s9) AS ?pending
       xsd:integer(?s8) AS ?hospitalizedIncrease
       xsd:integer(?s9) AS ?hospitalized
       xsd:integer(?s10) AS ?death
       xsd:integer(?s10) AS ?deathIncrease
       ?code
       ?s1 AS ?id 
FROM NAMED <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily>
FROM NAMED <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=DBpedia_Country_ISO_Code_Mappings>
WHERE 
  { 
    GRAPH <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily>
      {
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#total> ?s2}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#totalTestResults> ?s3}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#totalTestResultsIncrease> ?s4}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#negativeIncrease> ?s5}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#negative> ?s6}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#positive> ?s7}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#positiveIncrease> ?s8}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#pending> ?s9}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#death> ?s10}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#hospitalizedIncrease> ?s11}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#hospitalized> ?s12}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#deathIncrease> ?s13}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#iso_code> ?s14}  .
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#state> ?s15}  . 
          OPTIONAL {?s1 <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=US_State_Tracker_Daily#dateChecked> ?s16}  . 
          OPTIONAL {?s1 dbpedia-iso-mappings:code ?code } .

          # FILTER ( ?code = ?s14) . 
      }

     GRAPH <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&sheet=DBpedia_Country_ISO_Code_Mappings>
             {
                   OPTIONAL {
                              ?s2 dbpedia-iso-mappings:state ?dbpediaID; dbpedia-iso-mappings:code ?code.
                              FILTER ( ?code = ?s14) . 
                            } .
            }

  }
ORDER BY DESC 1 5
LIMIT 20 ;
