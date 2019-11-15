-- FOAF Social Network for Graph Analytics
-- using RDF representation Relations via SPARQL-BI

SPARQL

CLEAR GRAPH <urn:analytics> ;

SPARQL

PREFIX foaf:	<http://xmlns.com/foaf/0.1/> 

INSERT { 
         GRAPH <urn:analytics> 
            {
                <urn:a> foaf:knows	<urn:b> , <urn:c> , <urn:d> , <urn:e> , <urn:f> , <urn:m> , <urn:g> .
                <urn:b> foaf:knows	<urn:a> , <urn:c> .
                <urn:c> foaf:knows	<urn:a> , <urn:b> , <urn:i> , <urn:l> .
                <urn:d> foaf:knows	<urn:a> , <urn:k> .
                <urn:e> foaf:knows	<urn:a> , <urn:m> .
                <urn:f> foaf:knows	<urn:a> , <urn:i> .
                <urn:m> foaf:knows	<urn:a> , <urn:e> , <urn:g> .
                <urn:g> foaf:knows	<urn:a> , <urn:m> , <urn:k> , <urn:h> , <urn:j> .
                <urn:i> foaf:knows	<urn:c> , <urn:f> .
                <urn:l> foaf:knows	<urn:c> .
                <urn:k> foaf:knows	<urn:d> , <urn:g> .
                <urn:h> foaf:knows	<urn:g> .
                <urn:j> foaf:knows	<urn:g> .
           }
       } ;


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

-- Transitive SQL Query Tests

-- <urn:a> connections

SELECT * 
FROM ( SELECT TRANSITIVE T_IN (1) T_OUT (2) T_DISTINCT subject, object 
       FROM demo..knows ) AS k 
WHERE k.subject = 'a';

-- <urn:a> to <urn:i> 
SELECT subject, object, via, path, step
FROM ( SELECT TRANSITIVE T_IN (1) T_OUT (2) T_DIRECTION 3 T_DISTINCT T_SHORTEST_ONLY subject , 
            object , 
            T_STEP (1) AS via , 
            T_STEP ('path_id') AS path , 
            T_STEP ('step_no') AS step 
       FROM demo..knows ) AS k 
WHERE subject = 'a' 
AND object = 'i' ;

-- 
SELECT * 
FROM ( SELECT TRANSITIVE T_IN (1) T_OUT (2) T_MIN (0) T_DISTINCT subject , 
                         object , 
                         T_STEP (1) AS via , 
                         T_STEP ('path_id') AS path , 
                         T_STEP ('step_no') AS step 
       FROM demo..knows ) k 
WHERE subject = 'a' ;
