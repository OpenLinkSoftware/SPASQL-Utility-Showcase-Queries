-- Cleanup 

SPARQL 
CLEAR GRAPH <http://xmlns.com/foaf/0.1/> ;

SPARQL

CLEAR GRAPH <urn:kidehen:ifp:demo>  ;

DELETE
FROM sys_rdf_schema
WHERE RS_NAME = 'urn:ifp:inference:rule'  ;

SPARQL
DEFINE get:soft "no-sponge"
LOAD <http://xmlns.com/foaf/0.1/> ;

-- Adding IFP Relations to FOAF Named Graph

SPARQL
PREFIX lod:  <http://lod.openlinksw.com/> 
PREFIX schema: <http://schema.org/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

INSERT DATA INTO  <http://xmlns.com/foaf/0.1/> { 
												 foaf:mbox a owl:InverseFunctionalProperty ;
												 			 rdfs:subPropertyOf lod:ifp_like .
												 schema:sameAs a owl:InverseFunctionalProperty ;
												     		  rdfs:subPropertyOf lod:ifp_like .
												}  ;

-- Make Rule

RDFS_RULE_SET
   (
        'urn:ifp:inference:rule'  ,
        'http://xmlns.com/foaf/0.1/'
 ) ;

-- Verify Rule Creation

SELECT RS_NAME
FROM sys_rdf_schema
WHERE RS_NAME = 'urn:ifp:inference:rule'  ;


-- Instance Data (ABox)

SPARQL 
INSERT DATA INTO <urn:kidehen:ifp:demo> 
{
	<#kidehen> 
	# a foaf:Person;
	foaf:mbox <mailto:kidehen@openlinksw.com> ;
	schema:name "Kingsley Idehen" ;
	foaf:nick "kidehen".

	<https://twitter.com/kidehen#this> 
	# a foaf:Person;
	foaf:mbox <mailto:kidehen@openlinksw.com> ;
	schema:name "Kingsley Idehen" ;
	schema:sameAs <https://twitter.com/kidehen/> ;
	foaf:nick "@kidehen".

	<https://www.linkedin.com/in/kidehen#this> 
	# a foaf:Person;
	foaf:mbox <mailto:kidehen@openlinksw.com> ;
	schema:name "Kingsley Uyi Idehen" ;
	schema:sameAs <https://www.linkedin.com/in/kidehen/>  ;
	foaf:nick "@kidehen".

	<#kidehen> owl:sameAs <https://twitter.com/kidehen#this>, <https://www.linkedin.com/in/kidehen#this>   . 

} ;

--  Test 1

SPARQL

DEFINE input:inference 'urn:ifp:inference:rule' 

SELECT DISTINCT <#kidehen> AS ?s ?p ?o
FROM <urn:kidehen:ifp:demo> 
WHERE { <#kidehen> ?p ?o } ;

--  Test 2

SPARQL 

DEFINE input:same-as "yes"
SELECT DISTINCT <#kidehen> AS ?s ?p ?o
FROM <urn:kidehen:ifp:demo> 
WHERE { <#kidehen> ?p ?o }