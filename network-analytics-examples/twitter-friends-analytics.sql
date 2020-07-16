--Cleanup

SPARQL CLEAR GRAPH <urn:analytics:acqof>;
SPARQL CLEAR GRAPH <urn:analytics:acqof:spin:rule>;
SPARQL DROP SPIN LIBRARY <urn:analytics:acqof:spin:rule> ;
DELETE FROM DB.DBA.SYS_RDF_SCHEMA WHERE RS_NAME = 'urn:analytics:acqof:rule';

-- Insert Rule
SPARQL

PREFIX rel: <https://vocab.org/relationship/#>

INSERT INTO GRAPH <urn:analytics:acqof>
    {
        foaf:knows owl:equivalentProperty rel:acquaintanceOf, opltw:follows . 

    };

-- Test Query

SPARQL

SELECT *
FROM <urn:analytics>
    {
        ?s foaf:knows ?o
    };

-- Set built-in inference rule

rdfs_rule_set('urn:analytics:acqof:rule','urn:analytics:acqof');

-- Test 1 - No Inference Rule

SPARQL

#DEFINE input:inference 'urn:analytics:acqof:rule'

PREFIX rel: <https://vocab.org/relationship/#>
SELECT COUNT(?s)
FROM <urn:analytics>
    {
        ?s rel:acquaintanceOf ?o
    };

-- Test 2 - With Inference Rule

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'

PREFIX rel: <https://vocab.org/relationship/#>
SELECT COUNT(?s)
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>

    {
        ?s rel:acquaintanceOf ?o
    };

-- Building Custom Inference rule
-- Test Query that adds opltw:User objects to rdf:type relations in test graph <urn:tweets:kg>

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'

PREFIX rel: <https://vocab.org/relationship/#>

INSERT INTO <urn:tweets:kg> {?s a opltw:User}
FROM <urn:tweets:kg>
    {
        ?s rel:acquaintanceOf ?o.
    };

-- Check 

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'

PREFIX rel: <https://vocab.org/relationship/#>

SELECT COUNT(?s)
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>

    {
        ?s rel:acquaintanceOf ?o
    };

-- Test Query that adds opltw:User objects to rdf:type relations in test graph <urn:twitter:analytics:all>

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'

PREFIX rel: <https://vocab.org/relationship/#>
INSERT INTO <urn:twitter:analytics:all> {?s a opltw:User}
FROM <urn:twitter:analytics:all>
    {
        ?s rel:acquaintanceOf ?o.
    };

-- Check 

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'

PREFIX rel: <https://vocab.org/relationship/#>

SELECT COUNT(?s)
FROM <urn:twitter:analytics:all>

    {
        ?s rel:acquaintanceOf ?o
    };


-- Test Query that adds opltw:User objects to rdf:type relations in test graph <urn:analytics>

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'

PREFIX rel: <https://vocab.org/relationship/#>

INSERT INTO <urn:analytics> {?s a opltw:User}
FROM <urn:analytics>
    {
        ?s rel:acquaintanceOf ?o.
    };

-- Check 

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'

PREFIX rel: <https://vocab.org/relationship/#>

SELECT COUNT(?s)
FROM <urn:analytics>
    {
        ?s rel:acquaintanceOf ?o
    };

-- Inference Rule Test Query tbat verifies eventual body of Custom Inference Rle

SPARQL

# CONSTRUCT {?s <#hasFriend> ?o . }
SELECT ?s <#hasFriend> ?o
WHERE
    {
        { ?s foaf:knows | opltw:follows ?o }
        {  ?s ^foaf:knows | ^opltw:follows ?o }
        FILTER(?o != ?s)
    } 
LIMIT 50 ;

-- Create Custom Inference Rule Definition 

SPARQL

