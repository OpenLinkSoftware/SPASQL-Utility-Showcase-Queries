-- Data Entry 
-- Matching what a Person seeks (variant of interests) to a Software Application provided by an Organization. 

SPARQL 

CLEAR GRAPH <https://kidehen3.solid.openlinksw.com:8444/inbox/mydata.ttl> ;

SPARQL 

PREFIX schema: <http://schema.org/>
PREFIX : <https://kidehen3.solid.openlinksw.com:8444/inbox/mydata.ttl#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX virtuoso: <http://data.openlinksw.com/oplweb/product_family/virtuoso#> 
PREFIX odbc-jdbc-bridge-st: <http://data.openlinksw.com/oplweb/product_release/UDASingleTierLiteEditionODBCRelease8JDBCBridge#> 

INSERT INTO GRAPH <https://kidehen3.solid.openlinksw.com:8444/inbox/mydata.ttl> 
{
   [ a foaf:Person ;       
       foaf:name "Kingsley Idehen"  
    ] 
    schema:seeks [ a schema:SoftwareApplication ; 
                     schema:uri odbc-jdbc-bridge-st:this ;                      
                     schema:name "OpenLink ODBC to JDBC Bridge Driver" ;                        
                     schema:description """A high-performance ODBC Driver for connecting to JDBC Data Sources. This Driver enables ODBC connectivity to existing ODBC-Compliant Applications from Data Sources that are JDBC-accessible. """@en ;                        
                     schema:creator <http://www.openlinksw.com/#this>              
                 ] ,
                 [ a schema:SoftwareApplication ; 
                     schema:uri virtuoso:this ;                       
                     schema:name "Virtuoso Universal Server" ;                        
                     schema:description """A high-performance, secure, and scalable platform for developing, deploying, and exploiting personal and enterprise Knowledge Graphs. """@en ;                        
                     schema:creator <http://www.openlinksw.com/#this>              
                 ]  . 
} ;

-- Data Query 

SPARQL

PREFIX : <https://kidehen3.solid.openlinksw.com:8444/inbox/mydata.ttl#>

SELECT DISTINCT ?uri ?type ?name ?desc 
FROM <https://kidehen3.solid.openlinksw.com:8444/inbox/mydata.ttl> 
WHERE { 
        [ a foaf:Person ; 
            foaf:name "Kingsley Idehen" 
        ] 
        schema:seeks [ a ?type ;                        
                            schema:name ?name ;                        
                            schema:description ?desc  ;   
                            schema:uri ?uri ;                
                            schema:creator <http://www.openlinksw.com/#this>             
                     ]  
      } ;
