-- Data Generation --
SPARQL
CLEAR GRAPH <urn:analytics> ;

SPARQL

PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

WITH <urn:analytics>
INSERT
        {
            <urn:a> 
            foaf:knows  <urn:b> , 
                        <urn:c> , <urn:d> , <urn:e> , 
                        <urn:f> , <urn:m> , <urn:g> .
            <urn:b> foaf:knows  <urn:a> , <urn:c> .
            <urn:c> foaf:knows  <urn:a> , <urn:b> , 
                                <urn:i> , <urn:l> .
            <urn:d> foaf:knows  <urn:a> , <urn:k> .
            <urn:e> foaf:knows  <urn:a> , <urn:m> .
            <urn:f> foaf:knows  <urn:a> , <urn:i> .
            <urn:m> foaf:knows  <urn:a> , <urn:e> , 
                                <urn:g> .
            <urn:g> foaf:knows  <urn:a> , <urn:m> , 
                                <urn:k> , <urn:h> , <urn:j> .
            <urn:i> foaf:knows  <urn:c> , <urn:f> .
            <urn:l> foaf:knows  <urn:c> .
            <urn:k> foaf:knows  <urn:d> , <urn:g> .
            <urn:h> foaf:knows  <urn:g> .
            <urn:j> foaf:knows  <urn:g> .
        } ;

-- Centrality 

SPARQL

SELECT ?s 
       ( COUNT(*) AS ?count )
FROM <urn:analytics>
WHERE
  { ?s foaf:knows ?o }
GROUP BY ?s
ORDER BY (?count) ;

-- Degree Centrality 

SPARQL
SELECT ?via
       ( count(*) AS ?cnt )
FROM <urn:analytics>
WHERE
{
  ?s foaf:knows ?o
  OPTION ( 
           TRANSITIVE , T_DISTINCT , 
           T_IN (?s) , T_OUT (?o) , 
           T_MIN (1) , T_MAX (100) , 
           T_STEP ('step_no') AS ?dist 
         ) .
  ?o foaf:knows ?via
  OPTION ( 
           TRANSITIVE , T_DISTINCT , 
           T_IN (?o) , T_OUT (?via) , 
           T_MIN (1) , T_MAX (100) , 
           T_STEP ('step_no') AS ?dist_to_via 
         ) .
  ?via foaf:knows ?s
  OPTION ( 
           TRANSITIVE , T_DISTINCT , 
           T_IN (?via) , T_OUT (?s) , 
           T_MIN (1) , T_MAX (100) , 
           T_STEP ('step_no') AS ?dist_FROM_via 
         ) .
  FILTER ( ?s = <urn:a> )
  FILTER ( ?dist = (?dist_to_via + ?dist_FROM_via) )
} 
GROUP BY ?via 
ORDER BY DESC (?cnt) ;

-- Closeness (Reach) Centrality

SPARQL

SELECT ?s 
       ?o 
       ( SUM(?dist) AS ?sum )
FROM <urn:analytics>
WHERE
{
  ?s  foaf:knows  ?o
  OPTION ( 
           TRANSITIVE , T_DISTINCT , 
           T_SHORTEST_ONLY , T_IN (?s) , 
           T_OUT (?o) , T_MIN (1) , 
           T_STEP ('step_no') AS ?dist 
         ) .
  FILTER ( ?s = <urn:a> )
}
GROUP BY ?s ?o ;

-- Betweeness Centrality
SPARQL

SELECT ?via 
       ( count(*) AS ?cnt )
FROM <urn:analytics>
WHERE
{
  ?s foaf:knows ?o 
  OPTION ( 
           TRANSITIVE , T_DISTINCT , 
           T_IN (?s) , T_OUT (?o) , 
           T_MIN (1) , T_MAX (100) , 
           T_STEP ('step_no') AS ?dist 
         ) .
  ?o foaf:knows ?via 
  OPTION ( 
           TRANSITIVE , T_DISTINCT , 
           T_IN (?o) , T_OUT (?via) , 
           T_MIN (1) , T_MAX (100) , 
           T_STEP ('step_no') AS ?dist_to_via 
         ) .
  ?via foaf:knows ?s 
  OPTION ( 
           TRANSITIVE , T_DISTINCT , 
           T_IN (?via) , T_OUT (?s) , 
           T_MIN (1) , T_MAX (100) , 
           T_STEP ('step_no') AS ?dist_from_via 
         ) .
   FILTER ( ?s = <urn:a> )
   FILTER( ?dist = (?dist_to_via + ?dist_from_via) )
} 
GROUP BY ?via 
ORDER BY DESC (?cnt) ;

-- Betweeness Centrality via Shortest Path 

SPARQL 
SELECT ?via 
       ( count(*) AS ?cnt )
FROM <urn:analytics>
WHERE
{
  ?s foaf:knows ?via
  OPTION (
           TRANSITIVE , T_DISTINCT ,
           T_IN (?s) , T_OUT (?via) ,
           T_MIN (1) , 
           T_STEP ('step_no') AS ?dist_to_via
         ) .
  ?via foaf:knows ?o
  OPTION (
           TRANSITIVE , T_SHORTEST_ONLY , 
           T_DISTINCT , T_IN (?via) , 
           T_OUT (?o) , T_MIN (1) , 
           T_STEP ('step_no') AS ?dist_from_via
         ) .
  FILTER ( ?s = <urn:a> )
}
GROUP BY ?via 
ORDER BY DESC (?cnt) ;

-- Betweeness Centrality using T_MAX(10) along shortest path

SPARQL

SELECT ?via 
       ( count(*) AS ?cnt )
FROM <urn:analytics>
WHERE
{
  ?s foaf:knows ?via
  OPTION (
           TRANSITIVE ,  T_DISTINCT ,
           T_IN (?s) , T_OUT (?via) ,
           T_MIN (1) , T_MAX(10) , 
           T_STEP ('step_no') AS ?dist_to_via
         ) .
  ?via foaf:knows ?o
  OPTION (
           TRANSITIVE , T_SHORTEST_ONLY , 
           T_DISTINCT , T_IN (?via) , 
           T_OUT (?o) , T_MIN (1) , 
           T_STEP ('step_no') AS ?dist_from_via
         ) .
  FILTER ( ?s = <urn:a> ) 
}
GROUP BY ?via 
ORDER BY DESC (?cnt) ;


-- Data Generation for Eigne Vector Centrality
SPARQL

CLEAR GRAPH <urn:evc>  ;

SPARQL

PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

WITH <urn:evc> 
INSERT 
{
  <urn:a> foaf:knows <urn:b> .
  <urn:a> foaf:knows <urn:c> .
  <urn:a> foaf:knows <urn:d> .
  <urn:b> foaf:knows <urn:a> .
  <urn:b> foaf:knows <urn:c> .
  <urn:b> foaf:knows <urn:d> .
  <urn:c> foaf:knows <urn:a> .
  <urn:c> foaf:knows <urn:b> .
  <urn:d> foaf:knows <urn:a> .
  <urn:d> foaf:knows <urn:b> .
  <urn:d> foaf:knows <urn:e> .
  <urn:e> foaf:knows <urn:d> .
} ;

-- Eigen Vector Centrality (EVC) 

SPARQL 

SELECT ?s 
       sql:rnk_scale ((<LONG::IRI_RANK> (?s)) * COUNT(*)) AS ?rank 
FROM <urn:evc> 
WHERE { ?s foaf:knows ?o }
ORDER BY DESC (?rank)