PREFIX : <#>
PREFIX spin:  <http://spinrdf.org/spin#>
PREFIX sp: <http://spinrdf.org/sp#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
WITH <urn:analytics:acqof:spin:rule>
INSERT {
        opltw:User a owl:Class;
        rdfs:label "Twitter User Class";
        rdfs:comment """Instances of this Class are opltw:User values""";
        spin:rule[
                    a sp:Construct;
                    sp:text """
                                # Reciprocal foaf:knows relations i.e., two parties claim to 
                                # know one another as the basis for friendship i.e., <#hasFriend>
                                # relation is an owl:ObjectProperty as well as an owl:SymmetricProperty 
                                CONSTRUCT {?s <#hasFriend> ?o.}
                                WHERE
                                    {
                                         { 
                                           ?s foaf:knows ?o .
                                           ?s ^foaf:knows ?o .
                                         }
                                       # { ?s foaf:knows | opltw:follows ?o }
                                       # {  ?s ^foaf:knows | ^opltw:follows ?o }
                                        FILTER(?o != ?s)
                                    }
                            """
                     
                ].   
        };

-- Create Custom Inference Rule Creation and addition to Macro Library  

EXEC ('SPARQL ' || SPARQL_SPIN_GRAPH_TO_DEFSPIN('urn:analytics:acqof:spin:rule'));

-- Test 1: Control Check using Constants rather than variables 

SPARQL
SELECT DISTINCT ?s <#hasFriend> ?o
FROM <urn:twitter:analytics:all>
WHERE
    {  
        { ?s opltw:follows ?o }
        { ?s ^opltw:follows ?o }
        FILTER(?o != ?s)
        # FILTER (?s = <https://twitter.com/AfonzaCorp#this> )
        FILTER (?s = <https://twitter.com/clickfire#this> )
        FILTER (?o = <https://twitter.com/BrianLMayers#this> )
    } 
LIMIT 50 ;

-- Test 1.1:  Control Check using Constants rather than variables 
-- The solutions in 1 and 1.1 MUST match

SPARQL 
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 
DEFINE input:inference 'urn:analytics:acqof:rule'

SELECT DISTINCT ?s ?relation ?friend 
# FROM <urn:tweets:kg>
FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {  
        ?s a opltw:User; 
           <#hasFriend> ?friend .
        FILTER (?s = <https://twitter.com/clickfire#this> )
        FILTER (?friend = <https://twitter.com/BrianLMayers#this> )
        BIND ( <#hasFriend> as ?relation )
    }
LIMIT 50 ;

-- Test 2: No inference rule

SPARQL

DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 
DEFINE input:inference 'urn:analytics:acqof:rule'

SELECT DISTINCT COUNT(?friend)
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE {
        ?s a opltw:User; <#hasFriend> ?friend.
      };

-- Test 2.1: Without Inference Rule

SPARQL

# DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 
# DEFINE input:inference 'urn:analytics:acqof:rule'

SELECT DISTINCT COUNT(?friend)
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        ?s a opltw:User; <#hasFriend> ?friend.
    };

-- Test 2.2: With Inference Rule

SPARQL

DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 
DEFINE input:inference 'urn:analytics:acqof:rule'

SELECT ?s ?relation ?friend 
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        ?s a opltw:User; 
           <#hasFriend> ?friend .
        BIND ( <#hasFriend> as ?relation )
    }
LIMIT 50 ;

-- Test 2.3: Without Inference Rule

SPARQL

# DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 
# DEFINE input:inference 'urn:analytics:acqof:rule'

SELECT ?s ?relation ?friend 
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        ?s a opltw:User; 
           <#hasFriend> ?friend .
        BIND ( <#hasFriend> as ?relation )
    }
LIMIT 50 ;

-- Test 3: foaf:knows COUNT without Inference Rules 

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT DISTINCT COUNT(?acq)
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        ?s a opltw:User; 
            foaf:knows ?acq.
    } ;

-- Test 3: foaf:knows COUNT without Inference Rules

SPARQL

# DEFINE input:inference 'urn:analytics:acqof:rule'
# DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT DISTINCT COUNT(?acq)
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        ?s a opltw:User; 
            foaf:knows ?acq.
    } ;

-- Test 3.1: foaf:knows via Inference Rules

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT DISTINCT ?s ?relation ?acq
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        ?s a opltw:User; 
            foaf:knows ?acq .
        BIND (foaf:knows as ?relation)
    }
LIMIT 50 ;

-- Test 3: foaf:knows via Inference Rules

SPARQL

# DEFINE input:inference 'urn:analytics:acqof:rule'
# DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT DISTINCT ?s ?relation ?acq
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        ?s a opltw:User; 
            foaf:knows ?acq .
        BIND (foaf:knows as ?relation)
    } 
