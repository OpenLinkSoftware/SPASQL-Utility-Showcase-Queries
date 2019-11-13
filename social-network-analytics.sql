-- Example 1
SPARQL

SELECT ?s AS ?knows 
       ?knowee
       ?dist AS ?knoweeDistance 
       ( ( SELECT COUNT ( * ) WHERE{ ?s foaf:knows ?xx } ) ) AS ?knowsNetworkSize        
WHERE
  {
    {
      SELECT ?s ?o WHERE
      {
        ?s foaf:knows ?o
      }
     }
   ## Degrees of Separation via TRANSITIVE Option ##
   OPTION ( TRANSITIVE, T_DISTINCT, 
            T_IN ( ?s ) , T_OUT ( ?o ), 
            T_MIN ( 1 ) , T_MAX ( 4 ), 
            T_STEP ( 'step_no' ) AS ?dist 
           ) .   # FILTER( ?o = <http://elidam.org/resource/Giuseppe_La_Barbera/> )
   BIND ( <http://myopenlink.net/datASpace/person/kidehen#this> AS ?knowee )
   FILTER(?o = <http://myopenlink.net/datASpace/person/kidehen#this> )
   # FILTER(! CONTAINS(STR(?s),"Idehen"))
   # FILTER(! CONTAINS(STR(?s),"idehen"))
  }
ORDER BY 4 ?dist  ;

-- Example 2:  Centrality

SPARQL

SELECT ?s ( COUNT(*) AS ?count ) 
FROM <http://kingsley.idehen.net/public_home/kidehen/Public/Linked%20Data%20Documents/Tutorials/label-property-graph-stuff/foaf-network-analysis.ttl>
WHERE{ ?s  foaf:knows  ?o } 
GROUP BY ?s 
ORDER BY ( ?count ) ;

-- Example 3: Degree of Centrality

SPARQL

SELECT ?via count(*) AS ?cnt
FROM <urn:analytics>
WHERE
{
  ?s foaf:knows ?o 
  OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?s) , T_OUT (?o) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist ) . 
  ?o foaf:knows ?via  
  OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?o) , T_OUT (?via) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_to_via ) .     
  ?via foaf:knows ?s
  OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?via) , T_OUT (?s) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_FROM_via ) .    
  FILTER( ?s = <https://emekaokoye.solid.community/profile/card#me>)
  #FILTER( ?via = <urn:m> )
  FILTER( ?dist = (?dist_to_via + ?dist_FROM_via) )   
} GROUP BY ?via ORDER BY (?cnt) ;

-- Example 4: Closeness Centrality

SPARQL

SELECT ( SUM(?dist) AS ?sum )
FROM <http://kingsley.idehen.net/public_home/kidehen/Public/Linked%20Data%20Documents/Tutorials/label-property-graph-stuff/foaf-network-analysis.ttl>
WHERE
  { 
    ?s  foaf:knows  ?o
    OPTION ( TRANSITIVE , 
             T_DISTINCT , 
             T_IN (?s) , 
             T_OUT (?o) , 
             T_MIN (1) , 
             T_STEP ('step_no') AS ?dist ) .
    FILTER( ?s = <http://myopenlink.net/datASpace/person/kidehen#this> )
    # FILTER( ?s = <https://teodora.solid.community/profile/card#me> )
  } ;

--Example 5: Betweeness Centrality

SPARQL

SELECT ?via count(*) AS ?cnt
FROM <http://kingsley.idehen.net/public_home/kidehen/Public/Linked%20Data%20Documents/Tutorials/label-property-graph-stuff/foaf-network-analysis.ttl>
WHERE
{
  ?s foaf:knows ?o 
  OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?s) , T_OUT (?o) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist ) . 
  ?o foaf:knows ?via  
  OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?o) , T_OUT (?via) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_to_via ) .     
  ?via foaf:knows ?s
  OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?via) , T_OUT (?s) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_from_via ) .    
  FILTER( ?s = <http://myopenlink.net/datASpace/person/kidehen#this> )
  # FILTER( ?s = <https://www.w3.org/People/Berners-Lee/card#i> )
  FILTER( ?dist = (?dist_to_via + ?dist_from_via) )   
} GROUP BY ?via ORDER BY (?cnt)  ;

-- Example 6 (EVC): Betweeness Centrality via Shortest Path 

SPARQL

SELECT ?via count(*) AS ?cnt 
FROM <http://kingsley.idehen.net/public_home/kidehen/Public/Linked%20Data%20Documents/Tutorials/label-property-graph-stuff/foaf-network-analysis.ttl>

