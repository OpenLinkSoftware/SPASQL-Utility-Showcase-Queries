
-- Centrality 

SPARQL
SELECT ?s 
       ( COUNT(*) AS ?count )
FROM <urn:analytics>
WHERE
  { ?s foaf:knows ?o }
GROUP BY ?s
ORDER BY (?count) ;

-- Degrees of Centrality 

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

-- Closeness Centrality

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
  FILTER ( ?o = <urn:i> )
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

-- Eigen Vector Centrality via Shortest Path
-- Eigen Vector Centrality (EVC) is a measure of connection quality for a given node, 
-- derived from the connection density of other nodes to which it is connected.

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

-- EVC via Shortest Path Out using T_MAX()

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
