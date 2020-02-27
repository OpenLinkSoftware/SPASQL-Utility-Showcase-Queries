-- SPARQL CLEAR GRAPH <http://www.openlinksw.com/data/turtle/ontology_mappings/schemas_mappings/SchemaOrgToOpenLink.ttl> ;
-- SPARQL CLEAR GRAPH <http://www.productontology.org/dump.rdf> ;
-- SPARQL CLEAR GRAPH <http://mappings.dbpedia.org/server/ontology/dbpedia.owl> ;

DELETE FROM DB.DBA.SYS_RDF_SCHEMA 
WHERE RS_NAME = 'urn:owl:equivalent:class:inference:rules' ; 

SPARQL DEFINE get:soft "no-sponge" LOAD <http://www.openlinksw.com/data/turtle/ontology_mappings/schemas_mappings/SchemaOrgToOpenLink.ttl> ;
SPARQL DEFINE get:soft "no-sponge" LOAD <http://www.productontology.org/dump.rdf> ;
SPARQL DEFINE get:soft "no-sponge" LOAD <http://mappings.dbpedia.org/server/ontology/dbpedia.owl> ;

SPARQL
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX : <#>

INSERT DATA {
				GRAPH <http://www.openlinksw.com/data/turtle/ontology_mappings/schemas_mappings/SchemaOrgToOpenLink.ttl> 
				{
					foaf:Organization owl:equivalentClass schema:Organization .
					foaf:Person owl:equivalentClass schema:Person .
					foaf:Person owl:equivalentClass fibo:person .
				}
};

SPARQL ADD <http://www.productontology.org/dump.rdf> TO <http://www.openlinksw.com/data/turtle/ontology_mappings/schemas_mappings/SchemaOrgToOpenLink.ttl> ;
SPARQL ADD <kbpedia_reference_concepts_linkage_inferrence_extended.n3> TO <http://www.openlinksw.com/data/turtle/ontology_mappings/schemas_mappings/SchemaOrgToOpenLink.ttl> ; 
SPARQL ADD <http://mappings.dbpedia.org/server/ontology/dbpedia.owl> TO <http://www.openlinksw.com/data/turtle/ontology_mappings/schemas_mappings/SchemaOrgToOpenLink.ttl> ; 


SPARQL 

SELECT * 
FROM <http://www.openlinksw.com/data/turtle/ontology_mappings/schemas_mappings/SchemaOrgToOpenLink.ttl>
WHERE {?s ?p ?o} ;

RDFS_RULE_SET ('urn:owl:equivalent:class:inference:rules', 'http://www.openlinksw.com/data/turtle/ontology_mappings/schemas_mappings/SchemaOrgToOpenLink.ttl') ;

SELECT * 
FROM DB.DBA.SYS_RDF_SCHEMA 
WHERE RS_NAME = 'urn:owl:equivalent:class:inference:rules' ; 


-- Test Query 1 

SPARQL

DEFINE input:inference 'urn:owl:equivalent:class:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>


SELECT DISTINCT count(*)
WHERE {
		?s a foaf:Person .

      } ;

-- Test Query 2 Rules Disabled

SPARQL

# DEFINE input:inference 'urn:owl:equivalent:class:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

SELECT DISTINCT count(*)
WHERE {
		?s a foaf:Person .

      } ;

-- Test Query 3

SPARQL

DEFINE input:inference 'urn:owl:equivalent:class:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>


SELECT DISTINCT count(*)
WHERE {
		?s a schema:Organization .

      } ;

-- Test Query 4 Rules Disabled

SPARQL

# DEFINE input:inference 'urn:owl:equivalent:class:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

SELECT DISTINCT count(*)
WHERE {
		?s a schema:Organization .

      } ;

-- Test Query 5 

SPARQL

DEFINE input:inference 'urn:owl:equivalent:class:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>


SELECT DISTINCT count(*)
WHERE {
		?s a fibo:person .

      } ;


-- Test Query 6 

SPARQL

# DEFINE input:inference 'urn:owl:equivalent:class:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>


SELECT DISTINCT count(*)
WHERE {
		?s a fibo:person .

      } ;