WHERE
{  
   ?s foaf:knows ?via
   OPTION ( 
            TRANSITIVE,  T_DISTINCT, 
            T_IN (?s) , T_OUT (?via) , 
            T_MIN (1)  , T_STEP ('step_no') AS ?dist_to_via 
          ) .
   ?via foaf:knows ?o
   OPTION ( 
            TRANSITIVE, T_SHORTEST_ONLY, T_DISTINCT, 
            T_IN (?via) , T_OUT (?o) , 
            T_MIN (1)  , T_STEP ('step_no') AS ?dist_from_via 
          ) .
   FILTER( ?s = <https://justin.janeirodigital.exchange/profile/card#>)  
} 
GROUP BY ?via ORDER BY DESC (?cnt) ;

-- Example 7 (EVC): Importance Centrality via Shortest Path using T_MAX()

SPARQL

SELECT ?via count(*) AS ?cnt 
FROM <http://kingsley.idehen.net/public_home/kidehen/Public/Linked%20Data%20Documents/Tutorials/label-property-graph-stuff/foaf-network-analysis.ttl>
WHERE
{  
   ?s foaf:knows ?via
   OPTION ( 
            TRANSITIVE,  T_DISTINCT, 
            T_IN (?s) , T_OUT (?via) , 
            T_MIN (1), T_MAX(10)  , T_STEP ('step_no') AS ?dist_to_via 
          ) .
   ?via foaf:knows ?o
   OPTION ( 
            TRANSITIVE, T_SHORTEST_ONLY, T_DISTINCT, 
            T_IN (?via) , T_OUT (?o) , 
            T_MIN (1)  , T_STEP ('step_no') AS ?dist_from_via 
          ) .
   FILTER ( ?s = <https://justin.janeirodigital.exchange/profile/card#>)  
} 
GROUP BY ?via ORDER BY DESC (?cnt) ;


-- Twitter Examples ---

-- Example 1: LinkedIn Network 

SPARQL

SELECT ?o ?dist ( ( SELECT COUNT ( * )
FROM <urn:tweets:kg>
 WHERE { ?o opltw:follows ?xx } ) ) WHERE
  {
    {
      SELECT ?s ?o WHERE
      {
        ?s opltw:follows ?o
      }
     }
   OPTION ( transitive, t_distinct, t_in ( ?s ) , t_out ( ?o ) , t_min ( 1 ) , t_max ( 4 ) , t_step ( 'step_no' ) as ?dist ) .
    FILTER ( ?s= <https://twitter.com/kidehen#this> )
  }
ORDER BY ?dist DESC 3 LIMIT 50 ;

-- Example 2:  Centrality

SPARQL

SELECT ?s ( COUNT(*) AS ?count ) 
FROM <urn:tweets:kg> 
WHERE { ?s opltw:follows ?o } 
GROUP BY ?s 
ORDER BY ( ?count ) ;

-- Example 3: Degree of Centrality

SPARQL

SELECT ?via count(*) AS ?cnt
FROM <urn:tweets:kg> 
WHERE
    {
      ?s  opltw:follows ?o 
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?s) , T_OUT (?o) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist ) . 
      ?o  opltw:follows ?via  
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?o) , T_OUT (?via) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_to_via ) .     
      ?via  opltw:follows ?s
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?via) , T_OUT (?s) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_FROM_via ) .    
      # FILTER ( ?s = <https://twitter.com/kidehen#this>)  
      FILTER ( ?s = <https://twitter.com/OpenLink#this> )
      FILTER( ?dist = (?dist_to_via + ?dist_FROM_via) )   
    } 
GROUP BY ?via 
ORDER BY (?cnt) ;

-- Example 4: Closeness Centrality

SPARQL

SELECT ( SUM(?dist) AS ?sum )
FROM <urn:tweets:kg> 
WHERE
  { 
    ?s opltw:follows ?o
    OPTION ( TRANSITIVE , T_DISTINCT , 
             T_IN (?s) , T_OUT (?o) , 
             T_MIN (1) , T_STEP ('step_no') AS ?dist ) .
    # FILTER ( ?s = <https://twitter.com/kidehen#this>)  
    FILTER ( ?s = <https://twitter.com/OpenLink#this> )
  } ;

--Example 5: Betweeness Centrality

SPARQL

SELECT ?via count(*) AS ?cnt
FROM <urn:tweets:kg>
WHERE
    {
      ?s opltw:follows ?o 
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?s) , T_OUT (?o) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist ) . 
      ?o opltw:follows ?via  
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?o) , T_OUT (?via) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_to_via ) .     
      ?via opltw:follows ?s
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?via) , T_OUT (?s) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_from_via ) .    
      # FILTER ( ?s = <https://twitter.com/kidehen#this>)  
      FILTER ( ?s = <https://twitter.com/OpenLink#this> )
      FILTER( ?dist = (?dist_to_via + ?dist_from_via) )   
    } 
GROUP BY ?via 
ORDER BY DESC (?cnt)  ;


-- Example 6: Betweeness Centrality via Shortest Path

SPARQL

SELECT ?via count(*) AS ?cnt 
FROM <urn:tweets:kg>
WHERE
{  
   ?s opltw:follows ?via
   OPTION ( 
            TRANSITIVE,  T_DISTINCT, 
            T_IN (?s) , T_OUT (?via) , 
            T_MIN (1)  , T_STEP ('step_no') AS ?dist_to_via 
          ) .
   ?via opltw:follows ?o
   OPTION ( 
            TRANSITIVE, T_SHORTEST_ONLY, T_DISTINCT, 
            T_IN (?via) , T_OUT (?o) , 
            T_MIN (1)  , T_STEP ('step_no') AS ?dist_from_via 
          ) .
  # FILTER ( ?s = <https://twitter.com/kidehen#this>)  
  FILTER ( ?s = <https://twitter.com/OpenLink#this> )
} 
GROUP BY ?via 
HAVING (count(*) > 6 )
ORDER BY DESC (?cnt) ;


-- Example 7: Importance Centrality via Shortest Path using T_MAX()

SPARQL

SELECT ?via count(*) AS ?cnt 
FROM <urn:tweets:kg>
WHERE
{  
   ?s opltw:follows ?via
   OPTION ( 
            TRANSITIVE,  T_DISTINCT, 
            T_IN (?s) , T_OUT (?via) , 
            T_MIN (1), T_MAX(10)  , T_STEP ('step_no') AS ?dist_to_via 
          ) .
   ?via opltw:follows ?o
   OPTION ( 
            TRANSITIVE, T_SHORTEST_ONLY, T_DISTINCT, 
            T_IN (?via) , T_OUT (?o) , 
            T_MIN (1)  , T_STEP ('step_no') AS ?dist_from_via 
          ) .
  # FILTER ( ?s = <https://twitter.com/kidehen#this>)  
  FILTER ( ?s = <https://twitter.com/OpenLink#this> )
} 
GROUP BY ?via ORDER BY DESC (?cnt) ;

