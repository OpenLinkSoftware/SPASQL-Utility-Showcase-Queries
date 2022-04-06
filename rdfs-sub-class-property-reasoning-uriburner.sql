-- Cleanup

SPARQL CLEAR GRAPH <urn:rdfs:subclass:subproperty:mappings> ;

SPARQL CLEAR GRAPH <https://github.com/OpenLinkSoftware/Documentation/raw/master/rdf-turtle-based-documentation/virtuoso/windows/Upgrade83GuideWindows.ttl> ;

SPARQL CLEAR GRAPH <https://github.com/OpenLinkSoftware/Documentation/raw/master/rdf-turtle-based-documentation/virtuoso/macos/Upgrade83GuideMacOSX.ttl> ;

DELETE FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:rdfs:subclass:subproperty:inference:rules' ;

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
PREFIX       : <#>

INSERT DATA
  {
    GRAPH <urn:rdfs:subclass:subproperty:mappings>
      {
        schema:SearchAction rdfs:subClassOf    schema:Action . 
		opl:Step            rdfs:subClassOf    schema:HowToStep .
        opl:hasStepByGuide  rdfs:subPropertyOf schema:step .
        opl:hasIndex        rdfs:subPropertyOf schema:position .
        opl:hasNext         rdfs:subPropertyOf schema:nextItem .
        opl:hasPrevious     rdfs:subPropertyOf schema:previousItem .
        rdfs:subPropertyOf  a                  owl:TransitiveProperty .
        rdfs:subClassOf     a                  owl:TransitiveProperty .
        owl:equivalentClass a                  owl:TransitiveProperty .
      }
  } ;

SPARQL
SELECT ( COUNT ( * ) AS ?count )
FROM <urn:rdfs:subclass:subproperty:mappings>
WHERE { ?s ?p ?o } ;

RDFS_RULE_SET ( 'urn:rdfs:subclass:subproperty:inference:rules', 'urn:rdfs:subclass:subproperty:mappings' ) ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:rdfs:subclass:subproperty:inference:rules' ;

-- Test Query 1

SPARQL

DEFINE input:inference 'urn:rdfs:subclass:subproperty:inference:rules'

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

-- Test Query 1.1 Rules Disabled

SPARQL

# DEFINE input:inference 'urn:rdfs:subclass:subproperty:inference:rules'

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
# DEFINE get:soft "soft"
DEFINE input:inference 'urn:rdfs:subclass:subproperty:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT ?s  ?o
# FROM <http://kingsley.idehen.net/public_home/kidehen/Public/Linked%20Data%20Documents/describing-virtuoso-72-windows-installation-steps.ttl> 
WHERE {
        ?s a schema:HowToStep ;
           schema:position ?o
      } ;

-- Test 2.1

SPARQL

# DEFINE input:inference 'urn:rdfs:subclass:subproperty:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT ?s  ?o
# FROM <http://kingsley.idehen.net/public_home/kidehen/Public/Linked%20Data%20Documents/describing-virtuoso-72-windows-installation-steps.ttl> 
WHERE
  {
    ?s a schema:HowToStep ;
       schema:position ?o
  } ;


-- Test 3

SPARQL

DEFINE input:inference 'urn:rdfs:subclass:subproperty:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT COUNT (*) 
WHERE {
        ?s a schema:Action .
      }  ;

-- Test 3.1

SPARQL

# DEFINE input:inference 'urn:rdfs:subclass:subproperty:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT COUNT (*) 
WHERE {
        ?s a schema:Action .
      }  ;

-- Test 3.2

SPARQL

DEFINE input:inference 'urn:rdfs:subclass:subproperty:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT ?name  
WHERE {
        ?s a schema:Action ;
		   schema:name ?name . 
		FILTER (CONTAINS(?name,"Search"))
      } 
LIMIT 50 ;


-- Test 3.3

SPARQL

# DEFINE input:inference 'urn:rdfs:subclass:subproperty:inference:rules'

PREFIX    owl: <http://www.w3.org/2002/07/owl#>
PREFIX   rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX    bmo: <http://purl.org/bmo/ns#>
PREFIX   fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX   foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/>
PREFIX    opl: <http://www.openlinksw.com/ontology/stepbyguide#>

SELECT DISTINCT ?name  
WHERE {
        ?s a schema:Action ;
		   schema:name ?name . 
		FILTER (CONTAINS(?name,"Search"))
      }  
LIMIT 50 ;
