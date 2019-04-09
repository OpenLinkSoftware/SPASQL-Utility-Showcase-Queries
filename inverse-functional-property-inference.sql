-- Cleanup

SPARQL CLEAR GRAPH <urn:spin:rule:foaf:ifp:lib1> ;

SPARQL DROP SPIN  LIBRARY <urn:spin:rule:foaf:ifp:lib1> ; 

-- Load Rules from data source

-- SPARQL

-- DEFINE get:soft "no-sponge"
-- LOAD <http://kingsley.idehen.net/DAV/home/kidehen/Public/SPIN%20Rules/spin-foaf-ifp.ttl> INTO <urn:spin:rule:foaf:ifp:lib1> ;
-- Remove rdf:type relations that have ldp:Resource,  rdf:Resource as objects

-- SPARQL DELETE WHERE { GRAPH <urn:spin:rule:foaf:ifp:lib1> { <http://kingsley.idehen.net/DAV/home/kidehen/Public/SPIN%20Rules/geospatial-rules.ttl> ?p ?o }};

-- SPARQL DELETE WHERE { GRAPH <urn:spin:rule:foaf:ifp:lib1> { <http://kingsley.idehen.net/DAV/home/kidehen/Public/SPIN%20Rules/geospatial-rules.ttl#this> ?p ?o } };


TTLP ('
		@prefix owl:     <http://www.w3.org/2002/07/owl#> .
		@prefix sp:    <http://spinrdf.org/sp#> .
		@prefix spl:    <http://spinrdf.org/spl#> .
		@prefix spin:    <http://spinrdf.org/spin#> .
		@prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
		@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
		@prefix xsd:     <http://www.w3.org/2001/XMLSchema#> .
		@prefix foaf: <http://xmlns.com/foaf/0.1/> .
		@prefix  rel:  <http://purl.org/vocab/relationship/> .
		@prefix wdrs: <http://www.w3.org/2007/05/powder-s#> .
		@prefix schema: <http://schema.org/> .
		@prefix ecrm: <http://www.openlinksw.com/ontology/ecrm#> . 


		foaf:Person a rdfs:Class ;
		rdfs:label "People"^^xsd:string ;
		spin:rule
		          [ 
				  	a sp:Construct, spin:Rule ;
		            rdfs:label "Identity Reconciliation using owl:InverseFunctionalProperty Semantics" ;
		            rdfs:comment """Generates explicit coreferences from IFP designaton of foaf:mbox relationship type (relation)""" ;
		            sp:text """
								CONSTRUCT {?this owl:sameAs ?that}
								WHERE {	 
								        ?this foaf:mbox ?mbox1 .
								        ?that foaf:mbox ?mbox2 . 
								        FILTER (?mbox1 = ?mbox2)
								        FILTER (?this != ?that) 
								        FILTER (! isblank(?that))
								        FILTER (! isblank(?this))
								        # FILTER (?this = <https://twitter.com/kidehen#this> )
								   }
							"""
					] .
	',
	'', 'urn:spin:rule:foaf:ifp:lib1', 4096 )
;

-- Rules Load Verification 

SPARQL 
SELECT  COUNT (*) 
FROM <urn:spin:rule:foaf:ifp:lib1> WHERE {?s ?p ?o} ;


-- Generate Macros

EXEC ('SPARQL ' || SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:spin:rule:foaf:ifp:lib1'));


-- Control Tests --- 

-- Cleanup Named Graph to be used for Control Test 

SPARQL

CLEAR GRAPH <urn:kidehen:ifp:test:2> ;

-- Copy Data to Control Test Named Graph 

SPARQL

COPY <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568> TO <urn:kidehen:ifp:test:2> ;

-- Control Check 1 (totals need to match across source and target named graphs)

SPARQL 
SELECT count (*) 
FROM  <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
WHERE {?s ?p ?o} ;

SPARQL
SELECT count (*) 
FROM  <urn:kidehen:ifp:test:2>
WHERE {?s ?p ?o} ;

-- Remove owl:sameAs relations

SPARQL 
DELETE { GRAPH <urn:kidehen:ifp:test:2> {?s owl:sameAs ?o} }
WHERE { GRAPH <urn:kidehen:ifp:test:2> {?s owl:sameAs ?o} } ;

-- Control Check 2 (total must differ due to effect of owl:sameAs relation deletions )
SPARQL 
SELECT count (*) 
FROM  <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
WHERE {?s ?p ?o} ;

SPARQL
SELECT count (*) 
FROM  <urn:kidehen:ifp:test:2>
WHERE {?s ?p ?o} ;

-- Test Query 1
-- Successful if materialization of missing owl:sameAs relations occurs, courtesy of  Custom IFP Inference Rule Pragma

SPARQL
DEFINE input:macro-lib <urn:spin:rule:foaf:ifp:lib1>  
# DEFINE input:inference â€˜urn:ifp:inference:ruleâ€™
# DEFINE input:same-as "yes"

SELECT DISTINCT ?s owl:sameAs as ?sameAs ?o 

# FROM <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
FROM <urn:kidehen:ifp:test:2>
WHERE { 

		?s a foaf:Person ; 
			owl:sameAs ?o .
		FILTER (?s = <https://twitter.com/kidehen#this>)

		} ;

-- Test Query 2
-- Successful if materialization of missing owl:sameAs relations occurs, courtesy of  Custom IFP Inference Rule Pragma
-- Current Status: Fail 

SPARQL

DEFINE input:macro-lib <urn:spin:rule:foaf:ifp:lib1>  
# DEFINE input:same-as "yes"

DESCRIBE ?s 

# FROM <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
FROM <urn:kidehen:ifp:test:2>
WHERE { 

		?s a foaf:Person ; 
			owl:sameAs ?o .
		FILTER (?s = <https://twitter.com/kidehen#this>)

		} ;

-- Test Query 3
-- Successful if materialization of missing owl:sameAs relations occurs, courtesy of  Custom IFP Inference Rule Pragma
-- plus materialization of other relations based on "samesAs" 
-- Current Status: Fail 
-- Proof: Uncomment FROM <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
-- and then comment out FROM <urn:kidehen:ifp:test:2>, and then comment out "DEFINE input:macro-lib <urn:spin:rule:foaf:ifp:lib1>"
-- the solutions are different. The second solution correctly includes materialized relations from "owl:sameAs" inference pragma

SPARQL

DEFINE input:macro-lib <urn:spin:rule:foaf:ifp:lib1>  
DEFINE input:same-as "yes"

DESCRIBE ?s 

# FROM <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
FROM <urn:kidehen:ifp:test:2>
WHERE { 

		?s a foaf:Person ; 
			owl:sameAs ?o .
		FILTER (?s = <https://twitter.com/kidehen#this>)

				} ;
				
-- Test Query 4

SPARQL

DEFINE input:macro-lib <urn:spin:rule:foaf:ifp:lib1>  
# DEFINE input:same-as "yes"


SELECT DISTINCT  ?s ?sameAs ?mainEntityOfPage 
# FROM <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
FROM <urn:kidehen:ifp:test:2>
WHERE { 

		?s a foaf:Person ; 
		owl:sameAs ?sameAs ;
		schema:mainEntityOfPage ?mainEntityOfPage .
		FILTER (?s = <https://twitter.com/kidehen#this> )
	 } ;
	 
-- Test Query 5
-- Successful if materialization of missing owl:sameAs relations occurs, courtesy of  Custom IFP Inference Rule Pragma
-- plus materialization of other relations based on "samesAs" 
-- Current Status: Fail 
-- Proof: Uncomment FROM <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
-- and then comment out FROM <urn:kidehen:ifp:test:2>, and then comment out "DEFINE input:macro-lib <urn:spin:rule:foaf:ifp:lib1>"
-- the solutions are different. The second solution correctly includes materialized relations from "owl:sameAs" inference pragma

SPARQL

DEFINE input:macro-lib <urn:spin:rule:foaf:ifp:lib1>  
DEFINE input:same-as "yes"


SELECT DISTINCT  ?s ?sameAs ?mainEntityOfPage 
# FROM <https://medium.com/virtuoso-blog/using-a-semantic-web-of-linked-data-to-reconcile-disparate-identities-83ab7a315568>
FROM <urn:kidehen:ifp:test:2>
WHERE { 

	?s a foaf:Person ; 
	owl:sameAs ?sameAs ;
	schema:mainEntityOfPage ?mainEntityOfPage .
	FILTER (?s = <https://twitter.com/kidehen#this> )
 }  ;