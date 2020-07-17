DELETE
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules' ;

SPARQL

PREFIX wdt: <http://www.wikidata.org/prop/direct/> 
INSERT {
         GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concecepts_linkage_inferrence_extended.n3> 
            {
                wdt:P106 owl:equivalentProperty rdf:type .
                owl:equivalentProperty a owl:TransitiveProperty . 
                owl:equivalentClass a owl:TransitiveProperty . 
                rdfs:subPropertyOf a owl:TransitiveProperty .
                rdfs:subClassOf a owl:TransitiveProperty . 
            }
       } ;

RDFS_RULE_SET ('urn:kbpedia:owl:equivalent:class:subproperty:inference:rules', 'https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concecepts_linkage_inferrence_extended.n3') ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules' ;

-- Tests
-- 1.0

SPARQL
DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>


SELECT COUNT(*)
WHERE {
                ?s a kbpedia:Actor .
          } ;

-- 1.2
SPARQL
# DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
                ?s a kbpedia:Actor .
          } ;

-- 2.1 Test using class kbpedia:Actor


SPARQL
DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>


SELECT *
WHERE {
                ?s a kbpedia:Actor .
          } ;


-- Test 2.2: without reasoning

SPARQL
# DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT *
WHERE {
                ?s a kbpedia:Actor .
          } ;

