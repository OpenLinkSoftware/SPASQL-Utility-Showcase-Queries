-- Birth Year Relation Objects for
-- Persons denoted by <Person1> and <Person2> (SPARQL INSERT to Named Graphs)

SPARQL CLEAR GRAPH <urn:g1:data> ;
SPARQL CLEAR GRAPH <urn:g2:data> ;
SPARQL CLEAR GRAPH <urn:g3:data> ;
SPARQL CLEAR GRAPH <urn:metadata:notes> ;


SPARQL
PREFIX dbo: <http://dbpedia.org/ontology/> 

WITH <urn:g1:data>
INSERT { <urn:person:1> dbo:birthYear "1981". } ;

SPARQL
PREFIX dbo: <http://dbpedia.org/ontology/> 

WITH <urn:g2:data>
INSERT { <urn:person:1> dbo:birthYear "1983". } ;

SPARQL
PREFIX dbo: <http://dbpedia.org/ontology/> 

WITH <urn:g3:data>
INSERT  { <urn:person:2> dbo:birthYear "1982". } ;

-- metadata

SPARQL
PREFIX dbo: <http://dbpedia.org/ontology/> 

WITH <urn:metadata:notes>
INSERT { 
            <urn:g1:data> dc:modified "2016-11"^^xsd:gYearMonth .
            <urn:g2:data> dc:modified "2014-12"^^xsd:gYearMonth .
            <urn:g3:data> dc:modified "2012-01"^^xsd:gYearMonth . 
       } ;

-- query

SPARQL
PREFIX dbo: <http://dbpedia.org/ontology/> 

SELECT ?person ?birth 
WHERE {
        { 
            GRAPH ?g {?person dbo:birthYear ?birth } .
            GRAPH <urn:metadata:notes> {?g dc:modified ?modified} .
        } 
        FILTER NOT EXISTS {
                            GRAPH ?g2 {?person2 dbo:birthYear ?birth2 } .
                            GRAPH <urn:metadata:notes> { ?g2 dc:modified ?modified2 } .
                            FILTER ( ?person = ?person2 && ?modified2 > ?modified ) .
                          }
      } ;
