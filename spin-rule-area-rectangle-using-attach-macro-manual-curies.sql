-- This a SPARQL script to test SPIN Rules in Virtuoso 8
--  It should compute the area of an instance of the class Rectangle given its width and its height.
-- This script must be run in the SQL console of Virtuoso

--  Additional commands

SPARQL CLEAR GRAPH <urn:geometry:data> ;
SPARQL CLEAR GRAPH <urn:spin:rule:bind:geometry:lib> ;

SPARQL DROP SPIN LIBRARY <urn:spin:rule:bind:geometry:lib> ;

-- create a named graph

-- SPARQL CREATE GRAPH <urn:geometry:data> ;

SPARQL 
PREFIX shapes: <#> 
PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#>

WITH <urn:geometry:data> 
INSERT {
		shapes:Rectangle 
		rdf:type owl:Class .
		
		shapes:rectangle_1 
		rdf:type  shapes:Rectangle ;
		shapes:height "5" ;
		shapes:width  "49" .
		shapes:area rdf:type owl:DatatypeProperty .
		shapes:height rdf:type owl:DatatypeProperty .
		shapes:width rdf:type owl:DatatypeProperty .
} ;

-- Test Generated Data Control Check

SPARQL

PREFIX shapes: <#> 
PREFIX spin:    <http://spinrdf.org/spin#>
PREFIX sp: <http://spinrdf.org/sp#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>

# CONSTRUCT { ?this <http://example.org/shapes#area> ?area . } 
SELECT ?this ?area
FROM <urn:geometry:data> 
WHERE { 
		?this <http://example.org/shapes#width> ?width . 
		?this <http://example.org/shapes#height> ?height . 
		BIND ((xsd:float(?height) * xsd:float(?width)) AS ?area) . 
      } ;	  
	

--  create the rule


--- SPARQL CREATE SPIN  MACRO LIBRARY using Named Graph <urn:spin:rule:bind:geometry:lib> ; 

