SPARQL CLEAR GRAPH <urn:qa:ifr:kbpedia:philosopher:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:philosopher:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:philosopher:abox>;

--KBpedia Tbox (Terminology Box)

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT  
    { 
        GRAPH <urn:qa:ifr:kbpedia:philosopher:tbox>
            {
                ?class a ?o
            }
    }

WHERE
    {
        SERVICE <https://wikidata.demo.openlinksw.com/sparql>
        {
            SELECT *
            FROM <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip>
            WHERE
                {
                    ?class a ?o.
                    FILTER (?class = kbpedia:Philosopher).
                }
        }
        
    };

-- Wikidata Tbox (Terminology Box)

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT 
    { 
        GRAPH <urn:qa:ifr:wikidata:philosopher:tbox>
            {
                ?class a ?o
            }
    }
WHERE
    {
        SERVICE <https://wikidata.demo.openlinksw.com/sparql>
        {
            SELECT *
            #FROM <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip>
            WHERE
                {
                    ?class a ?o.
                    FILTER (?class = wd:Q4964182).
                }
        }
        
    };

-- Wikidata Abox (Assertions Box)

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT
    { 
        GRAPH <urn:qa:ifr:wikidata:philosopher:abox>
            {
                ?entity ?p ?class
            }
    }

WHERE
    {
        SERVICE <https://wikidata.demo.openlinksw.com/sparql>
        {
            SELECT *
            WHERE
                {
                    ?entity ?p ?class.
                    FILTER (?p = wdt:P106 && ?class = wd:Q4964182).
                }
            LIMIT 100
        }
        
    };

SPARQL 
CLEAR  GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> ;
DELETE
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:philosopher:owl:equivalent:class:subproperty:inference:rules' ;

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

DELETE {
         GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> 
            {
              wd:Q4964182 owl:equivalentClass kbpedia:Philosopher .

            }
        } ;

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT {
         GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> 
            {
                kbpedia:Philosopher owl:equivalentClass wd:Q4964182 .
               #wd:Q4964182 owl:equivalentClass kbpedia:Philosopher .
                wdt:P106 rdfs:subPropertyOf rdf:type .
                owl:equivalentProperty a owl:TransitiveProperty . 
                owl:equivalentClass a owl:TransitiveProperty.  
                rdfs:subPropertyOf a owl:TransitiveProperty .
                rdfs:subClassOf a owl:TransitiveProperty . 
            }
       } ;

RDFS_RULE_SET ('urn:kbpedia:philosopher:owl:equivalent:class:subproperty:inference:rules', 'https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip') ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:philosopher:owl:equivalent:class:subproperty:inference:rules' ;

-- Tests

-- 1.1 Test using class kbpedia:Philosopher


SPARQL
DEFINE input:inference 'urn:kbpedia:philosopher:owl:equivalent:class:subproperty:inference:rules'

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>


SELECT COUNT(*)
WHERE 
    {
        ?s a kbpedia:Philosopher .
    } ;


-- Test 1.2: without reasoning

SPARQL
# DEFINE input:inference 'urn:kbpedia:philosopher:owl:equivalent:class:subproperty:inference:rules'
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE 
    {
        ?s a kbpedia:Philosopher .
    } ;

-- Tests

-- 2.1 Test using class wdt:Q4964182

SPARQL
DEFINE input:inference 'urn:kbpedia:philosopher:owl:equivalent:class:subproperty:inference:rules'

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>


SELECT COUNT(*)
WHERE 
    {
        ?s a wd:Q4964182 .
    } ;

-- Test 2.2: without reasoning

SPARQL
# DEFINE input:inference 'urn:kbpedia:philosopher:owl:equivalent:class:subproperty:inference:rules'
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE 
    {
        ?s a wd:Q4964182 .
    } ;