SPARQL

PREFIX ontology: <https://www.omg.org/spec/DOL/20171106/DOL-terms#> 
PREFIX ontology-doc: <https://www.omg.org/spec/DOL/20171106/DOL-terms.rdf> 
PREFIX vocab: <http://open.vocab.org/terms/>
PREFIX wdrs: <http://www.w3.org/2007/05/powder-s#>

INSERT INTO <urn:uriburner:ontology:fixes> 
{
    ?s rdfs:isDefinedBy ontology: . 
    ontology: a owl:Ontology ;
              vocab:defines ?s .
    ?s wdrs:describedby ontology-doc: . 
}
FROM ontology-doc:
WHERE {  
        { ?s rdfs:subClassOf ?o } 
        UNION 
        { ?s rdfs:subPropertyOf ?o } 
        UNION 
        { ?s owl:equivalentClass ?o } 
        UNION 
        { ?s owl:equivalentProperty ?o } 
        UNION 
        { ?s a ?o }
      }
