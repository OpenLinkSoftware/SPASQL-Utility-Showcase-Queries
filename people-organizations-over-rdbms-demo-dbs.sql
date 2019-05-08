-- Cleanup SQL Relations 

-- Inference Rules Cleanup 

DELETE
FROM sys_rdf_schema 
WHERE RS_NAME = 'sql-vdb-data-lake';

-- Cleanup SPARQL Relations 

SPARQL 
CLEAR GRAPH <urn:rdbms:inference:reasoning:demo:1> ;

SPARQL
CLEAR GRAPH <urn:rdbms:inference:reasoning:demo:labels> ;

-- Add rdfs:subClassOf relations to a Named Graph (Document)

SPARQL
INSERT
   {
      GRAPH <urn:rdbms:inference:reasoning:demo:1>
         {
            ### Organization Class Instances (i.e. Organizations) ###
	    
	    ## Class derived from "Demo"."demo"."Customers" Table
            <http://demo.openlinksw.com/schemas/Demo/Customers>
               rdfs:subClassOf   foaf:Organization   .

            ## Class derived from "sqlserver"."northwind"."Customers" Table
            <http://demo.openlinksw.com/schemas/SQLServer/Customers>
               rdfs:subClassOf   foaf:Organization   .

            ## Class derived from "sybase12."pubs2"."publishers" Table
            <http://demo.openlinksw.com/schemas/sybase12/publishers>
               rdfs:subClassOf   foaf:Organization   .

            ## Class derived from "progress11"."pub"."Customer" Table
	    <http://demo.openlinksw.com/schemas/progress11/Customer>
               rdfs:subClassOf   foaf:Organization   .
	       
	    # Class derived from "progress11"."pub"."Supplier" Table   
	     <http://demo.openlinksw.com/schemas/progress11/Supplier>
	        rdfs:subClassOf   foaf:Organization   .

            ## Class derived from "PrestoDB"."hive"."customer" Table
            <http://demo.openlinksw.com/schemas/PrestoDB/customer>
               rdfs:subClassOf   foaf:Organization   .
	    
	    ## Class derived from "csv"."demo"."companies" Table
	    <http://demo.openlinksw.com/schemas/csv/companies> 
	        rdfs:subClassOf   foaf:Organization   .
	    
	    ## Class derived from "SQLSerever"."Northwind"."Customers" Table
	    <http://demo.openlinksw.com/schemas/SQLServer/Customers>
	        rdfs:subClassOf   foaf:Organization   .
	       
            ### Person Class Instances (i.e. People) ###
	    
	    ## Class derived from "progress11"."pubs"."Employee" Table
	    <http://demo.openlinksw.com/schemas/progress11/Employee>
	       rdfs:subClassOf   foaf:Person   .
	    
	    # Class derived from "progress11"."pubs"."Salesrep" Table  
	    <http://demo.openlinksw.com/schemas/progress11/Salesrep>
	       rdfs:subClassOf   foaf:Person   .
		
	    ## Class derived from Virtuoso "School"."DBA"."Person" Table
            <http://demo.openlinksw.com/schemas/School/Person>
	       rdfs:subClassOf   foaf:Person   .
	       
            ## Class derived from "informix"."stores"."customer" Table
            <http://demo.openlinksw.com/schemas/informix/customer>
               rdfs:subClassOf   foaf:Person   .

            ## Class derived from "ingres"."tutorial"."cust_Info" Table
            <http://demo.openlinksw.com/schemas/ingres/cust_info>
               rdfs:subClassOf   foaf:Person   .

            ## Class derived from "Oracle"."HR"."EMPLOYEES" Table
            <http://demo.openlinksw.com/schemas/OracleHR/EMPLOYEES>
               rdfs:subClassOf   foaf:Person   .
	       
	    ## Class derived from "SQLServer"."Northwind"."EMPLOYEES" Table
            <http://demo.openlinksw.com/schemas/SQLServer/Employees>
               rdfs:subClassOf   foaf:Person   .
         }
   } ;
 

-- Ensure that terms from the RDF Schema Vocabulary 
-- are also loaded to the Named Graph identified by <urn:rdbms:inference:reasoning:demo:1> .

SPARQL 
ADD <http://www.w3.org/2000/01/rdf-schema#> TO <urn:rdbms:inference:reasoning:demo:1> ;

-- Add Transitivity designation to rdfs:subClassOf relationship type 

SPARQL

INSERT { GRAPH <urn:rdbms:inference:reasoning:demo:1>
           {  rdfs:subClassOf   a   owl:TransitiveProperty   }
       } ;
	   
-- Generate Relations that provide Virtuoso for context for Mapping Labels to URIs in Tools like
-- its built-in Faceted Browser, Sponger Middleware Entity Description Page etc..

SPARQL

INSERT
   {  GRAPH <urn:rdbms:inference:reasoning:demo:labels>
         {
            ?s   foaf:name   ?name   .
         }
   }
