SPARQL CLEAR GRAPH <urn:equivalent:class:property:mappings> ;

DELETE FROM DB.DBA.SYS_RDF_SCHEMA 
WHERE RS_NAME = 'urn:owl:equivalent:class:property:inference:rules' ; 


SPARQL
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/> 
PREFIX opl: <http://www.openlinksw.com/ontology/stepbyguide#> 
PREFIX : <#>

INSERT DATA {
				GRAPH <urn:equivalent:class:property:mappings> 
				{
					foaf:Organization owl:equivalentClass schema:Organization .
					foaf:Person owl:equivalentClass schema:Person .
					foaf:Person owl:equivalentClass fibo:person .
					schema:HowToStep owl:equivalentClass opl:StepByGuide . 
					schema:step owl:equivalentProperty opl:hasStep . 
					schema:position owl:equivalentProperty opl:hasIndex . 
					schema:nextItem owl:equivalentProperty opl:hasNext .
					schema:previousItem owl:equivalentProperty opl:hasPrevious .
					owl:equivalentProperty a owl:TransitiveProperty . 
				}
};

SPARQL ADD <http://www.productontology.org/dump.rdf> TO <urn:equivalent:class:property:mappings> ;
SPARQL ADD <kbpedia_reference_concepts_linkage_inferrence_extended.n3> TO <urn:equivalent:class:property:mappings> ; 
SPARQL ADD <http://mappings.dbpedia.org/server/ontology/dbpedia.owl> TO <urn:equivalent:class:property:mappings> ; 
SPARQL ADD <http://kbpedia.org/knowledge-graph#> TO <urn:equivalent:class:property:mappings> ;


SPARQL 

SELECT COUNT(*) 
FROM <urn:equivalent:class:property:mappings>
WHERE {?s ?p ?o} ;

RDFS_RULE_SET ('urn:owl:equivalent:class:property:inference:rules', 'urn:equivalent:class:property:mappings') ;

SELECT * 
FROM DB.DBA.SYS_RDF_SCHEMA 
WHERE RS_NAME = 'urn:owl:equivalent:class:property:inference:rules' ; 


-- Test Query 1 

SPARQL

DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/> 
PREFIX opl: <http://www.openlinksw.com/ontology/stepbyguide#> 


SELECT DISTINCT count(*)
WHERE {
		?s a schema:HowToStep .

      } ;

-- Test Query 1.1

SPARQL

DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/> 
PREFIX opl: <http://www.openlinksw.com/ontology/stepbyguide#> 


SELECT DISTINCT ?s
WHERE { 
		?s a schema:HowToStep .
	  } ;
	  
-- Test Query 1.2 Rules Disabled

SPARQL

# DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/> 
PREFIX opl: <http://www.openlinksw.com/ontology/stepbyguide#> 

SELECT DISTINCT count(*)
WHERE {
	?s a schema:HowToStep .

    } ;
			
-- Test 2
	  
SPARQL

DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/> 
PREFIX opl: <http://www.openlinksw.com/ontology/stepbyguide#> 


SELECT DISTINCT ?s  ?o
WHERE { 
		?s a schema:HowToStep ;
             schema:Step ?o
  } ;


-- Test 2.1
  
SPARQL

# DEFINE input:inference 'urn:owl:equivalent:class:property:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#> 
PREFIX fibo: <https://spec.edmcouncil.org/fibo/ontology/FND/AgentsAndPeople/People/Person>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX schema: <http://schema.org/> 
PREFIX opl: <http://www.openlinksw.com/ontology/stepbyguide#> 


SELECT DISTINCT ?s  ?o
WHERE { 
		?s a schema:HowToStep ;
           schema:Step ?o
} ;
				

