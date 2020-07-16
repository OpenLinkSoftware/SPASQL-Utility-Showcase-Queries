DELETE
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules' ;

SPARQL
INSERT {
         GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> 
            {
                <http/www.wikidata.org/prop/direct/P31> owl:equivalentProperty rdf:type .
                owl:equivalentProperty a owl:TransitiveProperty . 
                owl:equivalentClass a owl:TransitiveProperty . 
                rdfs:subPropertyOf a owl:TransitiveProperty .
                rdfs:subClassOf a owl:TransitiveProperty . 
            }
       } ;

RDFS_RULE_SET ('urn:kbpedia:owl:equivalent:class:subproperty:inference:rules', 'https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip') ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules' ;

-- Tests


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
