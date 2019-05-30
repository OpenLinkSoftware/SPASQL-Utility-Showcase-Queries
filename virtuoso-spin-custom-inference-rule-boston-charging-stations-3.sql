-- Cleanup

SPARQL CLEAR GRAPH <urn:spin:rule:geospatial:lib4> ;

SPARQL DROP SPIN  LIBRARY <urn:spin:rule:geospatial:lib4> ;

-- Load Rules from data source

-- SPARQL

-- DEFINE get:soft "no-sponge"
-- LOAD <http://kingsley.idehen.net/DAV/home/kidehen/Public/SPIN%20Rules/geospatial-rules.ttl> INTO <urn:spin:rule:geospatial:lib4> ;

-- LOAD Rules using TTLP to exclude ldp: relations injected by LDP container rules in use at idehen.net

TTLP ('
    @prefix sp:      <http://spinrdf.org/sp#> .
    @prefix spl:     <http://spinrdf.org/spl#> .
    @prefix spin:    <http://spinrdf.org/spin#> .
    @prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
    @prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
    @prefix xsd:     <http://www.w3.org/2001/XMLSchema#> .
    @prefix foaf:    <http://xmlns.com/foaf/0.1/> .
    @prefix  rel:    <http://purl.org/vocab/relationship/> .
    @prefix wdrs:    <http://www.w3.org/2007/05/powder-s#> .
    @prefix schema:  <http://schema.org/> .
    @prefix sioc:    <http://rdfs.org/sioc/ns#> .
    @prefix owl:     <http://www.w3.org/2002/07/owl#> .

    sioc:Item
        a          rdfs:Class ;
        rdfs:label "An Item"^^xsd:string ;
        spin:rule  [ a            sp:Construct, spin:Rule ;
                     rdfs:label   "Latitude Rule -- via RDF-Turtle Document";
                     rdfs:comment """Handler for different kinds of Latitude oriented fields (relations). This
                                     rule has been loaded into Virtuoso via SQL (using SPASQL functionality).""" ;
                     sp:text      """
                                     CONSTRUCT { ?this <#hasLatitude> ?n . }
                                     WHERE
                                       {
                                         FILTER (contains(str(?p),"latitude") || contains(str(?p),"Latitude") ) .
                                         ?this ?p ?n
                                       }
                                  """ ;
                     schema:uri   <#LatitudeRule1>
                   ] ;
        spin:rule  [ a            sp:Construct, spin:Rule;
                     rdfs:label   "Longitude Rule -- via RDF-Turtle Document" ;
                     rdfs:comment """Handler for different kinds of Longitude oriented fields (relations). This
                                     rule has been loaded into Virtuoso via SQL (using SPASQL functionality).""" ;
                     sp:text      """
                                     CONSTRUCT { ?this <#hasLongitude> ?n. }
                                     WHERE
                                       {
                                         FILTER (contains(str(?p),"longitude") || contains(str(?p),"Longitude") ) .
                                         ?this ?p ?n
                                       }
                                  """ ;
                     schema:uri   <#LongitudeRule1>
                   ] .
     ','', 'urn:spin:rule:geospatial:lib4', 4096 
     ) ;

SPARQL
SELECT ( COUNT (*) as ?count )
FROM <urn:spin:rule:geospatial:lib4> 
WHERE { ?s ?p ?o } ;

-- Remove rdf:type relations that have ldp:Resource, rdf:Resource as objects

-- SPARQL DELETE WHERE { GRAPH <urn:spin:rule:geospatial:lib4> { <http://kingsley.idehen.net/DAV/home/kidehen/Public/SPIN%20Rules/geospatial-rules.ttl> ?p ?o }};

-- Remove even more:

-- SPARQL DELETE WHERE { GRAPH <urn:spin:rule:geospatial:lib4> { <http://kingsley.idehen.net/about/id/http/kingsley.idehen.net/DAV/home/kidehen/Public/SPIN%20Rules/geospatial-rules.ttl> ?p ?o }};
-- SPARQL DELETE WHERE { GRAPH <urn:spin:rule:geospatial:lib4> { <http://kingsley.idehen.net/DAV/home/kidehen/Public/SPIN%20Rules/geospatial-rules.ttl#this> ?p ?o } };

-- SPARQL

-- select distinct ?o from <urn:spin:rule:geospatial:lib4> where {?s a ?o} ;

-- Generate Macros

EXEC ('SPARQL ' || SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:spin:rule:geospatial:lib4'));

-- Test Queries

-- Data Set #1

SPARQL

DEFINE get:soft "soft"
DEFINE input:macro-lib <urn:spin:rule:geospatial:lib4> 

SELECT ?x ?y ?z
FROM <http://bostonopendata-boston.opendata.arcgis.com/datasets/465e00f9632145a1ad645a27d27069b4_2.csv>
WHERE
  {
    ?x a               sioc:Item .
    ?x <#hasLatitude>  ?y .
    ?x <#hasLongitude> ?z .
  } ;

-- Data Set #2

SPARQL

DEFINE get:soft "soft"
DEFINE input:macro-lib <urn:spin:rule:geospatial:lib4> 

SELECT ?y ?z
FROM <http://bostonopendata-boston.opendata.arcgis.com/datasets/465e00f9632145a1ad645a27d27069b4_2.csv>
FROM <http://bostonopendata-boston.opendata.arcgis.com/datasets/de08c6fe69c942509089e6db98c716a3_0.csv>
FROM <http://kingsley.idehen.net/DAV/home/danielhm/Public/ca-cities-sample.csv>
WHERE
  {
    ?x a               sioc:Item .
    ?x <#hasLatitude>  ?y .
    ?x <#hasLongitude> ?z .
  } ;
