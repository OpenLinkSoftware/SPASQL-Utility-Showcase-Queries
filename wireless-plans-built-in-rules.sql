--  Built-in Inference Rule

--  Rule Definition 

SPARQL

PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX ns1:	<http://www.openlinksw.com/ontology/features#> 
PREFIX schema:	<http://schema.org/> 
PREFIX oplfeat: <http://www.openlinksw.com/ontology/features#> 

WITH <urn:wireless:plans:features:builtin:inference:1> 
INSERT { 
		 oplfeat:hasFeature owl:equivalentProperty schema:additionalProperty .
	   } ;

--  Verify Data Load

SPARQL

SELECT * 
FROM <urn:wireless:plans:features:builtin:inference:1> 
WHERE {?s ?p ?o} ;
	   
-- Rule Creation 

rdfs_rule_set
(
	'urn:wireless:plans:features:builtin:inference:rule:1',
	'urn:wireless:plans:features:builtin:inference:1'

) ;

	
-- Rule Creation Verification


SELECT rs_name
FROM sys_rdf_schema
WHERE rs_name = 'urn:wireless:plans:features:builtin:inference:rule:1' ;

-- Test queries

-- Test 1 (Reasoning & Inference Context Enabled)

SPARQL

DEFINE input:inference <urn:wireless:plans:features:builtin:inference:rule:1>

PREFIX schema: <http://schema.org/>
PREFIX oplfeat:  <http://www.openlinksw.com/ontology/features#>

SELECT DISTINCT ?s schema:additionalProperty AS ?relation ?feature
WHERE
	{
	    ?s a schema:Product;
		   schema:additionalProperty ?feature .

     } 
LIMIT 5 ;

-- Test 2 (Reasoning & Inference Context Disabled)

SPARQL

# DEFINE input:inference <urn:wireless:plans:features:builtin:inference:rule:1>

PREFIX schema: <http://schema.org/>
PREFIX oplfeat:  <http://www.openlinksw.com/ontology/features#>

SELECT DISTINCT ?s schema:additionalProperty AS ?relation ?feature
WHERE
	{
	    ?s a schema:Product;
		   schema:additionalProperty ?feature .

     } 
LIMIT 5 ;