--  EXEC ('SPARQL ' || SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:spin:rule:bind:geometry:lib'));
-- Add Macro to Library Manually
-- UNION STORAGE fuses actual and calculated area when enabled, and if it is disabled it will only deal with calculated area? 

EXEC ( 'SPARQL 	PREFIX shapes: <#> ' ||
		'CREATE SPIN LIBRARY <urn:spin:rule:bind:geometry:lib> 
		    { 
			  CLASS shapes:Rectangle 
		            { 
						RULE <urn:spin:rule:bind:geometry:lib#bnode-b2256179> 
			                { 
							  CONSTRUCT { ?this shapes:area ?area } 
			                  WHERE { 
			                          { 
				                          SELECT ?this ?area 
				                          WHERE { ?this shapes:width ?width ; 
				                                        shapes:height ?height . 
				                                  BIND ((xsd:float(?height) * xsd:float(?width)) AS ?area) . 
				                                 } 
			                      		} 
			                   		 } 
                           
			                  UNION STORAGE 
			               } 
		        	} 
		     } 
		ASK WHERE { <#this> <#relatedTo> <#that> . }'
    ) ;
	
-- Test creation
-- SELECT SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:spin:rule:bind:geometry:lib') ;

--- ATTACH <urn:spin:rule:bind:geometry:lib> TO  virtrdf:DefaultQuadStorage
--- meaning: it is applied to all queries scoped to this storage 
--- thereby not requiring invocation via pragma

SPARQL ALTER QUAD STORAGE virtrdf:DefaultQuadStorage { ATTACH MACRO LIBRARY <urn:spin:rule:bind:geometry:lib> };

--  run a sparql query to test the spin rule

-- Test 1 (Reasoning & Inference via Pragma )

SPARQL

DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT *
FROM <urn:geometry:data>
WHERE
	{
		?s a shapes:Rectangle ;
		   shapes:area  ?area .
	} ;

-- Test 2 (Reasoning & Inference without Pragma )
-- Courtesy of ATTACH <urn:spin:rule:bind:geometry:lib> TO  virtrdf:DefaultQuadStorage, 
-- reasoning and inference occurs i.e., same solution as Test 1
	
SPARQL

# DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT *
FROM <urn:geometry:data>
WHERE
	{
		?s a shapes:Rectangle ;
		   shapes:area  ?area .
	} ;
	
-- Test 3 (Reasoning & Inference Context Enabled )


SPARQL

DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#> 

SELECT ?s xsd:float(?w) as ?width  xsd:float(?h) as ?height xsd:float(?area) as ?area
FROM <urn:geometry:data>
WHERE
	{
		?s a shapes:Rectangle;
		   shapes:width ?w ;
		   shapes:height ?h .
		OPTIONAL { ?s shapes:area  ?area }.
	} ;

-- Test 4 (Reasoning & Inference without Pragma)
-- Courtesy of ATTACH <urn:spin:rule:bind:geometry:lib> TO  virtrdf:DefaultQuadStorage, 
-- reasoning and inference occurs i.e., same solution as Test 3

SPARQL

# DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT ?s xsd:float(?w) as ?width  xsd:float(?h) as ?height xsd:float(?area) as ?area
FROM <urn:geometry:data>
WHERE
	{
		?s a shapes:Rectangle;
		   shapes:width ?w ;
		   shapes:height ?h .
		OPTIONAL { ?s shapes:area  ?area }.
	} ;

-- Test 5

SPARQL

DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT ?s xsd:float(?w) as ?width  xsd:float(?h) as ?height xsd:float(?area) as ?area
FROM <urn:geometry:data>
WHERE
    {
        ?s a shapes:Rectangle;
           shapes:width ?w ;
           shapes:height ?h .
        OPTIONAL { ?s a shapes:Rectangle ; shapes:area  ?area }.
    } ;

-- Test 6
-- Courtesy of ATTACH <urn:spin:rule:bind:geometry:lib> TO  virtrdf:DefaultQuadStorage, 
-- reasoning and inference occurs i.e., same solution as Test 5

SPARQL

# DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT ?s xsd:float(?w) as ?width  xsd:float(?h) as ?height xsd:float(?area) as ?area
FROM <urn:geometry:data>
WHERE
    {
        ?s a shapes:Rectangle;
           shapes:width ?w ;
           shapes:height ?h .
        OPTIONAL { ?s a shapes:Rectangle ; shapes:area  ?area }.
    } ;
	
-- Detach Macro Library thereby requiring pragmas for reasoning and inference using
-- Custom Inference Rules associated with Macro Library
	
SPARQL ALTER QUAD STORAGE virtrdf:DefaultQuadStorage { DETACH SPIN LIBRARY <urn:spin:rule:bind:geometry:lib> } ;

-- Test 7 (Reasoning & Inference via Pragma )

SPARQL

DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT *
FROM <urn:geometry:data>
WHERE
	{
		?s a shapes:Rectangle ;
		   shapes:area  ?area .
	} ;

-- Test 8 (Reasoning & Inference without Pragma )
	
SPARQL

# DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT *
FROM <urn:geometry:data>
WHERE
	{
		?s a shapes:Rectangle ;
		   shapes:area  ?area .
	} ;
	
-- Test 9 (Reasoning & Inference Context Enabled )


SPARQL

DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT ?s xsd:float(?w) as ?width  xsd:float(?h) as ?height xsd:float(?area) as ?area
FROM <urn:geometry:data>
WHERE
	{
		?s a shapes:Rectangle;
		   shapes:width ?w ;
		   shapes:height ?h .
		OPTIONAL { ?s shapes:area  ?area }.
	} ;

-- Test 10 (Reasoning & Inference without Pragma)


SPARQL

# DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT ?s xsd:float(?w) as ?width  xsd:float(?h) as ?height xsd:float(?area) as ?area
FROM <urn:geometry:data>
WHERE
	{
		?s a shapes:Rectangle;
		   shapes:width ?w ;
		   shapes:height ?h .
		OPTIONAL { ?s shapes:area  ?area }.
	} ;

-- Test 11

SPARQL

DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT ?s xsd:float(?w) as ?width  xsd:float(?h) as ?height xsd:float(?area) as ?area
FROM <urn:geometry:data>
WHERE
    {
        ?s a shapes:Rectangle;
           shapes:width ?w ;
           shapes:height ?h .
        OPTIONAL { ?s a shapes:Rectangle ; shapes:area  ?area }.
    } ;

-- Test 12

SPARQL

# DEFINE input:macro-lib <urn:spin:rule:bind:geometry:lib>
PREFIX shapes: <#>

SELECT ?s xsd:float(?w) as ?width  xsd:float(?h) as ?height xsd:float(?area) as ?area
FROM <urn:geometry:data>
WHERE
    {
        ?s a shapes:Rectangle;
           shapes:width ?w ;
           shapes:height ?h .
        OPTIONAL { ?s a shapes:Rectangle ; shapes:area  ?area }.
    } ;
	

