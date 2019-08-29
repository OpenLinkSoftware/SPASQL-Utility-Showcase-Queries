-- Cleanup

SPARQL CLEAR GRAPH <https://www.openlinksw.com/DAV/uda2.openlinksw.com/data/turtle/multi-tier/2019/UDAMTProductFeatures.ttl> ;

SPARQL CLEAR GRAPH <urn:inference:product:feature:inverse> ;

DELETE FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:inference:product:feature:inverse:rule' ;

--Load Data
SPARQL
DEFINE
get:soft 'replace'
SELECT *
FROM <https://www.openlinksw.com/DAV/uda2.openlinksw.com/data/turtle/multi-tier/2019/UDAMTProductFeatures.ttl>
{
    ?s ?p ?o
};

SPARQL
INSERT INTO GRAPH <urn:inference:product:feature:inverse>{
<http://www.openlinksw.com/ontology/features#hasFeature> owl:inverseOf <http://www.openlinksw.com/ontology/features#isFeatureOf>.
};

SPARQL
SELECT ( COUNT ( * ) AS ?count )
FROM <urn:inference:product:feature:inverse>
WHERE { ?s ?p ?o } ;

RDFS_RULE_SET ( 'urn:inference:product:feature:inverse:rule','urn:inference:product:feature:inverse' );

-- Test Query 1
SPARQL
DEFINE input:inference 'urn:inference:product:feature:inverse:rule'
SELECT ( COUNT ( DISTINCT * ) AS ?count )
FROM <https://www.openlinksw.com/DAV/uda2.openlinksw.com/data/turtle/multi-tier/2019/UDAMTProductFeatures.ttl>
{
  ?s <http://www.openlinksw.com/ontology/features#hasFeature> ?o.
};


-- Test Query 1.2 Rules Disabled

SPARQL
# DEFINE input:inference 'urn:inference:product:feature:inverse:rule'
SELECT ( COUNT ( DISTINCT * ) AS ?count )
FROM <https://www.openlinksw.com/DAV/uda2.openlinksw.com/data/turtle/multi-tier/2019/UDAMTProductFeatures.ttl>
{
  ?s <http://www.openlinksw.com/ontology/features#hasFeature> ?o.
};


-- Test 2

SPARQL
DEFINE input:inference 'urn:inference:product:feature:inverse:rule'
SELECT *
FROM <https://www.openlinksw.com/DAV/uda2.openlinksw.com/data/turtle/multi-tier/2019/UDAMTProductFeatures.ttl>
{
  ?s <http://www.openlinksw.com/ontology/features#hasFeature> ?o.
};


-- Test 2.1
SPARQL
#DEFINE input:inference 'urn:inference:product:feature:inverse:rule'
SELECT *
FROM <https://www.openlinksw.com/DAV/uda2.openlinksw.com/data/turtle/multi-tier/2019/UDAMTProductFeatures.ttl>
{
  ?s <http://www.openlinksw.com/ontology/features#hasFeature> ?o.
};
