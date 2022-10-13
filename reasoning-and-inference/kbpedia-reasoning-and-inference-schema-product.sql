-- Test query 1.1: COUNT-focused query without inference rule, nor same-as pragma

SPARQL
#DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'
#DEFINE input:same-as "yes"
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
        ?s a schema:Product .
       } ;

-- Test query 1.2: COUNT-focused query with inference rule, without same-as pragma

SPARQL
DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'
#DEFINE input:same-as "yes"
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
        ?s a schema:Product .
       } ;

-- Test query 1.3: COUNT-focused query with inference rule and same-as pragma

SPARQL
DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'
DEFINE input:same-as "yes"
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
        ?s a schema:Product .
       } ;

-- Test query 1.4: Query without inference rule, nor same-as pragma

SPARQL
#DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'
#DEFINE input:same-as "yes"
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT DISTINCT ?s
WHERE {
        ?s a schema:Product .
       } 

LIMIT 100;

-- Test query 1.5: Query with inference rule, without same-as pragma

SPARQL
DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'
#DEFINE input:same-as "yes"
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT DISTINCT ?s
WHERE {
        ?s a schema:Product .
       } 

LIMIT 100;

-- Test query 1.6: Query with inference rule and same-as pragma

SPARQL
DEFINE input:inference 'urn:kbpedia:owl:equivalent:class:subproperty:inference:rules'
DEFINE input:same-as "yes"
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT DISTINCT ?s
WHERE {
        ?s a schema:Product .
       }   

LIMIT 100;    
