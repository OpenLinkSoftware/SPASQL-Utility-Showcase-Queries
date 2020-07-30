SPARQL CLEAR GRAPH <urn:qa:ifr:kbpedia:mime-artist:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:mime-artist:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:mime-artist:abox>;

--KBpedia Tbox (Terminology Box)

SPARQL

PREFIX wdt: <http://www.wikidata.org/entity/>
PREFIX wd: <http://www.wikidata.org/prop/direct/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT INTO GRAPH <urn:qa:ifr:kbpedia:stage-actor:tbox>
    {
        ?class a ?o
    }

WHERE
    {
        SERVICE <https://wikidata.demo.openlinksw.com/sparql>
            {
                SELECT *
                # FROM <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip>
                WHERE
                    {
                        ?class a ?o.
                        FILTER (?class = kbpedia:Mime-Actor).
                    }
            }
    };

-- Wikidata Tbox (Terminology Box)

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT INTO GRAPH <urn:qa:ifr:wikidata:stage-actor:tbox>
     {
         ?class a ?o
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
                    FILTER (?class = wd:Q674067).
                }
        }
        
    };

-- Wikidata Abox (Assertions Box)

SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT INTO GRAPH <urn:qa:ifr:wikidata:stage-actor:abox>
{
    ?entity ?p ?class
}
WHERE
    {
        SERVICE <https://wikidata.demo.openlinksw.com/sparql>
        {
            SELECT *
            WHERE
                {
                    ?entity ?p ?class.
                    FILTER (?p = wdt:P106 && ?class = wd:Q674067).
                }
            LIMIT 100
        }    
    };

-- Built-in inference rules

DELETE
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules' ;


SPARQL
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

INSERT INTO  GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> 
    {
        kbpedia:Mime-Actor owl:equivalentClass wd:Q674067 .
        wdt:P106 rdfs:subPropertyOf rdf:type .
        owl:equivalentProperty a owl:TransitiveProperty . 
        owl:equivalentClass a owl:TransitiveProperty.  
        rdfs:subPropertyOf a owl:TransitiveProperty .
        rdfs:subClassOf a owl:TransitiveProperty . 
    };

RDFS_RULE_SET ('urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules', 'https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip') ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules' ;

-- Tests

-- 1.1 Test using class kbpedia:Mime-Actor


SPARQL
DEFINE input:inference 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules'

PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
        ?s a kbpedia:Mime-Actor .
      } ;


-- Test 1.2: without reasoning

SPARQL
# DEFINE input:inference 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules'

PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
        ?s a kbpedia:Mime-Actor .
      } ;

-- Tests

-- 2.1 Test using class wdt:Q674067

SPARQL
DEFINE input:inference 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules'

PREFIX wd: <http://www.wikidata.org/entity/>

SELECT COUNT(*)
WHERE {
        ?s a wd:Q674067 .
      } ;

-- Test 2.2: without reasoning
SPARQL
# DEFINE input:inference 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules'
PREFIX wd: <http://www.wikidata.org/entity/>


SELECT COUNT(*)
WHERE {
        ?s a wd:Q674067 .
       } ;