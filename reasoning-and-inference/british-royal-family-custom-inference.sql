SPARQL DROP SPIN  LIBRARY <urn:spin:nanotation:demo:royal:family:lib> ; 
SPARQL CLEAR GRAPH <urn:spin:nanotation:demo:royal:family>
;

SPARQL
PREFIX wdrs: <http://www.w3.org/2007/05/powder-s#> 
PREFIX schema: <http://schema.org/>
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
INSERT
		 {
		 			
			 		## Custom Entity Relationship Types (Relations) ##
 
   			 <#hasRelative>
   			 a rdf:Property ;
   			 rdfs:label "hasRelative" ;
   			 rdfs:comment """Generic Family Relationship""" ;
   			 rdfs:domain foaf:Person ;
   			 rdfs:range <#MalePerson>, <#FemalePerson>, <#RoyalPerson>, foaf:Person, schema:Person ;
   			 wdrs:describedby <#> .
			 
			 <#hasUncle>
			 a rdf:Property ;
			 rdfs:subPropertyOf <#hasRelative> ;
			 rdfs:label "hasUncle" ;
			 rdfs:comment """Relationship Type that's derived from a SPARQL-based Custom Inference Rule
			 			   that associates a Person with a Male Person that's a sibling of one of their Parents. 
						  """ ;
			 rdfs:domain foaf:Person ;
			 rdfs:range <#MalePerson> ;
			 wdrs:describedby <#> .
	 
			 <#hasAuntie>
			 a rdf:Property ;
			 rdfs:subPropertyOf <#hasRelative> ;
			 rdfs:label "hasAuntie" ;
			 rdfs:comment """Relationship Type that's derived from a SPARQL-based Custom Inference Rule
			 			   that associates a Person with a Female Person that's a sibling of one of their Parents. 
						  """ ;
 			 rdfs:domain foaf:Person ;
 			 rdfs:range <#FemalePerson> ;
			 wdrs:describedby <#> .
	 
			 <#hasCousin> 
			 a rdf:Property ;
			 rdfs:subPropertyOf <#hasRelative> ;
			 rdfs:label "hasCousin" ;
			 rdfs:comment """Relationship Type that's derived from a SPARQL-based Custom Inference Rule
			 			     that associates a Person with another Person; that's a child of the sibling of one of their Parents.
						  """ ;
  			 rdfs:domain foaf:Person ;
  			 rdfs:range <#FemalePerson>, <#MalePerson> ;
			 wdrs:describedby <#> .

	 
			 		## Custom Entity Types (Classes) ##
	 
	 
			 <#FemalePerson>
			 rdfs:subClassOf foaf:Person ;
			 rdfs:label "Female Person Class" ;
			 rdfs:comment """
			 			   A female person that inherits properties of the Person class identified by relative URI: foaf:Person.
						   The properties of this class are defined using custom inference rules using SPARQL via .
						   """ ;
			 wdrs:describedby <#> .
	 
			 <#MalePerson>
			 rdfs:subClassOf foaf:Person ;
			 rdfs:label "Male Person Class" ;
			 rdfs:comment """
			 			   A male person that inherits properties of the Person class identified by relative URI: foaf:Person.
						   The properties of this class are defined using custom inference rules using SPARQL via .
						   """ ;
			 wdrs:describedby <#> .
		 
			 			## Entity Relationships ##
					
			  <http://dbpedia.org/resource/Prince_William_of_Wales> 
			  a foaf:Person, <#MalePerson> ;
			  schema:name "Prince William" ;
			  rel:siblingOf <http://dbpedia.org/resource/Prince_Harry_of_Wales> .
									  					
			  <http://dbpedia.org/resource/Elizabeth_Bowes-Lyon> 
			  a foaf:Person, <#FemalePerson> ;
			  schema:name "Queen Mother" ;
			  rel:parentOf <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom> .
								
			  <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom> 
			  a foaf:Person, <#FemalePerson> ;
			  schema:name "Queen Elizabeth II" ;
			  rel:parentOf <http://dbpedia.org/resource/Charles,_Prince_of_Wales>,
						   <http://dbpedia.org/resource/Anne,_Princess_Royal>, 
						   <http://dbpedia.org/resource/Prince_Andrew,_Duke_of_York>, 
						   <http://dbpedia.org/resource/Prince_Edward,_Earl_of_Wessex> ;
			  rel:siblingOf <http://dbpedia.org/resource/Princess_Margaret,_Countess_of_Snowdon> .
								
			  <http://dbpedia.org/resource/Charles,_Prince_of_Wales> 
			  a foaf:Person, <#MalePerson> ;
			  schema:name "Prince Charles" ;
			  rel:parentOf <http://dbpedia.org/resource/Prince_William_of_Wales> , 
			  <http://dbpedia.org/resource/Prince_Harry_of_Wales> .
								
			 <http://dbpedia.org/resource/Princess_Margaret,_Countess_of_Snowdon> 
			 a foaf:Person, <#FemalePerson> ;
			 schema:name "Princess Margaret" . 
			 
			 <http://dbpedia.org/resource/Anne,_Princess_Royal> 
			 a foaf:Person, <#FemalePerson> ;
			 schema:name "Princess Anne" ;
			 rel:parentOf <http://dbpedia.org/resource/Peter_Phillips>, <http://dbpedia.org/resource/Zara_Phillips> .
								
			 <http://dbpedia.org/resource/Zara_Phillips> 
			 a foaf:Person, <#FemalePerson> ;
			 schema:name "Princess Zara Phillips" .
			 
			 <http://dbpedia.org/resource/Princess_Beatrice_of_York>  
			 a foaf:Person, <#FemalePerson> ;
			 schema:name "Princess Beatrice" .
			 
			 <http://dbpedia.org/resource/Princess_Eugenie_of_York>
			 a foaf:Person, <#FemalePerson> ;
			 schema:name "Princess Eugenie" .
			 
			 <http://dbpedia.org/resource/Prince_Andrew,_Duke_of_York> 
			 a foaf:Person, <#MalePerson> ;
			 schema:name "Prince Andrew" ;
			 rel:parentOf <http://dbpedia.org/resource/Princess_Eugenie_of_York>, 
			 <http://dbpedia.org/resource/Princess_Beatrice_of_York> .
								
			 <http://dbpedia.org/resource/Prince_Edward,_Earl_of_Wessex> 
			 a foaf:Person, <#MalePerson> ;
			 schema:name "Prince Edward" .
			 
			 <http://dbpedia.org/resource/Prince_Harry_of_Wales> 
			 a foaf:Person, <#MalePerson> ;
			 schema:name "Prince Harry" .
			 
			 <http://dbpedia.org/resource/Peter_Phillips> 
			 a foaf:Person, <#MalePerson> ;
			 schema:name "Prince Peter Phillips" . 
			
			 
		} ;

