-- Cleanup

SPARQL CLEAR GRAPH <https://www.openlinksw.com/DAV/uda2.openlinksw.com/data/turtle/multi-tier/2019/UDAMTProductFeatures.ttl> ;

SPARQL CLEAR GRAPH <urn:inference:product:feature:subclass:odbc> ;

SPARQL CLEAR GRAPH <urn:inference:product:feature:subclass:data>;

DELETE FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:inference:product:feature:subclass:odbc:rule' ;

-- Load Data

SPARQL
PREFIX odbc-postgres-mt:  <http://data.openlinksw.com/oplweb/product/odbc-postgresql-mt#> 
INSERT INTO GRAPH <urn:inference:product:feature:subclass:data>
{
<http://data.openlinksw.com/oplweb/product/odbc-oracle-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-db2-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/uda-drivers-suite-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-dbsuite-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-ingres-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-sqlserver-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-progress-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-sybase-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-mysql-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-jdbc-bridge-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-informix-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-odbc-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .
<http://data.openlinksw.com/oplweb/product/odbc-postgres-mt#this>	a	<http://www.openlinksw.com/ontology/products#odbcDriver> .

};

SPARQL
INSERT INTO GRAPH <urn:inference:product:feature:subclass:odbc>
    {
    <http://www.openlinksw.com/ontology/products#odbcDriver> rdfs:subClassOf <http://www.openlinksw.com/ontology/odbc#OpenDatabaseConnectivityDriver>
    };

SPARQL
SELECT ( COUNT ( * ) AS ?count )
FROM <urn:inference:product:feature:subclass:odbc>
WHERE { ?s ?p ?o } ;

RDFS_RULE_SET('urn:inference:product:feature:subclass:odbc:rule','urn:inference:product:feature:subclass:odbc');


-- Test Query 1

SPARQL
DEFINE input:inference 'urn:inference:product:feature:subclass:odbc:rule'
SELECT ( COUNT ( DISTINCT * ) AS ?count )
{
  ?s a <http://www.openlinksw.com/ontology/odbc#OpenDatabaseConnectivityDriver>.
};

-- Test Query 1.2 Rules Disabled

SPARQL
SELECT ( COUNT ( DISTINCT * ) AS ?count )
{
  ?s a <http://www.openlinksw.com/ontology/odbc#OpenDatabaseConnectivityDriver>.
};

-- Test Query 2

SPARQL
DEFINE input:inference 'urn:inference:product:feature:subclass:odbc:rule'
SELECT *
{
  ?s a <http://www.openlinksw.com/ontology/odbc#OpenDatabaseConnectivityDriver>.
};

-- Test Query 2.1

SPARQL
SELECT *
{
  ?s a <http://www.openlinksw.com/ontology/odbc#OpenDatabaseConnectivityDriver>.
};
