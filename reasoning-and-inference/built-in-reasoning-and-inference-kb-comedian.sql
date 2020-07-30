SPARQL CLEAR GRAPH <urn:qa:ifr:kbpedia:comedian:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:comedian:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:comedian:abox>;

--KBpedia Tbox (Terminology Box)

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT 
    {
        GRAPH <urn:qa:ifr:kbpedia:comedian:tbox>
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
                    FILTER (?class = kbpedia:Comedian).
                }
        }
        
    };

-- Wikidata Tbox (Terminology Box)

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT 
    {
        GRAPH <urn:qa:ifr:wikidata:comedian:tbox>
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
                    FILTER (?class = wd:Q245068).
                }
        }
        
    };

-- Wikidata Abox (Assertions Box)

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT 
{ 
    GRAPH <urn:qa:ifr:wikidata:comedian:abox>
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
                    FILTER (?p = wdt:P106 && ?class = wd:Q245068).
                }
            LIMIT 100
        }
        
    };

SPARQL 
CLEAR  GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> ;
DELETE
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:comedian:owl:equivalent:class:subproperty:inference:rules' ;

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

DELETE {
         GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> 
            {
              #kbpedia:Comedian owl:equivalentClass wd:Q245068 .
              wd:Q245068 owl:equivalentClass kbpedia:Comedian .

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
                kbpedia:Comedian owl:equivalentClass wd:Q245068 .
               #wd:Q245068 owl:equivalentClass kbpedia:Comedian .
                wdt:P106 rdfs:subPropertyOf rdf:type .
                owl:equivalentProperty a owl:TransitiveProperty . 
                owl:equivalentClass a owl:TransitiveProperty.  
                rdfs:subPropertyOf a owl:TransitiveProperty .
                rdfs:subClassOf a owl:TransitiveProperty . 
            }
       } ;

RDFS_RULE_SET ('urn:kbpedia:comedian:owl:equivalent:class:subproperty:inference:rules', 'https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip') ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:comedian:owl:equivalent:class:subproperty:inference:rules' ;

-- Tests

-- 1.1 Test using class kbpedia:Comedian


SPARQL
DEFINE input:inference 'urn:kbpedia:comedian:owl:equivalent:class:subproperty:inference:rules'
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE 
    {
        ?s a kbpedia:Comedian .
    } ;


-- Test 1.2: without reasoning

SPARQL
# DEFINE input:inference 'urn:kbpedia:comedian:owl:equivalent:class:subproperty:inference:rules'
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE 
    {
        ?s a kbpedia:Comedian .
    } ;

-- Tests

-- 2.1 Test using class wdt:Q245068

SPARQL
DEFINE input:inference 'urn:kbpedia:comedian:owl:equivalent:class:subproperty:inference:rules'
PREFIX wd: <http://www.wikidata.org/entity/>

SELECT COUNT(*)
WHERE 
    {
        ?s a wd:Q245068 .
    } ;

-- Test 2.2: without reasoning
SPARQL
# DEFINE input:inference 'urn:kbpedia:comedian:owl:equivalent:class:subproperty:inference:rules'
PREFIX wd: <http://www.wikidata.org/entity/>

SELECT COUNT(*)
WHERE 
    {
        ?s a wd:Q245068 .
    } ;