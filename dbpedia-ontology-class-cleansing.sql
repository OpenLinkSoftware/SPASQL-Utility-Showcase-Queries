
-- Problem incorrect class assignments e.g., People as Company, Films etc instances

SPARQL

SELECT SAMPLE (?x) AS ?sample ?typeX (count(*) as ?c) {
  ?x dbo:parent ?y.
  ?y a ?typeY .
  ?x a ?typeX .
  dbo:parent rdfs:domain ?domain;
             rdfs:range ?range .
  # FILTER (?typeX = ?domain and ?typeY = ?range)
  FILTER(strstarts(str(?typeX),str(dbo:)))
  FILTER NOT EXISTS {?y a ?subtype. ?subtype rdfs:subClassOf ?typeY}
} 
GROUP BY ?typeX ORDER BY DESC(?c) ;

-- Fix
-- Levraging rdfs:domain and rdfs:range semantics

SPARQL

SELECT SAMPLE (?x) AS ?sample ?typeX (count(*) as ?c) {
  ?x dbo:parent ?y.
  ?y a ?typeY .
  ?x a ?typeX .
  dbo:parent rdfs:domain ?domain;
             rdfs:range ?range .
  FILTER (?typeX = ?domain and ?typeY = ?range)
  FILTER(strstarts(str(?typeX),str(dbo:)))
  FILTER NOT EXISTS {?y a ?subtype. ?subtype rdfs:subClassOf ?typeY}
} 
GROUP BY ?typeX ORDER BY DESC(?c) ;


-- Fix
-- Levraging rdfs:domain and rdfs:range semantics

SPARQL

SELECT ?x as ?child ?typeX as ?childType dbo:parent as ?relation ?y as ?parent ?typeY as ?parentType
WHERE {
  		?x dbo:parent ?y .
	    ?y a ?typeY .
	    ?x a ?typeX .
		dbo:parent rdfs:domain ?domain;
		rdfs:range ?range .
	    FILTER (?typeX = ?domain and ?typeY = ?range)
  	    FILTER NOT EXISTS {?y rdf:type dbo:Person}
} 

LIMIT 10 ;

SPARQL

SELECT ?x ?y 
WHERE {
  		?x dbo:parent ?y .
	    ?y a ?typeY .
	    ?x a ?typeX .
		dbo:parent rdfs:domain ?domain;
		rdfs:range ?range .
	    FILTER (?typeX = ?domain and ?typeY = ?range)
  	    FILTER NOT EXISTS {?y rdf:type dbo:Person}
} 

LIMIT 10 ;

SPARQL

CONSTRUCT {?x dbo:parent ?y}
WHERE 
{
	{ 
	  SELECT ?x ?typeX ?y ?typeY 
	  WHERE
			  {
	    		?x dbo:parent ?y .
		  	    ?y a ?typeY .
		  	    ?x a ?typeX .
		  		dbo:parent rdfs:domain ?domain;
		  		rdfs:range ?range .
		  	    FILTER (?typeX = ?domain and ?typeY = ?range)
	    	    FILTER NOT EXISTS {?y rdf:type dbo:Person}
			 } 
	 LIMIT 10
	}
} ;

SPARQL

ASK {?x dbo:parent ?y}
WHERE 
{
	{ 
	  SELECT ?x ?typeX ?y ?typeY 
	  WHERE
			  {
	    		?x dbo:parent ?y .
		  	    ?y a ?typeY .
		  	    ?x a ?typeX .
		  		dbo:parent rdfs:domain ?domain;
		  		rdfs:range ?range .
		  	    FILTER (?typeX = ?domain and ?typeY = ?range)
	    	    FILTER NOT EXISTS {?y rdf:type dbo:Person}
			 } 
	 LIMIT 10
	}
} ;


SPARQL

SELECT ?x as ?child ?typeX as ?childType dbo:parent as ?relation ?y as ?parent ?typeY as ?parentType
WHERE 
{
	{ 
	  SELECT ?x ?typeX ?y ?typeY 
	  WHERE
			  {
				  ?x dbo:parent ?y.
				  ?y a ?typeY .
				  ?x a ?typeX .
				  dbo:parent rdfs:domain ?domain;
				             rdfs:range ?range .
				  FILTER (?typeX = ?domain and ?typeY = ?range)
				  FILTER(strstarts(str(?typeX),str(dbo:)))
				  FILTER NOT EXISTS {?y a ?subtype. ?subtype rdfs:subClassOf ?typeY}
			 } 
	 LIMIT 100
	}
} ;


SPARQL

CONSTRUCT {?x dbo:parent ?y}
WHERE 
{
	{ 
	  SELECT ?x ?typeX ?y ?typeY 
	  WHERE
			  {
				  ?x dbo:parent ?y.
				  ?y a ?typeY .
				  ?x a ?typeX .
				  dbo:parent rdfs:domain ?domain;
				             rdfs:range ?range .
				  FILTER (?typeX = ?domain and ?typeY = ?range)
				  FILTER(strstarts(str(?typeX),str(dbo:)))
				  FILTER NOT EXISTS {?y a ?subtype. ?subtype rdfs:subClassOf ?typeY}
			 } 
	 LIMIT 100
	}
}