LIMIT 50 ;

-- Test 4: Friends and Followees Counts

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT ?friends ?followees 
# FROM <urn:tweets:kg>
FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        { 
         SELECT COUNT (*) as ?friends
         WHERE {
                 ?s a opltw:User; 
                 <#hasFriend> ?friend .
               }
        }

        { 
         SELECT COUNT (*) as ?followees
         WHERE {
                ?s a opltw:User; 
                opltw:follows ?followee .
               }
        } 
    }
LIMIT 50 ;

-- Test 4.1: Friends and Followees Counts without Inference

SPARQL

# DEFINE input:inference 'urn:analytics:acqof:rule'
# DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT ?friends ?followees 
# FROM <urn:tweets:kg>
FROM <urn:twitter:analytics:all>
# FROM <urn:analytics>
WHERE
    {
        { 
         SELECT COUNT (*) as ?friends
         WHERE {
                 ?s a opltw:User; 
                 <#hasFriend> ?friend .
               }
        }

        { 
         SELECT COUNT (*) as ?followees
         WHERE {
                ?s a opltw:User; 
                opltw:follows ?followee .
               }
        } 
    }
LIMIT 50 ;

-- Test 5: Max Followers and Followers of Friends with inference enabled
-- Kills server if ORDER BY CLAUSE is enabled and Named Graph is <urn:twitter:analytics:all> 

