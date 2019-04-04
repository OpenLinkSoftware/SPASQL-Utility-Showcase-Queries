--  Additional commands

SPARQL CLEAR GRAPH <urn:spin:rule:features:lib1> ;
SPARQL DROP SPIN LIBRARY <urn:spin:rule:features:lib1> ;

-- Test Query 

SPARQL
PREFIX oplfeat:  <http://www.openlinksw.com/ontology/features#>
PREFIX schema: <http://schema.org/>

SELECT DISTINCT ?s2 schema:additionalProperty AS ?relation ?s3
WHERE  {
		  ?s schema:offers ?s1. 
		  ?s1 a schema:Offer .
		  ?s1 schema:itemOffered ?s2 .
		  ?s2 a schema:Product .
		  ?s2 oplfeat:hasFeature | schema:additionalProperty ?s3 .
		  ?s1 schema:priceSpecification ?s4 .
		  ?s1 schema:image ?s6 .
		  ?s4 schema:price ?s7. 
		  ?s4 schema:priceCurrency ?s8. 
		  ?s1 schema:name ?s5 .
		  ?s3 schema:name ?s9. 
		  ?s2 schema:name  ?s10. 
		  OPTIONAL {?s rdfs:label ?s11 . FILTER (LANG(?s11) = "en") } . 
	} ;
                

--  create the rule
-- SPARQL CREATE GRAPH <urn:spin:rule:features:lib1> ;

SPARQL 

PREFIX oplfeat:  <http://www.openlinksw.com/ontology/features#>
PREFIX spin:  <http://spinrdf.org/spin#>
PREFIX sp: <http://spinrdf.org/sp#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX schema: <http://schema.org/>
PREFIX : <#>

WITH <urn:spin:rule:features:lib1> 
INSERT {
         schema:Product a owl:Class ;
         rdfs:label "Mobile plan feature";
         spin:rule [
					   a sp:Construct;
	                   sp:text """ 
	                              PREFIX oplfeat:  <http://www.openlinksw.com/ontology/features#>
								  PREFIX schema: <http://schema.org/>

			                      CONSTRUCT {
			                                  ?this schema:additionalProperty ?feature .                                
			                                }
			                      WHERE {
										    ?this (oplfeat:hasFeature | schema:additionalProperty) ?feature .
										}
						   """
                  ] .
	   } ;
    
EXEC ('SPARQL ' || SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:spin:rule:features:lib1'));

--  run a sparql query to test the spin rule

-- Test 0
-- To prove customer inference rule via select

SPARQL

PREFIX oplfeat:  <http://www.openlinksw.com/ontology/features#>
PREFIX schema: <http://schema.org/>

SELECT DISTINCT
          ?s schema:additionalProperty ?feature                             
        
WHERE {
	    ?s a schema:Product ;
		(oplfeat:hasFeature | schema:additionalProperty) ?feature .
	}
LIMIT 5 ;

-- Test 1 (Reasoning & Inference Context Enabled)

SPARQL

DEFINE input:macro-lib <urn:spin:rule:features:lib1>

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

# DEFINE input:macro-lib <urn:spin:rule:features:lib1>

PREFIX schema: <http://schema.org/>
PREFIX oplfeat:  <http://www.openlinksw.com/ontology/features#>

SELECT DISTINCT ?s schema:additionalProperty AS ?relation ?feature
WHERE
	{
	    ?s a schema:Product;
		      schema:additionalProperty ?feature .

     } 
LIMIT 5 ;
