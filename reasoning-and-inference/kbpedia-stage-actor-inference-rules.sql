SPARQL CLEAR GRAPH <urn:qa:ifr:kbpedia:stage-actor:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:stage-actor:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:stage-actor:abox>;

-- Built-in inference rules

DELETE
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:stage-actor:owl:equivalent:class:subproperty:inference:rules' ;

SPARQL
DELETE {
         GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> 
            {
              #<http://kbpedia.org/kko/rc/ActorInPlays> owl:equivalentClass <http://www.wikidata.org/entity/Q2259451> .
              <http://www.wikidata.org/entity/Q2259451> owl:equivalentClass <http://kbpedia.org/kko/rc/ActorInPlays> .

            }
        } ;

SPARQL
INSERT {
         GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> 
            {
                <http://kbpedia.org/kko/rc/ActorInPlays> owl:equivalentClass <http://www.wikidata.org/entity/Q2259451> .
               #<http://www.wikidata.org/entity/Q2259451> owl:equivalentClass <http://kbpedia.org/kko/rc/ActorInPlays> .
                <http://www.wikidata.org/prop/direct/P106> rdfs:subPropertyOf rdf:type .
                owl:equivalentProperty a owl:TransitiveProperty . 
                owl:equivalentClass a owl:TransitiveProperty.  
                rdfs:subPropertyOf a owl:TransitiveProperty .
                rdfs:subClassOf a owl:TransitiveProperty . 
            }
       } ;

RDFS_RULE_SET ('urn:kbpedia:stage-actor:owl:equivalent:class:subproperty:inference:rules', 'https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip') ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:stage-actor:owl:equivalent:class:subproperty:inference:rules' ;

-- Tests

-- 1.1 Test using class kbpedia:Comedian


SPARQL
DEFINE input:inference 'urn:kbpedia:stage-actor:owl:equivalent:class:subproperty:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>


SELECT COUNT(*)
WHERE {
                ?s a kbpedia:Comedian .
          } ;


-- Test 1.2: without reasoning

SPARQL
# DEFINE input:inference 'urn:kbpedia:stage-actor:owl:equivalent:class:subproperty:inference:rules'
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
                ?s a kbpedia:Comedian .
          } ;

-- Tests

-- 2.1 Test using class wdt:Q2259451

SPARQL
DEFINE input:inference 'urn:kbpedia:stage-actor:owl:equivalent:class:subproperty:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>


SELECT COUNT(*)
WHERE {
                ?s a <http://www.wikidata.org/entity/Q2259451> .
          } ;

-- Test 2.2: without reasoning
SPARQL
# DEFINE input:inference 'urn:kbpedia:stage-actor:owl:equivalent:class:subproperty:inference:rules'
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
                ?s a <http://www.wikidata.org/entity/Q2259451> .
          } ;