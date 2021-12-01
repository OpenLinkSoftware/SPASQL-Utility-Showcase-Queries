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

            ## Class derived from "mssql"."northwind"."customers" Table
            <http://demo.openlinksw.com/schemas/SQLServer/Customers>
               rdfs:subClassOf   foaf:Organization   .
	    
	    ## Class derived from "csv"."northwind"."customers" Table
	    <http://demo.openlinksw.com/schemas/csv/customers> 
	       rdfs:subClassOf   foaf:Organization   .

            ## Class derived from "postgres12"."northwind"."suppliers" Table
            <http://demo.openlinksw.com/schemas/postgres12/suppliers>  
            rdfs:subClassOf   foaf:Organization   .

            ## Class derived from "mysql5"."northwind"."suppliers" Table
            <http://demo.openlinksw.com/schemas/mysql5/suppliers>  
            rdfs:subClassOf   foaf:Organization   .
	       
            ### Person Class Instances (i.e. People) ###
            
            ## Class derived from "hr"."ora18"."EMPLOYEES" Table
            <http://demo.openlinksw.com/schemas/OracleHR/EMPLOYEES>
               rdfs:subClassOf   foaf:Person   .
           
           ## Class derived from "informix"."stores"."customer" Table
            <http://demo.openlinksw.com/schemas/informix/customer>
               rdfs:subClassOf   foaf:Person   .

           ## Class derived from Virtuoso "School"."DBA"."Person" Table
                <http://demo.openlinksw.com/schemas/School/Person>
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

      {  GRAPH <urn:demo.openlinksw.com:mysql5>
         {
             ?s   <http://demo.openlinksw.com/schemas/mysql5/firstname>   ?name   .
         }
      }
  
   UNION
  
      {  GRAPH <urn:demo.openlinksw.com:postgres12>
         {
            ?s   <http://demo.openlinksw.com/schemas/postgres12/first_name>   ?name   .
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
FROM <urn:demo.openlinksw.com:postgres12>
FROM <urn:demo.openlinksw.com:mysql5> 
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
FROM <urn:demo.openlinksw.com:postgres12>
FROM <urn:demo.openlinksw.com:mysql5> 
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
FROM <urn:demo.openlinksw.com:postgres12>
FROM <urn:demo.openlinksw.com:mysql5> 
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
FROM <urn:demo.openlinksw.com:postgres12>
FROM <urn:demo.openlinksw.com:mysql5> 
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
FROM <urn:demo.openlinksw.com:postgres12>
FROM <urn:demo.openlinksw.com:mysql5> 
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
FROM <urn:demo.openlinksw.com:postgres12>
FROM <urn:demo.openlinksw.com:mysql5> 
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