DEFINE input:inference 'urn:analytics:acqof:rule'
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT ?twitterHandle max(xsd:integer(?followers)) as ?followersCount ?relation ?friend max(xsd:integer(?followers2)) as ?friendFollowersCount
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
WHERE
    {
        ?twitterHandle a opltw:User; 
           opltw:followersCount ?followers ;
           <#hasFriend> ?friend .
        ?friend opltw:followersCount ?followers2. 

        BIND ( <#hasFriend> as ?relation )
    }
GROUP BY ?twitterHandle ?relation ?friend 
ORDER BY DESC 2
LIMIT 50  ;

-- Test 5: Max Followers and Followers of Friends with inference disabled

# DEFINE input:inference 'urn:analytics:acqof:rule'
# DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT ?twitterHandle max(xsd:integer(?followers)) as ?followersCount ?relation ?friend max(xsd:integer(?followers2)) as ?friendFollowersCount
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
WHERE
    {
        ?twitterHandle a opltw:User; 
           opltw:followersCount ?followers ;
           <#hasFriend> ?friend .
        ?friend opltw:followersCount ?followers2. 

        BIND ( <#hasFriend> as ?relation )
    }
GROUP BY ?twitterHandle ?relation ?friend 
ORDER BY DESC 2
LIMIT 50  ;

-- Example 6: Closeness Centrality 
-- Using Shortest Path
-- follower (@asemeota) is 2-degrees of separation from the followees i.e., he doesn't follow any of them directly

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

PREFIX foaf: <http://xmlns.com/foaf/0.1/>

SELECT ?s as ?follower
       ?o as ?followee
       ( SUM ( ?dist ) AS ?degrees ) 
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
WHERE
{

  { 
      SELECT ?s ?o 
      WHERE { 
              ?s a opltw:User; 
                 <#hasFriend> ?o 
            }
  }
  OPTION ( 
           TRANSITIVE , 
           T_DISTINCT , 
           T_SHORTEST_ONLY , 
           T_IN ( ?s ) , 
           T_OUT ( ?o ) , 
           T_MIN ( 2 ) , 
           T_STEP ( 'step_no' ) AS ?dist 
         ) .
 FILTER ( ?s = <https://twitter.com/asemota#this> ) 
 
}
GROUP BY ?s ?o ;

--Example 5: Betweeness Centrality

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT ?via COUNT(*) AS ?cnt
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
WHERE
    {
      { SELECT * { ?s a opltw:User ; <#hasFriend> ?o } }
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?s) , T_OUT (?o) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist ) . 

      { SELECT * { ?o a opltw:User ; <#hasFriend> ?via } } 
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?o) , T_OUT (?via) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_to_via ) .  

      { SELECT * { ?via a opltw:User ; <#hasFriend> ?s } }
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?via) , T_OUT (?s) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_from_via ) .  

      # FILTER ( ?s = <https://twitter.com/kidehen#this>)  
      FILTER ( ?s = <https://twitter.com/kidehen#this> )
      FILTER( ?dist = (?dist_to_via + ?dist_from_via) )   
    } 
GROUP BY ?via 
HAVING (COUNT(*) > 2) 
ORDER BY DESC (?cnt)  ;

--Example 5.1: Betweeness Centrality

SPARQL

DEFINE input:inference 'urn:analytics:acqof:rule'
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT ?s ?via ?dist ?o 
FROM <urn:tweets:kg>
# FROM <urn:twitter:analytics:all>
WHERE
    {
      { SELECT * { ?s a opltw:User ; <#hasFriend> ?o } }
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?s) , T_OUT (?o) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist ) . 

      { SELECT * { ?o a opltw:User ; <#hasFriend> ?via } } 
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?o) , T_OUT (?via) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_to_via ) .  

      { SELECT * { ?via a opltw:User ; <#hasFriend> ?s } }
      OPTION ( TRANSITIVE, T_DISTINCT, T_IN (?via) , T_OUT (?s) , T_MIN (1) , T_MAX (100) , T_STEP ('step_no') AS ?dist_from_via ) .  

      # FILTER ( ?s = <https://twitter.com/kidehen#this>)  
      FILTER ( ?s = <https://twitter.com/kidehen#this> )
      FILTER( ?dist = (?dist_to_via + ?dist_from_via) )   
    } ;


--

DEFINE input:inference 'urn:analytics:acqof:rule'
DEFINE input:macro-lib 'urn:analytics:acqof:spin:rule' 

SELECT ?s ?friendCount ?acquaintanceCount
WHERE 
{
    {
        SELECT ?s COUNT(*) AS ?acquaintanceCount 
        FROM <urn:tweets:kg>
        # FROM <urn:twitter:analytics:all>
        # FROM <urn:analytics>
        WHERE
            {
                ?s a opltw:User; 
                    foaf:knows ?acq .
                BIND (foaf:knows as ?relation)
                # FILTER (?s = <https://twitter.com/azuredataux#this>)
            }
        GROUP BY ?s 
        HAVING (count(*) = 15)
        ORDER BY ASC 2
        LIMIT 50 
    }

    {
        SELECT ?s COUNT(*) AS ?friendCount 
        FROM <urn:tweets:kg>
        # FROM <urn:twitter:analytics:all>
        # FROM <urn:analytics>
        WHERE
            {
                ?s a opltw:User; 
                    <#hasFriend> ?acq .
                BIND (foaf:knows as ?relation)
                # FILTER (?s = <https://twitter.com/azuredataux#this>)
            }
        GROUP BY ?s 
        HAVING (count(*) = 15)
        ORDER BY ASC 2
        LIMIT 50 
    }
}