SPARQL
prefix foaf: <http://xmlns.com/foaf/0.1/>
WITH <urn:spin:nanotation:demo:royal:family>
INSERT { ?s a <#RoyalPerson> } where { ?s a foaf:Person }
;

-- Class Definition that includes SPIN Rules

SPARQL CLEAR GRAPH <urn:spin:nanotation:demo:royal:family:lib> ;

TTLP ('
## Collection of Inference Rules that describe
## various British Royal Family Relationship Types
@prefix owl:     <http://www.w3.org/2002/07/owl#> .
@prefix sp:    <http://spinrdf.org/sp#> .
@prefix spl:    <http://spinrdf.org/spl#> .
@prefix spin:    <http://spinrdf.org/spin#> .
@prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd:     <http://www.w3.org/2001/XMLSchema#> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix  rel:  <http://purl.org/vocab/relationship/> .
@prefix wdrs: <http://www.w3.org/2007/05/powder-s#> .
@prefix schema: <http://schema.org/> .
<#RoyalPerson>
a rdfs:Class ;
rdfs:label "A Royal Person"^^xsd:string ;
rdfs:subClassOf foaf:Person, schema:Person ;
spin:rule
          [ a sp:Construct ;
            sp:text """
		            ## A Royal Person must be related to Queen Elizabeth II as a Descendant, Ancestor, or Sibling
					
		            CONSTRUCT { ?n a ?this . } 
					WHERE {
		                	{ ?n rel:descendantOf+|rel:ancestorOf+|rel:siblingOf|^rel:siblingOf 									   									 <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom>. 
							}
            			  }
			"""
           ] ;
		  
spin:rule
          [ a sp:Construct ;
            sp:text """
			            ## Grand Parent Relationship Type
						
                        CONSTRUCT { ?this <http://purl.org/vocab/relationship/grandParent> ?x }
                        WHERE {
                                  { ?this <http://purl.org/vocab/relationship/parentOf> ?parent . 
								    ?parent <http://purl.org/vocab/relationship/parentOf> ?x . }
                              }
                     """
          ] ;
		  
spin:rule [ a sp:Construct ;
            sp:text """
					    ## Ancestor Relationship Type
						
                        CONSTRUCT { ?this rel:ancestorOf ?n } 
						WHERE  {
									{ ?this rel:parentOf+|^rel:descendantOf ?n . }
		
							   }
					"""
		  ] ;	
		  
spin:rule [ a sp:Construct ;
            sp:text """
					    ## Descendant Relationship Type
						
                        CONSTRUCT { ?this rel:descendantOf ?n } 
						WHERE {
								{ ?this ^rel:parentOf+ ?n . }		
							  }
				   """
		 ] ;
						
spin:rule [ a sp:Construct ;
            sp:text """
					    ## Grand Sibling Relationship Type
						
                        CONSTRUCT  { ?this rel:siblingOf ?n } 
						WHERE {
						   	  	{ [] rel:parentOf ?this, ?n.  
						          FILTER (?n != ?this) .
								}
						      }
					"""
		 ] ;
		    
spin:rule [ a sp:Construct ;
            sp:text """
			            ## Auntie Relationship Type
						
                        CONSTRUCT  { ?this <#hasAuntie> ?n } 
					    WHERE {				 
								 [] rel:parentOf ?n , ?prnt .
								 ?prnt rel:parentOf ?this .
								 FILTER (?n != ?prnt)
								 ?n a <#FemalePerson> .
							     
							  }	
					"""
		 ] ;
					  	
spin:rule [ a sp:Construct ;
            sp:text """
					    ## Uncle Relationship Type
						
                        CONSTRUCT { ?this <#hasUncle> ?n } 
					    WHERE 
					     {
						     [] a <#RoyalPerson> ;
							 rel:parentOf ?this ;
							 rel:siblingOf ?n .
							 ?n a <#MalePerson> .
					     }
					  """
		  ] ;
		  
spin:rule [ a sp:Construct ;
            sp:text """
						## Cousin Relationship Type
						
                        CONSTRUCT { ?this <#hasCousin> ?n } 
					    WHERE {
							     [] a <#RoyalPerson> ;
								 rel:parentOf ?this ;
								 rel:siblingOf ?n .
								 ?n a <#MalePerson> .
						     }
					"""
		 ] ;		
spin:rule [ a sp:Construct ;
            sp:text """
						## Uncle Relationship Type 2 -- more specific 
						
                        CONSTRUCT { ?this <#hasUncle2> ?n } 
					    WHERE 
					     {
						 [] rel:parentOf ?n , ?prnt .
						     ?prnt rel:parentOf ?this .
						     FILTER (?n != ?prnt)
						     ?n a <#MalePerson> .
					        
					     }	
					  """
		  ] ;
		  
spin:rule [ a sp:Construct ;
            sp:text """
			            ## Cousin Relationship Type 2 -- more specific 
						
                        CONSTRUCT { ?this <#hasCousin2> ?n } 
					    WHERE {
								  [] rel:parentOf ?n_prnt, ?this_prnt .
								  ?n_prnt rel:parentOf ?n .
								  ?this_prnt rel:parentOf ?this .
								   filter (?n_prnt != ?this_prnt)
					  		 }	
					"""
		 ] .			
',
'', 'urn:spin:nanotation:demo:royal:family:lib', 4096)
;

-- Macro Generation 
		
SELECT 
SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:spin:nanotation:demo:royal:family:lib');

-- STRING_TO_FILE ('urn_spin_nanotation_demo_royal_family_lib.sparql.sql', 'SPARQL ' || SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:spin:nanotation:demo:royal:family:lib') || ';', -2);

EXEC ('SPARQL ' || SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:spin:nanotation:demo:royal:family:lib'));

-- Test Queries

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
SELECT ?descendant rel:ancestorOf as ?relation ?ancestor
WHERE { ?ancestor a <#RoyalPerson> ; 
           rel:ancestorOf ?descendant
           FILTER (?descendant = dbpedia:Prince_William_of_Wales)
      } ;

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