WHERE
   {
      ## Person Class Instances
  
      {  GRAPH <urn:demo.openlinksw.com:OracleHR>
         {
             ?s   <http://demo.openlinksw.com/schemas/OracleHR/first_name>   ?fname   ;
                  <http://demo.openlinksw.com/schemas/OracleHR/last_name>    ?sname   .
             bind (concat(?fname,' ', ?sname) as ?name)
         }
      }
  
   UNION
  
      {  GRAPH <urn:demo.openlinksw.com:ingres>
         {
             ?s   <http://demo.openlinksw.com/schemas/ingres/name>   ?name   .
         }
      }
  
   UNION
  
      {  GRAPH <urn:demo.openlinksw.com:informix>
         {
             ?s   <http://demo.openlinksw.com/schemas/informix/fname>   ?fname   ;
                  <http://demo.openlinksw.com/schemas/informix/lname>   ?sname   .
             bind (concat(?fname,' ', ?sname) as ?name)
         }
      }
  
   UNION
  
      ## Oragnization Class Instances
  
      {  GRAPH <urn:demo.openlinksw.com:Demo>
         {
             ?s   <http://demo.openlinksw.com/schemas/Demo/companyname>   ?name   .
         }
      }
  
   UNION
     
      {  GRAPH <urn:demo.openlinksw.com:SQLServer>
         {
             ?s   <http://demo.openlinksw.com/schemas/SQLServer/companyname>   ?name   .
         }
      }
  
   UNION

      {  GRAPH <urn:demo.openlinksw.com:progress9>
         {
             ?s   <http://demo.openlinksw.com/schemas/progress9/name>   ?name   .
         }
      }
  
   UNION
  
      {  GRAPH <urn:demo.openlinksw.com:sybase12>
         {
            ?s   <http://demo.openlinksw.com/schemas/sybase12/pub_name>   ?name   .
         }
      }

   UNION

      {  GRAPH <urn:demo.openlinksw.com:PrestoDB>
         {
            ?s   <http://demo.openlinksw.com/schemas/PrestoDB/c_name>   ?name   .
         }
      }
   };

-- Setup Inference Rule

RDFS_RULE_SET
  ( 'sql-vdb-data-lake' ,
    'urn:rdbms:inference:reasoning:demo:1'
  ) ;
  

-- Verify Inference Built-In Inference Rule


SELECT * 
FROM sys_rdf_schema 
WHERE RS_NAME = 'sql-vdb-data-lake' ;
     
-- Test Effects of Reasoning & Inference

-- Test 1 Inference Enabled

SPARQL

DEFINE input:inference 'sql-vdb-data-lake' 

SELECT  (COUNT(*) AS ?count)  
FROM <urn:demo.openlinksw.com:OracleHR> 
FROM <urn:demo.openlinksw.com:ingres> 
FROM <urn:demo.openlinksw.com:informix> 
FROM <urn:demo.openlinksw.com:School> 
FROM <urn:demo.openlinksw.com:SQLServer> 
FROM <urn:demo.openlinksw.com:progress11> 
FROM <urn:demo.openlinksw.com:sybase12> 
FROM <urn:demo.openlinksw.com:prestoDB> 
WHERE {
        ?s a foaf:Person .
      }  
;

-- Test 2 Inference Disabled

SPARQL

# DEFINE input:inference 'sql-vdb-data-lake' 

SELECT  (COUNT(*) AS ?count)  
FROM <urn:demo.openlinksw.com:OracleHR> 
FROM <urn:demo.openlinksw.com:ingres> 
FROM <urn:demo.openlinksw.com:informix> 
FROM <urn:demo.openlinksw.com:School> 
FROM <urn:demo.openlinksw.com:progress11>
FROM <urn:demo.openlinksw.com:SQLServer> 
FROM <urn:demo.openlinksw.com:sybase12> 
FROM <urn:demo.openlinksw.com:prestoDB> 
WHERE {
        ?s a foaf:Person .
      }  
;

-- Test 3 Inference Enabled

SPARQL

DEFINE input:inference 'sql-vdb-data-lake' 

SELECT  (COUNT(*) AS ?count)  
FROM <urn:demo.openlinksw.com:OracleHR> 
FROM <urn:demo.openlinksw.com:ingres> 
FROM <urn:demo.openlinksw.com:informix> 
FROM <urn:demo.openlinksw.com:progress11>
FROM <urn:demo.openlinksw.com:SQLServer> 
FROM <urn:demo.openlinksw.com:School> 
FROM <urn:demo.openlinksw.com:sybase12> 
FROM <urn:demo.openlinksw.com:prestoDB> 
WHERE {
        ?s a foaf:Organization .
      }  
;

-- Test 4 Inference Disabled

SPARQL

# DEFINE input:inference 'sql-vdb-data-lake' 

SELECT  (COUNT(*) AS ?count)  
FROM <urn:demo.openlinksw.com:OracleHR> 
FROM <urn:demo.openlinksw.com:ingres> 
FROM <urn:demo.openlinksw.com:informix> 
FROM <urn:demo.openlinksw.com:progress11> 
FROM <urn:demo.openlinksw.com:SQLServer> 
FROM  <urn:demo.openlinksw.com:School>  
FROM <urn:demo.openlinksw.com:sybase12> 
FROM <urn:demo.openlinksw.com:prestoDB> 
WHERE {
        ?s a foaf:Organization .
      }  
