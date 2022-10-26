
-- Live demonstrations of the effects of this mapping at: https://tinyurl.com/37m8ybsc
-- Upadate Rule based on graph

RDFS_RULE_SET ('urn:rdfs:subclass:subproperty:inference:rules', 'urn:rdfs:subclass:subproperty:mappings') ;

-- ABox Data
SPARQL CLEAR GRAPH <urn:dbpedia.org:book:abox> ;  
SPARQL SELECT COUNT(*) FROM <urn:dbpedia.org:book:abox> WHERE {?s ?p ?o} ;-- SPARQL DEFINE get:soft "no-sponge" LOAD <https://tinyurl.com/3np4cta5> INTO <urn:dbpedia.org:book:abox> ;
SPARQL DEFINE get:soft "no-sponge" LOAD <https://tinyurl.com/2ryc3w9j> INTO <urn:dbpedia.org:book:abox> ; 

-- Check 
SPARQL SELECT COUNT(*) FROM <urn:dbpedia.org:book:abox> WHERE {?s ?p ?o} ;

-- TBox Data 
SPARQL CLEAR GRAPH <urn:dbpedia.org:book:schema> ;
SPARQL SELECT COUNT(*) FROM <urn:dbpedia.org:book:schema> WHERE {?s ?p ?o} ;
SPARQL SELECT DISTINCT ?p FROM <urn:dbpedia.org:book:schema> WHERE {?s ?p ?o} ;

-- SPARQL DEFINE get:soft "no-sponge" LOAD <https://tinyurl.com/yk6b5zpz> INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dbp: <http://dbpedia.org/property/> LOAD dbp:author INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dbp: <http://dbpedia.org/property/> LOAD dbp:pages INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dbp: <http://dbpedia.org/property/> LOAD dbp:pubDate INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dbo: <http://dbpedia.org/ontology/> LOAD dbo:isbn INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dbo: <http://dbpedia.org/ontology/> LOAD dbo:birthDate INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dbo: <http://dbpedia.org/ontology/> LOAD dbo:birthYear INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dct: <http://purl.org/dc/terms/> LOAD dct:subject INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dbp: <http://www.w3.org/2000/01/rdf-schema#> LOAD rdfs:comment INTO  <urn:dbpedia.org:book:schema> ;
SPARQL DEFINE get:soft "no-sponge" PREFIX dbp: <http://www.w3.org/2000/01/rdf-schema#> LOAD rdfs:label INTO  <urn:dbpedia.org:book:schema> ;
-- Check
SPARQL SELECT COUNT(*) FROM <urn:dbpedia.org:book:schema> WHERE {?s ?p ?o} ;
SPARQL SELECT DISTINCT * FROM <urn:dbpedia.org:book:schema> WHERE {?s ?p ?o} ;



-- The triples in this document are to be loaded into a GraphQL Mappings Named Graph denoted by an IRI of the operators choosing; once loaded,
-- said named graph is then used to update the GraphQL Bridge using the following:
-- TTLP (GQL_CREATE_TYPE_SCHEMA ('{named-graph-iri-for-these-triples}'), '', 'urn:graphql:intro');
-- GraphQL Mapping Graph 

-- Clean
SPARQL CLEAR GRAPH <urn:graphql:dbpedia:bridge:books> ;

SPARQL
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX	gql: <http://www.openlinksw.com/schemas/graphql#> 
PREFIX dct: <http://purl.org/dc/terms/> 

