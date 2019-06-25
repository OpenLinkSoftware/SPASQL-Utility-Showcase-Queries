--Cleanup

SPARQL CLEAR GRAPH <urn:inference:oplfaq>;

SPARQL CLEAR GRAPH <https://github.com/OpenLinkSoftware/Turtle-Based-FAQ-Documents/raw/master/quora-faqs.ttl>;

DELETE
FROM DB.DBA.SYS_RDF_SCHEMA 
WHERE RS_NAME = 'urn:inference:oplfaq:rule' ;

--Load FAQ .TTL

SPARQL LOAD <https://github.com/OpenLinkSoftware/Turtle-Based-FAQ-Documents/raw/master/quora-faqs.ttl>;

--Load Rules

SPARQL 
PREFIX oplfaq: <http://www.openlinksw.com/ontology/faq#>
PREFIX schema: <http://schema.org/>

INSERT INTO GRAPH <urn:inference:oplfaq>
{
oplfaq:Agent rdfs:subClassOf schema:Agent.
oplfaq:Question rdfs:subClassOf schema:Question.
oplfaq:answer rdfs:subPropertyOf schema:acceptedAnswer.
oplfaq:hasQuestionText rdfs:subPropertyOf schema:text.
oplfaq:hasAnswerText rdfs:subPropertyOf schema:text.   
};


--Confirm addition of rules

SPARQL
PREFIX oplfaq: <http://www.openlinksw.com/ontology/faq#>
PREFIX schema: <http://schema.org/>
SELECT * 
FROM <urn:inference:oplfaq>
WHERE
     {
      ?s ?p ?o.
     };

--Create built-in inference rule

rdfs_rule_set(
    'urn:inference:oplfaq:rule',
    'urn:inference:oplfaq'
);

SELECT * 
FROM DB.DBA.SYS_RDF_SCHEMA 
WHERE RS_NAME = 'urn:inference:oplfaq:rule' ; 

--Test without built-in inference rule

SPARQL
PREFIX schema: <http://schema.org/>
PREFIX oplfaq: <http://www.openlinksw.com/ontology/faq#>

SELECT *
FROM <https://github.com/OpenLinkSoftware/Turtle-Based-FAQ-Documents/raw/master/quora-faqs.ttl>
WHERE
        {
            ?s a schema:Question;
            schema:acceptedAnswer ?answer.
        };

--Test with built-in inference rule

SPARQL
DEFINE input:inference 'urn:inference:oplfaq:rule'
PREFIX schema: <http://schema.org/>
PREFIX oplfaq: <http://www.openlinksw.com/ontology/faq#>

SELECT *
FROM <https://github.com/OpenLinkSoftware/Turtle-Based-FAQ-Documents/raw/master/quora-faqs.ttl>
WHERE
        {
            ?s a schema:Question;
            schema:acceptedAnswer ?answer.
        };
