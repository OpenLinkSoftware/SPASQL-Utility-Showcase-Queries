LOG_ENABLE(2,1) ;

-- Cleanup

SPARQL CLEAR GRAPH <urn:equivalent:class:property:mappings> ;

SPARQL CLEAR GRAPH <https://github.com/OpenLinkSoftware/Documentation/raw/master/rdf-turtle-based-documentation/virtuoso/windows/Upgrade83GuideWindows.ttl> ;

SPARQL CLEAR GRAPH <https://github.com/OpenLinkSoftware/Documentation/raw/master/rdf-turtle-based-documentation/virtuoso/macos/Upgrade83GuideMacOSX.ttl> ;

DELETE FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:owl:equivalent:class:property:inference:rules' ;

-- Load Data

SPARQL
DEFINE get:soft "no-sponge"
LOAD <https://github.com/OpenLinkSoftware/Documentation/raw/master/rdf-turtle-based-documentation/virtuoso/windows/Upgrade83GuideWindows.ttl> ;

SPARQL
DEFINE get:soft "no-sponge"
LOAD <https://github.com/OpenLinkSoftware/Documentation/raw/master/rdf-turtle-based-documentation/virtuoso/macos/Upgrade83GuideMacOSX.ttl> ;

SPARQL
PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>
PREFIX opltwt: <http://www.openlinksw.com/schemas/twitter#>
PREFIX activity: <http://www.w3.org/ns/activitystreams#> 
PREFIX       : <#>

INSERT DATA
  {
    GRAPH <urn:equivalent:class:property:mappings>
      {
        schema:HowToStep       owl:equivalentClass opl:StepByGuide .
        opl:hasStepByGuide     rdfs:subPropertyOf  schema:step .
        opl:hasIndex           rdfs:subPropertyOf  schema:position .
        opl:hasNext            rdfs:subPropertyOf  schema:nextItem .
        opl:hasPrevious        rdfs:subPropertyOf  schema:previousItem .
        activity:Note          rdfs:subClassOf     opltwt:Tweet . 
        owl:equivalentProperty a                   owl:TransitiveProperty .
        owl:equivalentClass    a                   owl:TransitiveProperty .
        rdfs:subPropertyOf     a                   owl:TransitiveProperty .
        rdfs:subClassOf        a                   owl:TransitiveProperty .
      }
  } ;

SPARQL ADD <http://www.productontology.org/dump.rdf> TO <urn:equivalent:class:property:mappings> ;
SPARQL ADD <kbpedia_reference_concepts_linkage_inferrence_extended.n3> TO <urn:equivalent:class:property:mappings> ;
SPARQL ADD <http://mappings.dbpedia.org/server/ontology/dbpedia.owl> TO <urn:equivalent:class:property:mappings> ;
SPARQL ADD <file:kbpedia_25_reference_concepts.n3> TO <urn:equivalent:class:property:mappings>  ; 
SPARQL ADD <file:kbpedia_25_reference_concepts_linkage.n3> TO <urn:equivalent:class:property:mappings>  ; 
SPARQL ADD <file:kbpedia_25_reference_concepts_linkage_inferrence_extended.n3> TO <urn:equivalent:class:property:mappings>  ;  



SPARQL
SELECT ( COUNT ( * ) AS ?count )
FROM <urn:equivalent:class:property:mappings>
WHERE { ?s ?p ?o } ;

RDFS_RULE_SET ( 'urn:owl:equivalent:class:property:inference:rules', 'urn:equivalent:class:property:mappings' ) ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:owl:equivalent:class:property:inference:rules' ;

-- Test Query 1

SPARQL
DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT ( COUNT ( DISTINCT * ) AS ?count )
WHERE
  {
    ?s a schema:HowToStep .
  } ;

-- Test Query 1.1

SPARQL
DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT ?s
WHERE
  {
    ?s a schema:HowToStep .
  } ;

-- Test Query 1.2 Rules Disabled

SPARQL
# DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT ( COUNT ( DISTINCT * ) AS ?count )
WHERE
  {
    ?s a schema:HowToStep .
  } ;

-- Test 2

SPARQL
DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT ?s  ?o
WHERE
  {
    ?s a               schema:HowToStep ;
       schema:position ?o
  } ;

-- Test 2.1

SPARQL
# DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT ?s  ?o
WHERE 
  {
    ?s a               schema:HowToStep ;
       schema:position ?o
  } ;
                
