-- Brisith Royal Family Custom Inference Rules Test Queries
-- Assumes existence of Custom Inference Rules 
-- accessible from Macro Library "urn:spin:nanotation:demo:royal:family:lib"

-- Test 1

SPARQL 
DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>
PREFIX  rel:  <http://purl.org/vocab/relationship/> 
WITH <urn:spin:nanotation:demo:royal:family>
SELECT *
WHERE { ?s a <#RoyalPerson> . };

-- Test 2

SPARQL 
DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>
PREFIX  rel:  <http://purl.org/vocab/relationship/> 
WITH <urn:spin:nanotation:demo:royal:family>
SELECT *
WHERE { ?s a ?t . };

-- Test 3

SPARQL 
DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>
PREFIX  rel:  <http://purl.org/vocab/relationship/> 
WITH <urn:spin:nanotation:demo:royal:family>
SELECT *
WHERE { ?s a <#RoyalPerson> ; rel:siblingOf ?sibling . };

-- Test 4 
SPARQL 
DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>
PREFIX  rel:  <http://purl.org/vocab/relationship/> 
WITH <urn:spin:nanotation:demo:royal:family>
SELECT *
WHERE { ?s a <#RoyalPerson> ; rel:grandParent ?gp . };

-- Test 5 

SPARQL
DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>
PREFIX  rel:  <http://purl.org/vocab/relationship/>
WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person rel:ancestorOf as ?relation ?descendant
WHERE { ?person a <#RoyalPerson> ;
           rel:ancestorOf ?descendant . } ;

-- Test 6
	  
SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT DISTINCT ?person rel:siblingOf as ?relation ?siblingOf
WHERE { ?person  a <#RoyalPerson> ; 
         rel:siblingOf  ?siblingOf  
  	  } ;
  
	
-- Test 7

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person <#hasAuntie> as ?relation  ?hasAuntie
WHERE { ?person a <#RoyalPerson> ; 
        <#hasAuntie> ?hasAuntie
	   } ;

-- Test 8

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person <#hasUncle> as ?relation ?hasUncle
WHERE { ?person a <#RoyalPerson> ; 
       <#hasUncle> ?hasUncle
	  } ;


-- Test 9

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person <#hasUncle2> as ?relation ?hasUncle2
WHERE { ?person a <#RoyalPerson> ; 
       <#hasUncle2> ?hasUncle2
	  } ;


-- Test 10

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person <#hasCousin> as ?relation ?hasCousin
WHERE { ?person a <#RoyalPerson> ; 
        <#hasCousin> ?hasCousin 
       } ;

-- Test 11

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person <#hasCousin2> as ?relation ?hasCousin2
WHERE { ?person a <#RoyalPerson> ; 
        <#hasCousin2> ?hasCousin2 
       } ;


-- Test 12

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?s as ?ancestor 
       ?descendant
WHERE { ?s a <#RoyalPerson> ; 
       rel:ancestorOf ?descendant 
	  };


-- Test 13

SPARQL

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT DISTINCT *
WHERE {
		{ ?parent a <#RoyalPerson> ; rel:parentOf ?parentOf .}
		UNION 
		{ ?person a foaf:Person; <#hasAuntie> ?hasAuntie .}
		UNION 
		{ ?person a foaf:Person; <#hasUncle> ?hasUncle .}
		UNION 
		{ ?person a foaf:Person; <#hasCousin> ?hasCousin .}
		UNION 
		{ ?person a foaf:Person; <#hasUncle2> ?hasUncle2 .}
		UNION 
		{ ?person a foaf:Person; <#hasCousin2> ?hasCousin2 .}
		UNION 
		{ ?person a foaf:Person; rel:siblingOf ?hasSibling . }
		UNION 
		{ ?person a foaf:Person; rel:ancestorOf ?hasDescendant . }
} ;