;

-- Test 5 Inference Enabled

SPARQL

DEFINE input:inference 'sql-vdb-data-lake' 

SELECT DISTINCT ?s as ?organization
FROM NAMED <urn:demo.openlinksw.com:OracleHR> 
FROM NAMED <urn:demo.openlinksw.com:ingres> 
FROM NAMED <urn:demo.openlinksw.com:informix> 
FROM NAMED <urn:demo.openlinksw.com:progress11>
FROM NAMED <urn:demo.openlinksw.com:SQLServer> 
FROM NAMED <urn:demo.openlinksw.com:School> 
FROM NAMED <urn:demo.openlinksw.com:sybase12> 
FROM NAMED <urn:demo.openlinksw.com:prestoDB> 
FROM NAMED <urn:demo.openlinksw.com:csv> 
WHERE {
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:OracleHR> {?s a foaf:Organization . } } LIMIT 1
         } 
		 
		 UNION
		 
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:ingres> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:informix> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:progress11> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:SQLServer> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:School> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:sybase12> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:prestoDB> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:csv> {?s a foaf:Organization . } } LIMIT 1
        } 
		
      }  
;

-- Test 6 Inference Disabled

SPARQL

# DEFINE input:inference 'sql-vdb-data-lake' 

SELECT DISTINCT ?s as ?organization
FROM NAMED <urn:demo.openlinksw.com:OracleHR> 
FROM NAMED <urn:demo.openlinksw.com:ingres> 
FROM NAMED <urn:demo.openlinksw.com:informix> 
FROM NAMED <urn:demo.openlinksw.com:progress11>
FROM NAMED <urn:demo.openlinksw.com:SQLServer> 
FROM NAMED <urn:demo.openlinksw.com:School> 
FROM NAMED <urn:demo.openlinksw.com:sybase12> 
FROM NAMED <urn:demo.openlinksw.com:prestoDB> 
FROM NAMED <urn:demo.openlinksw.com:csv> 
WHERE {
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:OracleHR> {?s a foaf:Organization . } } LIMIT 1
         } 
		 
		 UNION
		 
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:ingres> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:informix> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:progress11> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:SQLServer> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:School> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:sybase12> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:prestoDB> {?s a foaf:Organization . } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:csv> {?s a foaf:Organization . } } LIMIT 1
        } 
		
      }  
;
	  
-- Test 7 Inference Enabled

SPARQL
DEFINE input:inference 'sql-vdb-data-lake' 

SELECT DISTINCT ?s 
FROM NAMED <urn:demo.openlinksw.com:OracleHR> 
FROM NAMED <urn:demo.openlinksw.com:ingres> 
FROM NAMED <urn:demo.openlinksw.com:informix> 
FROM NAMED <urn:demo.openlinksw.com:progress11>
FROM NAMED <urn:demo.openlinksw.com:SQLServer> 
FROM NAMED <urn:demo.openlinksw.com:School> 
FROM NAMED <urn:demo.openlinksw.com:sybase12> 
FROM NAMED <urn:demo.openlinksw.com:prestoDB> 
FROM NAMED <urn:demo.openlinksw.com:csv> 
WHERE {
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:OracleHR> {?s a foaf:Person .  } } LIMIT 1
         } 
		 
		 UNION
		 
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:ingres> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:informix> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:progress11> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:SQLServer> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:School> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:sybase12> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:prestoDB> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:csv> {?s a foaf:Person .  } } LIMIT 1
        } 
		
      }  
;

-- Test 8 Inference Disabled

SPARQL

DEFINE input:inference 'sql-vdb-data-lake' 

SELECT DISTINCT ?s 
FROM NAMED <urn:demo.openlinksw.com:OracleHR> 
FROM NAMED <urn:demo.openlinksw.com:ingres> 
FROM NAMED <urn:demo.openlinksw.com:informix> 
FROM NAMED <urn:demo.openlinksw.com:progress11>
FROM NAMED <urn:demo.openlinksw.com:SQLServer> 
FROM NAMED <urn:demo.openlinksw.com:School> 
FROM NAMED <urn:demo.openlinksw.com:sybase12> 
FROM NAMED <urn:demo.openlinksw.com:prestoDB> 
FROM NAMED <urn:demo.openlinksw.com:csv> 
WHERE {
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:OracleHR> {?s a foaf:Person .  } } LIMIT 1
         } 
		 
		 UNION
		 
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:ingres> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:informix> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:progress11> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:SQLServer> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:School> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:sybase12> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:prestoDB> {?s a foaf:Person .  } } LIMIT 1
        } 
		
		UNION
		
        { 
         SELECT DISTINCT ?s { GRAPH <urn:demo.openlinksw.com:csv> {?s a foaf:Person .  } } LIMIT 1
        } 
		
      }  
;