INSERT DATA INTO <urn:graphql:dbpedia:bridge:books>
{
    #  DBpedia to GraphQL Map Description 
    gql:Map gql:schemaObjects gql:DBpediaBook, gql:DBpediaBooks, gql:Author, gql:Authors ; # Target GraphQL Entity Types List
            gql:dataGraph <urn:dbpedia.org:book:abox> ; # DBpedia ABox Graph
            gql:schemaGraph <urn:dbpedia.org:book:schema> . # DBpedia TBox Graph

    # DBpedia Class to GraphQL Entity Type Mappings #
    gql:DBpediaBook gql:type gql:Object ;
        gql:rdfClass dbo:Book .

    gql:DBpediaBooks gql:type gql:Array ;
        gql:rdfClass dbo:Book .

    gql:Author gql:type gql:Object ;
        gql:rdfClass dbo:Person .
    
    gql:Authors gql:type gql:Object ;
        gql:rdfClass dbo:Person .


    # GraphQL Entity Field (Property) to DBpedia Property Mappings #
    dbp:author a owl:ObjectProperty ;
        rdfs:range dbo:Person ;
        rdfs:domain dbo:Book ;
        gql:type gql:Array ;
        gql:field gql:author .

    dbo:isbn a owl:DatatypeProperty ;
        rdfs:range xsd:string ;
        rdfs:domain dbo:Book ;
        gql:type gql:Scalar ;
        gql:field gql:isbn .

    dbp:releaseDate a owl:DatatypeProperty ;
        rdfs:range xsd:int ;
        rdfs:domain dbo:Book ;
        gql:type gql:Scalar ;
        gql:field gql:releaseDate .

    dbp:pubDate a owl:DatatypeProperty ;
        rdfs:range xsd:date ;
        rdfs:domain dbo:Book ;
        gql:type gql:Scalar ;
        gql:field gql:pubDate .

    dbp:pages a owl:DatatypeProperty ;
        rdfs:range xsd:int ;
        rdfs:domain dbo:Book ;
        gql:type gql:Scalar ;
        gql:field gql:pages .

    rdfs:label a owl:DatatypeProperty ;
        rdfs:range xsd:string ;
        rdfs:domain dbo:Book, dbo:Person ;
        gql:type gql:Scalar ;
        gql:field gql:name .

    rdfs:comment a owl:DatatypeProperty ;
        rdfs:range xsd:string ;
        rdfs:domain dbo:Book, dbo:Person ;
        gql:type gql:Scalar ;
        gql:field gql:description .

    dct:subject a owl:DatatypeProperty ;
        rdfs:range xsd:string ;
        rdfs:domain dbo:Book ;
        gql:type gql:Array ;
        gql:field gql:subject .

    dbo:birthYear a owl:DatatypeProperty ;
        rdfs:range xsd:string ;
        rdfs:domain dbo:Person ;
        gql:type gql:Scalar ;
        gql:field gql:birthYear .

    dbo:birthDate a owl:DatatypeProperty ;
        rdfs:range xsd:string ;
        rdfs:domain dbo:Person ;
        gql:type gql:Scalar ;
        gql:field gql:birthDate .

    dbo:deathYear a owl:DatatypeProperty ;
        rdfs:range xsd:string ;
        rdfs:domain dbo:Person ;
        gql:type gql:Scalar ;
        gql:field gql:deathYear .
} ;

-- Clear Introspection Graph 
SPARQL CLEAR GRAPH <urn:graphql:intro:dbpedia> ;  

-- Update GQL Bridge Type Schema
GQL_INIT_TYPE_SCHEMA(); -- Initialize GQL Type Schema for modification 
GQL_INTRO_DEL ('urn:graphql:intro:dbpedia'); -- Add modified Instrospection Data to GQL Bridge Type System Schema


TTLP (GQL_GENERATE_INTRO ('
        type Query {
            "DBpedia Books"
            DBpediaBooks(name: String, iri: IRI, isbn: String): [DBpediaBook]
            "Authors"
            Authors(name: String, iri: IRI, isbn: String): [Author]
        }

        " [DBpediaBook class](http://dbpedia.org/ontology/Book) "
        type DBpediaBook {
            iri: IRI!
            isbn: String
            name: String
            description: String
            subject: String
            author: [Author]
            pubDate: String
            pages: Int

        }

        " [Author class](http://dbpedia.org/ontology/Person) "
        type Author {
            iri: IRI!
            name: String
            description: String
            birthYear: String
            birthDate: String
            deathYear: String
        }

'), '', 'urn:graphql:intro:dbpedia');

GQL_INTRO_ADD ('urn:graphql:intro:dbpedia'); -- Add modified Instrospection Data to GQL Bridge Type System Schema
