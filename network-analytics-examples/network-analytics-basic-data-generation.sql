-- SQL rendition of Social Network Relations for Graph Analytics using SQL-Transitivity extension

DROP TABLE demo..knows ;

CREATE TABLE demo..knows (subject VARCHAR, object VARCHAR, PRIMARY KEY (subject, object))
ALTER INDEX knows ON demo..knows PARTITION (subject VARCHAR);
CREATE INDEX knows2 ON demo..knows (object, subject) PARTITION (object VARCHAR);

-- a
INSERT INTO demo..knows VALUES ('a', 'b');
INSERT INTO demo..knows VALUES ('a', 'c');
INSERT INTO demo..knows VALUES ('a', 'd');
INSERT INTO demo..knows VALUES ('a', 'e');
INSERT INTO demo..knows VALUES ('a', 'f');
INSERT INTO demo..knows VALUES ('a', 'm');
INSERT INTO demo..knows VALUES ('a', 'g');

-- b
INSERT INTO demo..knows VALUES ('b', 'a');
INSERT INTO demo..knows VALUES ('b', 'c');

-- c
INSERT INTO demo..knows VALUES ('c', 'a');
INSERT INTO demo..knows VALUES ('c', 'b');
INSERT INTO demo..knows VALUES ('c', 'i');
INSERT INTO demo..knows VALUES ('c', 'l');

-- d
INSERT INTO demo..knows VALUES ('d', 'a');
INSERT INTO demo..knows VALUES ('d', 'k');

--  <urn:e> foaf:knows	<urn:a> , <urn:m> .
INSERT INTO demo..knows VALUES ('e', 'a');
INSERT INTO demo..knows VALUES ('e', 'm');

-- <urn:f> foaf:knows	<urn:a> , <urn:i> .
INSERT INTO demo..knows VALUES ('f', 'a');
INSERT INTO demo..knows VALUES ('f', 'i');

-- <urn:m> foaf:knows	<urn:a> , <urn:e> , <urn:g> .
INSERT INTO demo..knows VALUES ('m', 'a');
INSERT INTO demo..knows VALUES ('m', 'e');
INSERT INTO demo..knows VALUES ('m', 'g');

-- <urn:g> foaf:knows	<urn:a> , <urn:m> , <urn:k> , <urn:h> , <urn:j> .
INSERT INTO demo..knows VALUES ('g', 'a');
INSERT INTO demo..knows VALUES ('g', 'm');
INSERT INTO demo..knows VALUES ('g', 'k');
INSERT INTO demo..knows VALUES ('g', 'h');
INSERT INTO demo..knows VALUES ('g', 'j');

-- <urn:i> foaf:knows	<urn:c> , <urn:f> .
INSERT INTO demo..knows VALUES ('i', 'c');
INSERT INTO demo..knows VALUES ('i', 'f');

-- <urn:l> foaf:knows	<urn:c> .
INSERT INTO demo..knows VALUES ('l', 'c');

-- <urn:k> foaf:knows	<urn:d> , <urn:g> .
INSERT INTO demo..knows VALUES ('k', 'd');
INSERT INTO demo..knows VALUES ('k', 'g');

-- <urn:h> foaf:knows	<urn:g> .
INSERT INTO demo..knows VALUES ('h', 'g');

-- <urn:j> foaf:knows	<urn:g> .
INSERT INTO demo..knows VALUES ('j', 'g');

-- Test Queries --

-- Test Queries --

-- Graph Analytics SQL Replicas --

-- Centrality 

SELECT subject, count(*) 
FROM demo..knows 
GROUP BY subject ORDER BY 2 DESC ;

-- Degree Centrality

SELECT count(*)  
FROM ( 
        SELECT TRANSITIVE T_DISTINCT 
              T_IN (1) T_OUT (2) T_MIN (1) 
              subject , 
              object 
        FROM demo..knows 
     ) AS k  
WHERE k.subject = 'a' ;

-- Closeness Centrality 

SELECT sum(step)  
FROM ( 
        SELECT TRANSITIVE T_DISTINCT 
               T_IN (1) T_OUT (2) T_MIN (1)  
               subject, 
               object , 
               T_STEP ('step_no') AS step 
        FROM demo..knows 
     ) AS k 
WHERE k.subject = 'a' ;

-- Betweeness Centrality 

SELECT A.object AS via, COUNT (  1) AS cnt
FROM (
        SELECT TRANSITIVE T_DISTINCT  T_MIN(1) 
               T_OUT(2) T_IN(1)
               subject,
               object, 
               T_STEP( 'step_no' ) AS dist_to_via
          FROM demo..knows
      ) AS A
INNER JOIN (
              SELECT  TRANSITIVE T_DISTINCT T_SHORTEST_ONLY T_MIN(1)
                      T_OUT(2) T_IN(1)  
                      subject,
                      object, 
                      T_STEP( 'step_no' ) AS dist_from_via
              FROM demo..knows
            ) AS B
ON (A.object = B.subject)
WHERE A.subject =  'a'
GROUP BY A.object
ORDER BY 2 DESC   ;
