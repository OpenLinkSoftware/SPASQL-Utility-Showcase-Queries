

-- Load Vocabulary 
SPARQL
DEFINE get:soft "replace" 

SELECT * 
FROM <http://vocab.org/relationship/rel-vocab-20100607.rdf> 
WHERE { ?s ?p ?o } ;

-- Copy Vocabulary Relations to Named Graph to be used for Inference Rule

SPARQL
COPY <http://vocab.org/relationship/rel-vocab-20100607.rdf> 
  TO <http://purl.org/vocab/relationship/> ;
  
-- Verify Vocabulary Relations are loaded into Named Graph successfully 

SPARQL
SELECT * 
FROM <http://purl.org/vocab/relationship/>
WHERE { ?s ?p ?o } ;

-- Create Inference Rule from Vocabulary Named Graph 

rdfs_rule_set
  ( 'urn:relationships:ontology:inference:rules' , 
    'http://purl.org/vocab/relationship/'
  ) ;
  
-- Verify successful Rule Creation

SELECT * FROM sys_rdf_schema ;

-- Clear Test Data 
SPARQL
CLEAR GRAPH <urn:royals:demo>  ;

-- Load Test Data 
SPARQL 
PREFIX rel: <http://purl.org/vocab/relationship/> 
PREFIX dbpedia: <http://dbpedia.org/resource/> 
PREFIX rel: <http://purl.org/vocab/relationship/>

INSERT {
            GRAPH <urn:royals:demo> 
                {

                    dbpedia:Prince_William_of_Wales rel:siblingOf dbpedia:Prince_Harry_of_Wales .
                    dbpedia:Elizabeth_Bowes-Lyon rel:ancestorOf dbpedia:Elizabeth_II_of_the_United_Kingdom .
                    dbpedia:Elizabeth_II_of_the_United_Kingdom rel:ancestorOf <http://dbpedia.org/resource/Charles,_Prince_of_Wales> .
                    <http://dbpedia.org/resource/Charles,_Prince_of_Wales> rel:ancestorOf dbpedia:Prince_William_of_Wales , dbpedia:Prince_Harry_of_Wales .
                }
         } ;

-- Test Query 1
-- Descendants of Elizabeth Bowes-Lyon (Queen Mother), without Reasoning & Inference

SPARQL
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE
   { <http://dbpedia.org/resource/Elizabeth_Bowes-Lyon>
        rel:ancestorOf   ?o
   } ;
 
-- Test Query 2 
-- Descendants of Elizabeth Bowes-Lyon (Queen Mother) using Reasoning & Inference pragma 

SPARQL 
DEFINE input:inference 'urn:relationships:ontology:inference:rules'
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE
{
   <http://dbpedia.org/resource/Elizabeth_Bowes-Lyon>
        rel:ancestorOf   ?o
} ;

-- Query 3
-- Descendants of Elizabeth Bowes-Lyon (Queen Mother), using SPARQL 1.1 Property Paths feature

SPARQL
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE
{
  <http://dbpedia.org/resource/Elizabeth_Bowes-Lyon>
    rel:ancestorOf+   ?o
} ;

-- Query 4 
-- Prince Harry’s Sibling using Reasoning & Inference Pragma

SPARQL
DEFINE input:inference 'urn:relationships:ontology:inference:rules'
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE
{
  <http://dbpedia.org/resource/Prince_Harry_of_Wales>
     rel:siblingOf   ?o
} ;

-- Query 5 
-- Relationship Symmetry using SPARQL 1.1 Property Paths

SPARQL
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE
{
   <http://dbpedia.org/resource/Prince_Harry_of_Wales>
      ( rel:siblingOf+|^rel:siblingOf )   ?o
} ;

-- Query 6
-- Queen Elizabeth II Ancestry with Reasoning and Inference

SPARQL
DEFINE input:inference 'urn:relationships:ontology:inference:rules'
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE
{
  <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom>
      rel:descendantOf   ?o
} ;

-- Query 7 
-- Queen Elizabeth II Ancestry with Reasoning and Inference using SPARQL 1.1 Property Paths

SPARQL
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE 
   {
      <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom>
         rel:descendantOf+|^rel:ancestorOf  ?o
   } ;

-- Query 8 
-- Descendants of Queen Elizabeth II, using Reasoning & Inference Pragma

SPARQL
DEFINE input:inference 'urn:relationships:ontology:inference:rules'
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE 
   {
      <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom>
         rel:ancestorOf   ?o
   } ;
   
-- Query 9 
-- Descendants of Queen Elizabeth II, using SPARQL 1.1 Property Paths to leverage the Transitive nature of rel:ancestorOf

SPARQL
PREFIX rel: <http://purl.org/vocab/relationship/>
SELECT *
FROM <urn:royals:demo>
WHERE 
   {
      <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom>
      rel:ancestorOf+|^rel:descendentOf   ?o
   } ;

