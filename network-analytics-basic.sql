-- FOAF Social Network for Graph Analytics
-- using SPARQL-BI

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