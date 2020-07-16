-- Wikidata Example 1

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX hint: <http://www.bigdata.com/queryHints#>


SELECT * 
WHERE { 
		SERVICE <http://query.wikidata.org/sparql> 
			{ SELECT DISTINCT ?item ?label ?numero (SAMPLE(?image) AS ?image)
			  WHERE {
					  ?item p:P528 ?catalogStatement .
					  ?item rdfs:label ?label . 
					  ?catalogStatement ps:P528 ?numero .
					  ?catalogStatement pq:P972 wd:Q14530 .
					  OPTIONAL {?item wdt:P18 ?image } .

			 		 # SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
				    }
		     GROUP BY ?item ?label ?numero ORDER BY ?numero 			 
           }
	   } ;

-- Live Results Link: https://tinyurl.com/khm8dzt

-- Wikidata & DBpedia Example 2

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 


SELECT DISTINCT  xsd:string(?label) as ?name?dbpediaID ?item  as ?wikidataID 
             ?description  
WHERE { 
    SERVICE <http://query.wikidata.org/sparql> 
        { 
          SELECT DISTINCT ?item ?numero (SAMPLE(?pic) AS ?picture)
          WHERE {
	              ?item p:P528 ?catalogStatement .
	              ?catalogStatement ps:P528 ?numero .
	              ?catalogStatement pq:P972 wd:Q14530 .
	              OPTIONAL {?item wdt:P18 ?pic } .

	             SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
            	}
         GROUP BY ?item ?numero ORDER BY ?numero
        }
		
     SERVICE <http://dbpedia.org/sparql>
             {
	           SELECT DISTINCT ?item ?dbpediaID ?label ?image ?description ?subjectText
	           FROM <http://dbpedia.org>
	           WHERE { ?dbpediaID owl:sameAs ?item ;
	               rdfs:label ?label ;
	               foaf:depiction ?image ;
	               rdfs:comment ?description ;
	               dct:subject [ rdfs:label ?subjectText ] .
	               FILTER (LANG(?label) = "en")
	               FILTER (LANG(?description) = "en")
             }
          }
} ;
   
-- Live Results Link: https://tinyurl.com/k475m7u

--- Federated Query Across DBpedia and Wikidata SPARQL Query Endpoints for PivotViewer

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 


SELECT DISTINCT ?subjectText ?dbpediaID as ?href xsd:string(?label) as ?name 
             ?description ?item  as ?wikidataID ?dbpediaID ?image ?picture
WHERE { 
    SERVICE <http://query.wikidata.org/sparql> 
        { 
          SELECT DISTINCT ?item ?numero (SAMPLE(?pic) AS ?picture)
          WHERE {
	              ?item p:P528 ?catalogStatement .
	              ?catalogStatement ps:P528 ?numero .
	              ?catalogStatement pq:P972 wd:Q14530 .
	              OPTIONAL {?item wdt:P18 ?pic } .

	             SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
            	}
         GROUP BY ?item ?numero ORDER BY ?numero
        }
		
     SERVICE <http://dbpedia.org/sparql>
             {
	           SELECT DISTINCT ?item ?dbpediaID ?label ?image ?description ?subjectText
	           FROM <http://dbpedia.org>
	           WHERE { ?dbpediaID owl:sameAs ?item ;
	               rdfs:label ?label ;
	               foaf:depiction ?image ;
	               rdfs:comment ?description ;
	               dct:subject [ rdfs:label ?subjectText ] .
	               FILTER (LANG(?label) = "en")
	               FILTER (LANG(?description) = "en")
             }
          }
} ;

	
-- Live Result Link: https://tinyurl.com/m4e77nz



-- Adds Names of Entity Types for additional Categorization 	

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 


SELECT DISTINCT ?dbpediaID as ?href xsd:string(?label) as ?name 
                ?description ?subjectText ?typeName
                ?item  as ?wikidataID ?dbpediaID ?image ?picture
WHERE { 
		SERVICE <http://query.wikidata.org/sparql> 
			{ 
			  SELECT DISTINCT ?item ?numero (SAMPLE(?pic) AS ?picture)
			  WHERE {
					  ?item p:P528 ?catalogStatement .
					  ?catalogStatement ps:P528 ?numero .
					  ?catalogStatement pq:P972 wd:Q14530 .
					  OPTIONAL {?item wdt:P18 ?pic } .

			 		 # SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
				    }
		     GROUP BY ?item ?numero ORDER BY ?numero 			 
	        }
		
	 SERVICE <http://dbpedia.org/sparql>
	         {       
			   SELECT ?item ?dbpediaID ?label ?image ?description ?subjectText ?typeName
              FROM <http://dbpedia.org> 
			   WHERE { ?dbpediaID a [rdfs:label ?typeName] ; 
                                  owl:sameAs ?item ; 
							   	  rdfs:label ?label ; 
								  foaf:depiction ?image;
								  rdfs:comment ?description ;
								  dct:subject [ rdfs:label ?subjectText ] .
							      FILTER (LANG(?label) = "en") 
				                  FILTER (LANG(?typeName) = "en") 
								  FILTER (LANG(?description) = "en") 
			     }
		      }
   } ;
   
-- Live Results Link : https://tinyurl.com/lw3nc3y
   
   
-- Saint-Raymond Museum
-- Shows Empty Solution fields due to missing data in DBpedia

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 


SELECT DISTINCT ?dbpediaID as ?href xsd:string(?label) as ?name 
           ?description ?subjectText 
           ?item  as ?wikidataID ?dbpediaID ?img ?image
		   
WHERE { 
			SERVICE <http://query.wikidata.org/sparql> 
				{ 
					SELECT DISTINCT ?item ?monarque ?image
						   (CONCAT("http://zone47.com/crotos/?p195=19675&p180=", REPLACE( str(?monarque),"http://www.wikidata.org/entity/Q","")) as ?voir )
					WHERE {
						    ?item wdt:P195 wd:Q1376.                
						    ?item wdt:P180 ?monarque .              
						    ?monarque wdt:P39 wd:Q842606 .
						    OPTIONAL{ ?item wdt:P18 ?image }
						      SERVICE wikibase:label {
						          bd:serviceParam wikibase:language "en" }
									      } 
			    }

			SERVICE <http://dbpedia.org/sparql>
			     {       
				   SELECT ?item ?dbpediaID ?label ?img ?description ?subjectText 
			       FROM <http://dbpedia.org> 
				   WHERE { 
					   		OPTIONAL { ?dbpediaID owl:sameAs ?item ; 
								   	  rdfs:label ?label ; 
									  foaf:depiction ?img;
									  rdfs:comment ?description ;
									  dct:subject [ rdfs:label ?subjectText ] .
								      FILTER (LANG(?label) = "en") 
					                  FILTER (LANG(?typeName) = "en") 
									  FILTER (LANG(?description) = "en") 
								  }
				     }
			      }
		} ;
		
-- Live Results Link: https://tinyurl.com/keb5oyk

-- Tennis

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bd: <http://www.bigdata.com/rdf#>

SELECT  ?singlesEvent ?dbpediaEventID ?dbpediaWimbledonEventID ?wimbledonEvent 
	   	?date ?winnerItem ?Player_name ?Event ?Country ?enArticle
WHERE {
		SERVICE <http://query.wikidata.org/sparql>  {
														SELECT ?singlesEvent ?singlesEventLabel ?wimbledonEvent ?wimbledonEventLabel 
															   ?date ?winnerItem ?Player_name ?Event ?image ?Country ?enArticle
															   (COUNT(?article) as ?rank) 
														WHERE {
																VALUES ?events {wd:Q16893072 wd:Q16893403}
																?singlesEvent wdt:P31 ?events . 
																?singlesEvent wdt:P361 ?wimbledonEvent .
																?wimbledonEvent wdt:P31 wd:Q41520 .  
																?wimbledonEvent wdt:P582 ?endDate .
																?singlesEvent wdt:P1346 ?winnerItem .
																?winnerItem wdt:P21 ?genderItem .
																OPTIONAL{?winnerItem wdt:P741 ?playingHandItem }
																OPTIONAL{?winnerItem wdt:P27 ?citizenshipItem }
																BIND (if(?genderItem = wd:Q6581072, ?endDate - "P1D"^^xsd:duration, ?endDate ) as ?date )
																BIND (if(?genderItem = wd:Q6581072, "Women's Singles", "Men's Singles") as ?Event)
																# OPTIONAL {?winnerItem wdt:P18 ?image }
																OPTIONAL {?article schema:about ?winnerItem } 
																OPTIONAL {?enArticle schema:about ?winnerItem . 
																		  ?enArticle schema:isPartOf <https://en.wikipedia.org/> 
																	     }
																SERVICE wikibase:label {
																bd:serviceParam wikibase:language "en" .
																?wimbledonEvent rdfs:label ?wimbledonEventLabel .
																?singlesEvent rdfs:label ?singlesEventLabel .
																?winnerItem rdfs:label ?Player_name .
																?playingHandItem rdfs:label ?Playing_Hand .
																?citizenshipItem rdfs:label ?Country .}
														      } 
														GROUP BY  ?singlesEvent ?singlesEventLabel ?wimbledonEvent ?wimbledonEventLabel ?date 
														           ?winnerItem ?Player_name ?Event ?image ?Playing_Hand ?Country ?enArticle
														ORDER BY DESC (?rank)
											}
											
	SERVICE <http://dbpedia.org/sparql>
	     {       
		   SELECT DISTINCT ?singlesEvent ?dbpediaEventID ?dbpediaWimbledonEventID ?wimbledonEvent 
	       FROM <http://dbpedia.org> 
		   WHERE { 
			   		OPTIONAL { ?dbpediaEventID owl:sameAs ?singlesEvent .
						       ?dbpediaWimbledonEventID owl:sameAs ?wimbledonEvent .
						   	  # rdfs:label ?label ; 
							  #  foaf:depiction ?img ;
							  # rdfs:comment ?description ;
							  # dct:subject [ rdfs:label ?subjectText ] .
						      # FILTER (LANG(?label) = "en") 
			                  # FILTER (LANG(?typeName) = "en") 
							  # FILTER (LANG(?description) = "en") 
						  }
		     }
	      }
} ;

-- Live Results Link: https://tinyurl.com/k3n7o2g (with images)
-- Live Resuls Link: https://tinyurl.com/mr5ahqk  (without images)

-- Europeana

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX psv: <http://www.wikidata.org/prop/statement/value/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bd: <http://www.bigdata.com/rdf#>

SELECT ?work ?dbpediaWorkID ?title ?inception ?precision 
       ?image ?Exhibition_country ?type_of_work 
       ?creator ?genre ?depicting ?material_used
WHERE {
		SERVICE <http://query.wikidata.org/sparql>  {
														SELECT ?work ?title ?inception ?precision 
														       ?image ?Exhibition_country ?type_of_work 
														       ?creator ?genre ?depicting ?material_used
														WHERE {
																{
																	SELECT ?work ?inception ?precision ?exhibitionCountryItem 
																	        ?instanceOfItem  ?creatorItem ?genreItem ?depictingItem 
																			?materialUsedItem (SAMPLE(?image) as ?image) (COUNT(?article) as ?rank)   
																	WHERE {
																			?work wdt:P608 wd:Q20980830.
																			FILTER (?work != wd:Q133575)
																			?work p:P608/pq:P17 ?exhibitionCountryItem.
																			?work p:P571/psv:P571 ?inceptionStatementNode .
																			?inceptionStatementNode wikibase:timeValue ?inception .
																			?inceptionStatementNode wikibase:timePrecision ?precision .
																			OPTIONAL {?work wdt:P18 ?image}
																			OPTIONAL {?article schema:about ?work}
																			OPTIONAL {?work wdt:P31 ?instanceOfItem }
																			OPTIONAL {?work wdt:P170 ?creatorItem }
																			OPTIONAL {?work wdt:P136 ?genreItem }
																			OPTIONAL {?work wdt:P180 ?depictingItem }
																			OPTIONAL {?work wdt:P186 ?materialUsedItem }      
																	      } 
																   GROUP BY ?work ?inception ?precision ?exhibitionCountryItem ?instanceOfItem  
																             ?creatorItem ?genreItem ?depictingItem ?materialUsedItem
															   }
	   
															  SERVICE wikibase:label {
																						  bd:serviceParam wikibase:language 'en' .
																						  ?work rdfs:label ?title .
																						  ?instanceOfItem rdfs:label ?type_of_work .
																						  ?creatorItem rdfs:label ?creator .
																						  ?genreItem rdfs:label ?genre .
																						  ?depictingItem rdfs:label ?depicting .
																						  ?materialUsedItem rdfs:label ?material_used .
																						  ?exhibitionCountryItem rdfs:label ?Exhibition_country .
																					  }
														  }
														ORDER BY DESC (?rank)
													}
													
	SERVICE <http://dbpedia.org/sparql>
	     {       
		   SELECT DISTINCT ?work ?dbpediaWorkID
	       FROM <http://dbpedia.org> 
		   WHERE { 
			   		OPTIONAL { ?dbpediaWorkID owl:sameAs ?work .
						   	  # rdfs:label ?label ; 
							  # foaf:depiction ?img;
							  # rdfs:comment ?description ;
							  # dct:subject [ rdfs:label ?subjectText ] .
						      # FILTER (LANG(?label) = "en") 
			                  # FILTER (LANG(?typeName) = "en") 
							  # FILTER (LANG(?description) = "en") 
						  }
		     }
	      }
	} ;
	
-- Live Results Link: https://tinyurl.com/lkr3gzm


-- Prize Winners


SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX psv: <http://www.wikidata.org/prop/statement/value/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bd: <http://www.bigdata.com/rdf#>

SELECT ?person ?dbpediaID ?place ?dbpediaPlaceID ?longitude ?latitude?name ?coord ?image ?almamater ?article 
WHERE 

{ SERVICE <http://query.wikidata.org/sparql> {
												SELECT ?name ?coord ?image ?almamater ?article ?place ?person
												WHERE {
														?person wdt:P166 wd:Q47170 ;
														        wdt:P69 ?place .
														?place wdt:P625 ?coord
														OPTIONAL{ ?person wdt:P18 ?image }
														OPTIONAL{ ?article schema:about ?person ; schema:isPartOf <https://en.wikipedia.org/> }
														?person rdfs:label ?name filter (lang(?name) = "en")
														?place rdfs:label ?almamater filter (lang(?almamater) = "en")
													  }
										     }
 SERVICE <http://dbpedia.org/sparql> {
 										SELECT ?person ?place ?dbpediaID ?dbpediaPlaceID ?longitude ?latitude
										FROM <http://dbpedia.org>
										WHERE { 
											     ?dbpediaID owl:sameAs ?person  . 
												 ?dbpediaPlaceID owl:sameAs ?place ;
												 		geo:lat ?latitude ;
												        geo:long ?longitude . 
											  }
										      
									 }
 } ;
 
 -- Live Results Link: https://tinyurl.com/lodjceo

SPARQL
 
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>

SELECT ?item as ?wikidDataID ?dbpediaID ?itemLabel  ?image ?sitelink ?itemDescription 
WHERE {
 
		SERVICE <http://query.wikidata.org/sparql> {

						 SELECT DISTINCT ?item ?itemLabel ?itemDescription (SAMPLE(?image) AS ?image) ?sitelink 
						 WHERE {
				   				 ?item wdt:P31 wd:Q515 ;
				       		  	 wdt:P6 ?person .
						 		 ?person wdt:P21 wd:Q6581072 .


							     OPTIONAL { ?item wdt:P18 ?image. }
							     OPTIONAL {
										     ?sitelink schema:about ?item.
										     ?sitelink schema:isPartOf <https://en.wikipedia.org/>.
							   		  	  }
						   SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en,fr,es,de,ru,it,nl,ja,zh,pl,cs". }
						 }
						 GROUP BY ?item ?itemLabel ?itemDescription ?sitelink
						 LIMIT 50
		 			}
			
		SERVICE <http://dbpedia.org/sparql> {
												SELECT DISTINCT ?item ?dbpediaID
												FROM <http://dbpedia.org>
												WHERE { 
													     ?dbpediaID owl:sameAs ?item   . 
													  }
							      
										    }
      } ;

-- Currently Fails with Like Operator error
	  
-- Timeline Nobel Prize Winners

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>

SPARQL

SELECT ?t ?dbpediaID ?rrLabel ?valueLabel
{
	SERVICE <http://query.wikidata.org/sparql> 
						{
							SELECT DISTINCT ?t ?rrLabel ?valueLabel
							WHERE
							{
							  {
							   wd:Q151564 ?prop ?t FILTER (datatype(?t)=xsd:dateTime) .
							   ?value wikibase:directClaim ?prop. 
						      }
							  
							  UNION
								  {
								   wd:Q151564 ?q ?statement  FILTER regex (STR(?q),"prop/P") .
								   ?statement ?p ?t FILTER regex (STR(?p), "prop/qualifier/P") FILTER (datatype(?t)=xsd:dateTime) .
								   ?statement ?r ?value FILTER regex (STR(?r),"prop/statement/") .
								   BIND(IRI(CONCAT(CONCAT(SUBSTR(STR(?r),1,29),"direct/"),SUBSTR(STR(?r),40))) as ?rprop)  
								   ?rr wikibase:directClaim ?rprop . 
								  }
							  SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
						   }
					 } 

	SERVICE <http://dbpedia.org/sparql> {
											SELECT DISTINCT ?t ?dbpediaID
											FROM <http://dbpedia.org>
											WHERE { 
												     ?dbpediaID owl:sameAs ?t   . 
												  }
					      
									    }
} ;

-- Universities Page Rankings

SPARQL 

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX vrank: <http://purl.org/voc/vrank#>
PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>

SELECT ?uni AS ?wikiDataUni ?dbpediaUni ?uniLabel ?pr AS ?pageRank ?latitude ?longitude ?label ?dbpediaUni AS ?href ?label as ?name 
WHERE { 
		
		  
  		SERVICE <http://query.wikidata.org/sparql> 
	  		{ 
				SELECT DISTINCT ?uni ?uniLabel ?pr WHERE {
				  ?uni wdt:P31/(wdt:P279)* wd:Q3918.
				  SERVICE <http://dbpedia.org/sparql> {
				    ?uni vrank:hasRank/vrank:rankValue ?pr
				  }
				  SERVICE wikibase:label {
				    bd:serviceParam wikibase:language "en".
				  }
				} ORDER BY DESC(?pr) LIMIT 100
	  		}
		
		SERVICE <http://dbpedia.org/sparql> 
			 {
				SELECT DISTINCT ?dbpediaUni ?latitude ?longitude ?label
			    WHERE {
						?dbpediaUni owl:sameAs ?uni ;
                                    geo:lat ?latitude ;
                                    geo:long ?longitude ;
                                    rdfs:label ?label .
	                    FILTER (LANG(?label) = "en") 
					  }
			   ORDER BY DESC (?pr)

			  }
		
	} ;


-- Awards by Gender
-- Currently Fails

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX vrank: <http://purl.org/voc/vrank#>
PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>

SELECT DISTINCT *
WHERE {
		SERVICE <http://query.wikidata.org/sparql> 
			{
				SELECT ?award ?awardLabel ?total ?women ?women_percentage
				WHERE {
						  
						  {
						    SELECT ?award (COUNT(*) AS ?total) (SUM(IF(?gender = wd:Q6581072, 1, 0)) AS ?women) 
								   (ROUND(1000 / COUNT(*) * SUM(IF(?gender = wd:Q6581072, 1, 0))) / 10 AS ?women_percentage)
						    WHERE {
								    ?human wdt:P166 ?award ; wdt:P21 ?gender ; wdt:P31 wd:Q5 .
								   }
						    GROUP BY ?award
						    ORDER BY DESC(?total)
						    LIMIT 200
						  } 
			  
						  ?award rdfs:label ?awardLabel .
						  FILTER (LANG(?awardLabel) = "en") .
					  }
			   ORDER BY DESC(?total)
			}	
	
		SERVICE <http://dbpedia.org/sparql> 
			 {
				SELECT DISTINCT ?award
			    WHERE {
						?dbpediaID owl:sameAs ?award .
					  }

			  }	 
	} 
	
-- Wikidata and SQID Example with DBpedia URI added
-- Returns empty solution due to no matches in DBpedia

SPARQL

PREFIX wikibase: <http://wikiba.se/ontology#> 
PREFIX wdt: <http://www.wikidata.org/prop/direct/> 
PREFIX wd: <http://www.wikidata.org/entity/> 

SELECT DISTINCT ?ps ?dbpediaID
WHERE
  {
	SERVICE <http://query.wikidata.org/sparql> 
		{
			SELECT ?it ?s ?p (SAMPLE(?pq) as ?pqs) 
			WHERE { 
				{ SELECT DISTINCT ?it ?s ?p { 
					?s ?ps wd:P735 . ?it ?pc ?s . 
					?p wikibase:statementProperty ?ps . ?p wikibase:claim ?pc . 
					FILTER( ?p != <http://www.wikidata.org/entity/P31> ) 
				} LIMIT 101 } 
				OPTIONAL { ?s ?pq ?v . ?psub wikibase:qualifier ?pq } 
			} 
			GROUP BY ?it ?s ?p
		}

	SERVICE <http://dbpedia.org/sparql> 
		 {
			SELECT DISTINCT ?ps
		    WHERE {
					?dbpediaID owl:equivalentProperty ?ps .
				  }

		  }	 
  }
	
-- Currently Fails

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>

SELECT *
WHERE { SERVICE <http://query.wikidata.org/sparql> 
			{ SELECT (SUM(?goals) as ?total_goals) 
					 (SAMPLE(?height) as ?height) 
					 (SAMPLE(xsd:date(?birthdate)) as ?bday) 
			 WHERE { ?s wdt:P106 wd:Q937857 ; 
				 		p:P54 ?team_statement ; 
						wdt:P2048 ?height ; 
						wdt:P569 ?birthdate . 
					?team_statement pq:P1351 ?goals . 
				   } GROUP BY ?s 
			 }
	} ;
	
	
-- Wikidata and DBpedia -- Butterflies
SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>

SELECT ?species as ?wikiDataID ?dbpediaID ?image ?speciesLabel as ?name ?speciesLabel ?dbpediaID as ?href
WHERE {
		SERVICE <http://query.wikidata.org/sparql> 
		      {
				 SELECT ?species ?speciesLabel ?image 
				 WHERE {
						  ?species wdt:P31 wd:Q16521; # taxon
						           wdt:P171* wd:Q28319; # in the Lepidoptera order
						           # wdt:P105/wdt:P361* wd:Q7432; # species or subdivision thereof
						           wdt:P183/wdt:P17 wd:Q664; # endemic to New Zealand
						           wdt:P18 ?image. # with image
						  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
		  				}
			 }
			 
	 	SERVICE <http://dbpedia.org/sparql> 
	 		 {
	 			SELECT DISTINCT ?dbpediaID
	 		    WHERE {
	 					?dbpediaID owl:sameAs ?species .
	 				  }

	 		  }	 
	 } ;
	 
-- Wikidata and DBpedia re. Monet
-- Fails

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>

SELECT ?person as ?wikiDataID ?DBpediaID ?t ?value  ?valueLabel ?rrLabel  ?rr ?img as ?image ?DBpediaID as ?href ?rrLabel as ?name
WHERE {

		SERVICE <http://query.wikidata.org/sparql>  
		{ 
			SELECT DISTINCT ?person ?t ?value  ?valueLabel ?rrLabel  ?rr (SAMPLE(?image) as ?img)
			WHERE
			{
			  VALUES ?person {wd:Q296}
			  {?person wdt:P570 ?death . 
			   ?person ?prop ?t FILTER (datatype(?t)=xsd:dateTime) FILTER (?t <= ?death) .
			   ?value wikibase:directClaim ?prop. }
			  UNION
			  {
			   ?person ?q ?statement  FILTER regex (STR(?q),"prop/P") . #exclude P:describedBy
			   ?person wdt:P570 ?death . 
			   ?statement ?p ?t FILTER regex (STR(?p), "prop/qualifier/P") FILTER (datatype(?t)=xsd:dateTime) FILTER (?t <= ?death).
			   ?statement ?r ?value FILTER regex (STR(?r),"prop/statement/") .
			   BIND(IRI(CONCAT(CONCAT(SUBSTR(STR(?r),1,29),"direct/"),SUBSTR(STR(?r),40))) as ?rprop) 
			   ?rr wikibase:directClaim ?rprop .
			   OPTIONAL {?value wdt:P18 ?image}
			  }
			  UNION { # author of / creator of
			   ?value wdt:P50|wdt:P98|wdt:P655|wdt:P1773|wdt:P170 ?person .
			   ?person wdt:P570 ?death ;
			           wdt:P569 ?birth .
			   ?value wdt:P571|wdt:P577 ?t . 
			          FILTER ((?t <= ?death)&&(?t >= ?birth)) 
			   #FILTER NOT EXISTS {?value wdt:P629 ?x } 
			   FILTER NOT EXISTS {?person wdt:P800 ?value } .
			   OPTIONAL {?value wdt:P1433 ?rr .} 
			   OPTIONAL {?value wdt:P18 ?image .}
			  }
			  UNION #Notable Works
			  {
			   ?person wdt:P800 ?rr ;
			           wdt:P570 ?death ;
			           wdt:P569 ?birth .
			   ?rr  wdt:P577|wdt:P571|wdt:P1191 ?t FILTER ((?t <= ?death)&&(?t >= ?birth)).
			   OPTIONAL {?rr wdt:P18 ?image .}
			  }
			    UNION #discoverer or inventor
			  {
			   ?rr wdt:P61 ?person .
			   ?person wdt:P570 ?death ;
			           wdt:P569 ?birth .
			   ?rr wdt:P575|wdt:P571|wdt:P585 ?t FILTER ((?t <= ?death)&&(?t >= ?birth)).
			   OPTIONAL {?rr wdt:P18 ?image .}
			  }
			   UNION #architect
			  {
			   ?rr wdt:P84 ?person .
			   ?person wdt:P570 ?death ;
			           wdt:P569 ?birth .
			   ?rr wdt:P571|wdt:P1619 ?t FILTER ((?t <= ?death)&&(?t >= ?birth)).
			   OPTIONAL {?rr wdt:P18 ?image .}
			  }
			  UNION #composer
			  {
			   ?rr wdt:P86 ?person .
			   ?person wdt:P570 ?death ;
			           wdt:P569 ?birth .
			   ?rr wdt:P571|wdt:P1191|wdt:P577 ?t FILTER ((?t <= ?death)&&(?t >= ?birth)).
			   OPTIONAL {?rr wdt:P18 ?image .}
			  }

			  SERVICE wikibase:label { bd:serviceParam wikibase:language "en, fr, de". }
			} GROUP BY ?person ?t ?value ?rr ?rrLabel ?valueLabel
			ORDER BY ?t
		}

		SERVICE <http://dbpedia.org/sparql> 
			 {
				SELECT DISTINCT ?dbpediaID
			    WHERE {
						?dbpediaID owl:sameAs ?person .
					  }

			  }	 
	} ;
	

## DBpedia and Wikidata Bible Illustrations

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 

SELECT ?creator ?painting ?dbpediaPainting ?dbpediaCreator ?dbpediaCreatorName ?image ?name ?dbpediaPainting as ?href

WHERE {
		SERVICE <http://query.wikidata.org/sparql>  
	        {
				SELECT ?creator ?painting count(?painting) as ?count
				WHERE 
				{
				  ?painting wdt:P31/wdt:P279* wd:Q4502142.
				  ?painting wdt:P180 ?depicts.
				  ?painting wdt:P170 ?creator.
				  ?depicts wdt:P31/wdt:P279* wd:Q12405827 .
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
				} 

               GROUP BY ?painting ?creator
               HAVING (count(?painting) > 5)
			}
			
		SERVICE <http://dbpedia.org/sparql> 
			 {
				SELECT DISTINCT ?dbpediaPainting ?dbpediaCreator ?dbpediaCreatorName ?image ?name 
			    WHERE {
						?dbpediaPainting owl:sameAs ?painting ; 
                        rdfs:label ?name ;
                        foaf:depiction ?image .
                        FILTER (LANG(?name) = "en")
                        ?dbpediaCreator owl:sameAs ?creator  ; 
                        rdfs:label ?dbpediaCreatorName .
                        FILTER (LANG(?dbpediaCreatorName) = "en")
					  }

			  }	 

	} ;
	
## DBpedia and Wikidata Swiss Mountains

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dct: <http://purl.org/dc/terms/> 


SELECT ?item ?dbpediaID as ?href xsd:string(?label) as ?name ?subjectName ?prominence ?image
WHERE
{

	SERVICE <http://query.wikidata.org/sparql>  
	{
		SELECT ?item ?itemLabel ?coord ?prominence ?layer ?image 
		WHERE {
				  ?item wdt:P31 wd:Q8502. # a mountain
				  ?item wdt:P625 ?coord. 
				  ?item wdt:P17 wd:Q39. # in Switzerland
				  ?item wdt:P2660 ?prominence .
				  BIND(
				    IF(?prominence < 1000, "<1000 metres",
				    IF(?prominence < 2000, "1000 - 2000 metres",
				    IF(?prominence < 3000, "2000 - 3000 metres",
				    IF(?prominence < 4000, "3000 - 4000 metres",
				    "> 4000 metres"))))
				    AS ?layer).
				  OPTIONAL {?item wdt:P18 ?image.}
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
			}
			
		LIMIT 200
	}
	
	SERVICE <http://dbpedia.org/sparql> 
		 {
			SELECT DISTINCT ?dbpediaID ?name ?label ?subjectName
		    WHERE {
					?dbpediaID owl:sameAs ?item ; 
                    rdfs:label ?label ;
					dct:subject ?subject. 
					FILTER (LANG(?label) = "en")
					
					?subject rdfs:label ?subjectName . 
                    
				  }

		  }	 

} ;

## DBpedia and Wikidata analysis of 
## # ratio of female characters per fictional universe
# (assuming that any item with “from fictional universe” and “sex or gender” is a fictional character)
## Fails with empty solution

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT ?universe ?dbpediaUniverse ?universeLabel ?percentString ?females ?total
WHERE
	{
		SERVICE <http://query.wikidata.org/sparql>  
			{
				SELECT ?universe ?universeLabel ?percentString ?females ?total WHERE { # add ?percent if you want to sort in the table
				  {
				    SELECT ?universe (SUM(?female) AS ?females) (COUNT(*) AS ?total) WHERE {
				      ?character wdt:P1080 ?universe;
				                 wdt:P21 ?gender.
				      BIND(IF(?gender IN (wd:Q6581072, wd:Q1052281), 1, 0) AS ?female)
				    }
				    GROUP BY ?universe
				  }
				  BIND(?females/?total AS ?ratio)
				  BIND(100*?ratio AS ?percent)
				  BIND(CONCAT(SUBSTR(STR(?percent), 1, 5), "%") AS ?percentString)
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
				}
				ORDER BY DESC(?total)
			 }
 
		SERVICE <http://dbpedia.org/sparql> 
			 {
				SELECT DISTINCT ?dbpediaCharacter ?dbpediaUniverse
			    WHERE {
						?dbpediaCharacter owl:sameAs ?character .
				
						?dbpediaUniverse owl:sameAs ?universe . 
                 
					  }

			  }	 
	} ;
	
## Birds from Wikidata
#defaultView:ImageGrid

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

SELECT ?item ?dbpediaID as ?href ?itemLabel as ?name ?image ?subjectName ?mainTaxonLabel
WHERE 
{
	SERVICE <http://query.wikidata.org/sparql>  
		{
			SELECT ?item ?itemLabel ?pic ?mainTaxon ?mainTaxonLabel
			WHERE
			{
				?item wdt:P171* wd:Q5113 . # wdt:P31*/ prepended gets a few more, noise?
				OPTIONAL {
					?item wdt:P18 ?pic
				} 
			    OPTIONAL { 
			        ?item wdt:P171 ?mainTaxon
			    }
				SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en" }
			}
			LIMIT 2000
		}
	SERVICE <http://dbpedia.org/sparql> 
		 {
			SELECT DISTINCT ?dbpediaID ?image ?subjectName
		    WHERE {
					?dbpediaID owl:sameAs ?item ;
                    foaf:depiction ?image ;
					dct:subject ?subject.
					
					?subject rdfs:label ?subjectName .
					FILTER (LANG(?subjectName) = "en")
             
				  }

		  }	 
}	

;

## American Collaborative, Wikidata, and DBpedia.
SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT ?ulan ?wd ?dbpediaID 
WHERE
 
    {
		SERVICE <http://data.americanartcollaborative.org/sparql> 
				{
					?x skos:exactMatch ?ulan .
				}
  		SERVICE <http://query.wikidata.org/sparql> 
				{
    				?wd <http://www.wikidata.org/prop/direct-normalized/P245> ?ulan.
    				?wp schema:about ?wd . 
				}
				
		SERVICE <http://dbpedia.org/sparql> 
			   {
					SELECT DISTINCT ?dbpediaID ?subjectName
				    WHERE {
							?dbpediaID owl:sameAs ?wd;
		                    # foaf:depiction ?image ;
							dct:subject ?subject.
			
							?subject rdfs:label ?subjectName .
							FILTER (LANG(?subjectName) = "en")
						 }
     
				}
  # FILTER(REGEX(STR(?wp),"https?://en.wikipedia.org/wiki/"))
  # BIND(URI(REPLACE(str(?wp),"https?://en.wikipedia.org/wiki/","http://dbpedia.org/resource/")) as ?db)
}

## Document Types
SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT ?item as ?wikidataID ?dbpediaID ?subjectName xsd:string(?mime) as ?contentType ?UTI
WHERE
{
	SERVICE <http://query.wikidata.org/sparql> 
		{
			SELECT DISTINCT ?item ?itemLabel ?UTI 
				{
					?item wdt:P3641 ?UTI .
					SERVICE wikibase:label { bd:serviceParam wikibase:language "en,en"  }    
				}
		}
	
	SERVICE <http://dbpedia.org/sparql> 
		   {
			    SELECT DISTINCT ?dbpediaID ?subjectName ?mime
                            FROM <http://dbpedia.org> 
			    WHERE {
						?dbpediaID owl:sameAs ?item ;
	                    # foaf:depiction ?image ;
						dct:subject ?subject ;
                                                 dbp:mime ?mime . 
		
						?subject rdfs:label ?subjectName .
						FILTER (LANG(?subjectName) = "en")
					 }
 
			}

} ;


## French sister towns

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT * 
WHERE {
		SERVICE <http://query.wikidata.org/sparql> 
			{
				SELECT ?country ?countryLabel (COUNT(?city) AS ?count)
				WHERE {
				  ?city wdt:P31 wd:Q484170 ; wdt:P190/wdt:P17 ?country .
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "en" . }
				}
				GROUP BY ?country ?countryLabel
				ORDER BY DESC(?count)
			}
	
		SERVICE <http://dbpedia.org/sparql> 
			   {
				    SELECT DISTINCT ?dbpediaID ?subjectName 
	                            FROM <http://dbpedia.org> 
				    WHERE {
							?dbpediaID owl:sameAs ?country;
		                    # foaf:depiction ?image ;
							dct:subject ?subject .
		
							?subject rdfs:label ?subjectName .
							FILTER (LANG(?subjectName) = "en")
						 }
 
				}
	} ;
	

## French sister towns -- using Thumbnail images for flags re. PivotViewer Report

SPARQL
	
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT ?country as ?wikidataID ?dbpediaID as ?href ?countryLabel as ?name ?countryLabel ?image ?subjectName ?count
WHERE {
		SERVICE <http://query.wikidata.org/sparql> 
			{
				SELECT ?country ?countryLabel (COUNT(?city) AS ?count)
				WHERE {
				  ?city wdt:P31 wd:Q484170 ; wdt:P190/wdt:P17 ?country .
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "en" . }
				}
				GROUP BY ?country ?countryLabel
				ORDER BY DESC(?count)
			}

		SERVICE <http://dbpedia.org/sparql> 
			   {
				    SELECT DISTINCT ?dbpediaID ?image ?subjectName 
	                            FROM <http://dbpedia.org> 
				    WHERE {
							?dbpediaID owl:sameAs ?country;
		                               dbo:thumbnail ?image ;
									   dct:subject ?subject .
	
							?subject rdfs:label ?subjectName .
							FILTER (LANG(?subjectName) = "en")
						 }

				}
	} ;
	
## Vienna Transit

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT ?district ?districtLabel ?dbpediaID ?image ?subjectName ?latitude ?longitude
WHERE
{	SERVICE <http://query.wikidata.org/sparql> 
		{
			SELECT ?district ?districtLabel
			       (COUNT(?line) AS ?lineCount)
			       (GROUP_CONCAT(?lineLabel) AS ?lines)
			WHERE {
					  ?district wdt:P31 wd:Q261023;
					            rdfs:label ?districtLabel.
					  ?line wdt:P31 wd:Q15145593;
					        wdt:P131 ?district;
					        rdfs:label ?lineLabel.
					  FILTER(lang(?lineLabel)="en" && lang(?districtLabel)="en")
				  }
			GROUP BY ?district ?districtLabel
			ORDER BY DESC(?lineCount)
		}
	
	SERVICE <http://dbpedia.org/sparql> 
	   {
		    SELECT DISTINCT ?dbpediaID ?image ?subjectName ?latitude ?longitude
                        FROM <http://dbpedia.org> 
		    WHERE {
					?dbpediaID owl:sameAs ?district ;
                               dbo:thumbnail ?image ;
							   dct:subject ?subject ;
							   geo:lat ?latitude ;
							   geo:long ?longitude .

					?subject rdfs:label ?subjectName .
					FILTER (LANG(?subjectName) = "en")
				 }

		}
}

### ISO Codes
SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT ?countryId ?dbpediaID ?countryCode ?image ?subjectName ?latitude ?longitude
WHERE {
		SERVICE <http://query.wikidata.org/sparql> 
			{
				SELECT DISTINCT ?countryId ?countryCode ?label 
				WHERE {
			  	  		?countryId <http://www.wikidata.org/prop/direct/P297> ?countryCode.
			  		  	?countryId rdfs:label ?label.
			  		  	FILTER (LANG(?label) = 'it')
					  }
			}

		SERVICE <http://dbpedia.org/sparql> 
		   {
			   SELECT DISTINCT ?dbpediaID ?image ?subjectName round(?lat) as ?latitude round(?long) as ?longitude
   		        FROM <http://dbpedia.org> 
   			    WHERE {
   						?dbpediaID owl:sameAs ?countryId ;
   		                           dbo:thumbnail ?image ;
   								   dct:subject ?subject ;
   								   geo:lat ?lat ;
   								   geo:long ?long .

   						?subject rdfs:label ?subjectName .
   						FILTER (LANG(?subjectName) = "en")
   					 }

			}
	} ;
	
## Archealogical Stuff 

SPARQL

PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX psv: <http://www.wikidata.org/prop/statement/value/> 
PREFIX p: <http://www.wikidata.org/prop/> 
PREFIX bd: <http://www.bigdata.com/rdf#> 
PREFIX wikibase: <http://wikiba.se/ontology#> 
PREFIX wd: <http://www.wikidata.org/entity/>  
PREFIX wdt: <http://www.wikidata.org/prop/direct/> 
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT ?dbpediaID ?site ?lat as ?latitude ?long as ?longitude ?siteLabel as ?name ?siteLabel ?siteDescription as ?description ?image ?subjectName
{
	SERVICE <http://query.wikidata.org/sparql> 
		{
			SELECT DISTINCT 
					?lat ?long ?siteLabel ?siteDescription 
					?site ?image
					(concat(xsd:string(?image),'?width=200') as ?newimage)
			WHERE {
			        ?site wdt:P31/wdt:P279* wd:Q839954 . 
			        ?site wdt:P17 wd:Q142 .
			        ?site wdt:P18 ?image .
			   	 	?site p:P625 ?coord .

			          ?coord   psv:P625 ?coordValue .
       
			          ?coordValue a wikibase:GlobecoordinateValue ;
			                        wikibase:geoLatitude ?lat ;
			                        wikibase:geoLongitude ?long .
  
			        SERVICE wikibase:label {
			             bd:serviceParam wikibase:language "en" .
			        }
			      }
		  }
	  
	SERVICE <http://dbpedia.org/sparql> 
	   {
		   SELECT DISTINCT ?dbpediaID ?subjectName
 		        FROM <http://dbpedia.org> 
 			    WHERE {
 						?dbpediaID owl:sameAs ?site ;
 								   dct:subject ?subject  .

 						?subject rdfs:label ?subjectName .
 						FILTER (LANG(?subjectName) = "en")
 					 }

		}
} ;

-- Pharoahs
SPARQL

PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX psv: <http://www.wikidata.org/prop/statement/value/> 
PREFIX p: <http://www.wikidata.org/prop/> 
PREFIX bd: <http://www.bigdata.com/rdf#> 
PREFIX wikibase: <http://wikiba.se/ontology#> 
PREFIX wd: <http://www.wikidata.org/entity/>  
PREFIX wdt: <http://www.wikidata.org/prop/direct/> 
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT ?author ?dbpediaID as ?href ?authorLabel as ?name ?image ?subjectName
WHERE

{
	SERVICE <http://query.wikidata.org/sparql> 
		{
			SELECT DISTINCT ?author ?authorLabel ?image ?date 
			WHERE 
				{
				  ?author wdt:P39 wd:Q37110 .
				  ?author wdt:P569 ?date .
				  OPTIONAL {?author wdt:P18 ?image .}
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "en, fr, de, it, es, pl". }
				}
		}

	SERVICE <http://dbpedia.org/sparql> 
	   {
		   SELECT DISTINCT ?dbpediaID ?subjectName
		        FROM <http://dbpedia.org> 
			    WHERE {
						?dbpediaID owl:sameAs ?author ;
								   dct:subject ?subject  .

						?subject rdfs:label ?subjectName .
						FILTER (LANG(?subjectName) = "en")
					 }

		}
} ;

--- Milano Trains
SPARQL

PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX psv: <http://www.wikidata.org/prop/statement/value/> 
PREFIX p: <http://www.wikidata.org/prop/> 
PREFIX bd: <http://www.bigdata.com/rdf#> 
PREFIX wikibase: <http://wikiba.se/ontology#> 
PREFIX wd: <http://www.wikidata.org/entity/>  
PREFIX wdt: <http://www.wikidata.org/prop/direct/> 
PREFIX dbo: <http://dbpedia.org/ontology/> 
PREFIX dbp: <http://dbpedia.org/property/> 
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX schema: <http://schema.org/>

SELECT ?item ?dbpediaID ?itemLabel as ?name ?coord ?image ?minDate ?dateBin ?subjectName ?longitude ?latitude
WHERE
{
		SERVICE <http://query.wikidata.org/sparql> 
			{
				# Metro stations in Milano by date

				SELECT ?item ?itemLabel ?coord ?image ?minDate ?dateBin
				WHERE {
				  BIND(
				    IF((YEAR(?minDate)) < 1970, "< 1970",
				       IF((YEAR(?minDate)) < 1980, "1971 - 1980",
				          IF((YEAR(?minDate)) < 1990, "1981 - 1990",
				             IF((YEAR(?minDate)) < 2000, "1991 - 2000",
				                IF((YEAR(?minDate)) < 2010, "2001 - 2010", 
				     ">2010"))))) 
				   AS ?dateBin)
				  {
				    SELECT ?item (MIN(?date) AS ?minDate) ?coord ?image WHERE {
				      ?item wdt:P361 wd:Q735559.
				      ?item wdt:P625 ?coord.
				      OPTIONAL { ?item wdt:P18 ?image. }
				      OPTIONAL { ?item wdt:P1619 ?d1. }
				      OPTIONAL { ?item wdt:P571 ?d2. }
				      BIND(IF(BOUND(?d1), ?d1, ?d2) AS ?date)
				    }
				    GROUP BY ?item ?coord ?image
				  }
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
				}
				ORDER BY ?minDate
			}
		
		
			SERVICE <http://dbpedia.org/sparql> 
					   {
						   SELECT DISTINCT ?dbpediaID ?subjectName ?longitude ?latitude
						        FROM <http://dbpedia.org> 
							    WHERE {
										?dbpediaID owl:sameAs ?item ;
							               		   dct:subject ?subject ;
	                                       		   geo:long ?longitude; 
												   geo:lat ?latitude . 

										?subject rdfs:label ?subjectName .
										FILTER (LANG(?subjectName) = "en")
									 }

						}
} ;

-- Things around you Wikidata and DBpedia

 PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
 PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
 PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
 PREFIX owl: <http://www.w3.org/2002/07/owl#>
 PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
 PREFIX schema: <http://schema.org/>
 PREFIX cc: <http://creativecommons.org/ns#>
 PREFIX geo: <http://www.opengis.net/ont/geosparql#>
 PREFIX prov: <http://www.w3.org/ns/prov#>
 PREFIX wikibase: <http://wikiba.se/ontology#>
 PREFIX wdata: <http://www.wikidata.org/wiki/Special:EntityData/>
 
 PREFIX wd: <http://www.wikidata.org/entity/>
 PREFIX wdt: <http://www.wikidata.org/prop/direct/>
 PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
 
 PREFIX wds: <http://www.wikidata.org/entity/statement/>
 PREFIX p: <http://www.wikidata.org/prop/>
 PREFIX wdref: <http://www.wikidata.org/reference/>
 PREFIX wdv: <http://www.wikidata.org/value/>
 PREFIX ps: <http://www.wikidata.org/prop/statement/>
 PREFIX psv: <http://www.wikidata.org/prop/statement/value/>
 PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
 PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
 PREFIX pqv: <http://www.wikidata.org/prop/qualifier/value/>
 PREFIX pqn: <http://www.wikidata.org/prop/qualifier/value-normalized/>
 PREFIX pr: <http://www.wikidata.org/prop/reference/>
 PREFIX prv: <http://www.wikidata.org/prop/reference/value/>
 PREFIX prn: <http://www.wikidata.org/prop/reference/value-normalized/>
 PREFIX wdno: <http://www.wikidata.org/prop/novalue/>
 PREFIX bd: <http://www.bigdata.com/rdf#>
 PREFIX dct: <http://purl.org/dc/terms/> 

SELECT ?place ?placeLabel ?image ?dbpediaID ?subjectName 
       ?longitude ?latitude ?dist ?instance_of ?instance_ofLabel ?layer 
WHERE
{
  SERVICE <http://query.wikidata.org/sparql> 
      {

		SELECT ?place ?placeLabel ?image ?longitude ?latitude ?dist ?instance_of ?instance_ofLabel ?layer 
		WHERE {
				  SERVICE wikibase:around 
				        {
						    ?place wdt:P625 ?location.
						    bd:serviceParam wikibase:center "[AUTO_COORDINATES]".
						    bd:serviceParam wikibase:radius "1".
						    bd:serviceParam wikibase:distance ?dist.
				        }
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
				  OPTIONAL { ?place wdt:P18 ?image. }
				  OPTIONAL { ?place wdt:P625 ?coordinate_location. }
				  OPTIONAL { ?place wdt:P31 ?layer. }
               }

      }
	  	 
	SERVICE <http://dbpedia.org/sparql> 
			   {
				   SELECT DISTINCT ?dbpediaID ?subjectName ?longitude ?latitude
				        FROM <http://dbpedia.org> 
					    WHERE {
								?dbpediaID owl:sameAs ?place ;
					               		   dct:subject ?subject ;
                                    		   geo:long ?longitude; 
										   geo:lat ?latitude . 

								?subject rdfs:label ?subjectName .
								FILTER (LANG(?subjectName) = "en")
							 }

				}
	 
	 
}


-- Train Stations 

PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX dc: <http://purl.org/dc/elements/1.1/> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX wd: <http://www.wikidata.org/entity/> 
PREFIX wdt: <http://www.wikidata.org/prop/direct/> 

SELECT ?line ?lineName ?lineColor ?station ?stationName 
	   ?stationAbs ?stationGeo ?stationNear 
WHERE { 
		SERVICE <http://query.wikidata.org/sparql> 
				{ 
				  wd:Q735559 wdt:P527 ?line. 
				  OPTIONAL {?line wdt:P462 ?color. ?color wdt:P465 ?lineColor.} 
				  ?station wdt:P81 ?line ; 
				  		   wdt:P625 ?stationGeo ; 
						   wdt:P197 ?stationNear. 
				} 
        OPTIONAL { 
					SERVICE <http://it.dbpedia.org/sparql> 
						{ 
						   ?dbpediaLine owl:sameAs ?line ; 
						   rdfs:label ?lineName .
						   FILTER(lang(?lineName) = "it" ). 
						 } 
				 } 
         OPTIONAL { 
			 		SERVICE <http://dbpedia.org/sparql> 
					     { 
							?dbpediaStation owl:sameAs ?station. 
							OPTIONAL { ?dbpediaStation rdfs:label ?stationName .
								       FILTER(lang(?stationName) = "it"). 
								      } 
							OPTIONAL { ?dbpediaStation rdfs:comment ?stationAbs. 
										FILTER(lang(?stationAbs) = "it"). 
									 } 
						  } 
					} 
	 } 
	 
--- World Cup 2018
-- Demo 1

SPARQL

PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX wdata: <http://www.wikidata.org/wiki/Special:EntityData/>
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>

PREFIX wds: <http://www.wikidata.org/entity/statement/>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX wdref: <http://www.wikidata.org/reference/>
PREFIX wdv: <http://www.wikidata.org/value/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX psv: <http://www.wikidata.org/prop/statement/value/>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX pqv: <http://www.wikidata.org/prop/qualifier/value/>
PREFIX pqn: <http://www.wikidata.org/prop/qualifier/value-normalized/>
PREFIX pr: <http://www.wikidata.org/prop/reference/>
PREFIX prv: <http://www.wikidata.org/prop/reference/value/>
PREFIX prn: <http://www.wikidata.org/prop/reference/value-normalized/>
PREFIX wdno: <http://www.wikidata.org/prop/novalue/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX wcplayers: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/players.ttl#>
PREFIX wcmatches: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/matches.ttl#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX wcplayers: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/players.ttl#>
PREFIX wcmatches: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/matches.ttl#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

SELECT DISTINCT
		# ?s2 as ?squad ?dbpediaTeam
		# ?playerURI ?dbpediaPlayer
		?playerPhoto ?playerName ?age
		?kit ?caps ?goals
WHERE  

        {
            { 
				SELECT DISTINCT
						# ?s2 as ?squad ?dbpediaTeam
						# ?playerURI dbpediaPlayer
						?playerName ?age ?kit ?caps ?goals
				WHERE {
						?s1 a <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/matches.ttl#WorldCup2018SoccerMatch> .
			            ?s1 schema:homeTeam ?s2 .
			            ?s2 owl:sameAs ?dbpediaTeam.
			            ?s2 ^dbo:currentMember ?playerURI.
			            ?playerURI owl:sameAs  ?dbpediaPlayer.
			            ?playerURI schema:name ?playerName.
			            ?playerURI foaf:age ?age.
			            ?playerURI wcplayers:kitNumber ?kit.
			            ?playerURI wcplayers:totalCaps ?caps.
			            ?playerURI wcplayers:totalGoals ?goals. 
					 }
					 
			  LIMIT 10
			}
        
            
			SERVICE <http://dbpedia.org/sparql>
				{
					SELECT DISTINCT ?playerPhoto
					WHERE {
							
							 OPTIONAL { 
										?dbpediaPlayer foaf:depiction ?playerPhoto .
									  } 
						  }
				}			

    }
} ;

-- World Cup 2018
-- Demo 2

SPARQL

PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX wdata: <http://www.wikidata.org/wiki/Special:EntityData/>
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX wds: <http://www.wikidata.org/entity/statement/>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX wdref: <http://www.wikidata.org/reference/>
PREFIX wdv: <http://www.wikidata.org/value/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX psv: <http://www.wikidata.org/prop/statement/value/>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX pqv: <http://www.wikidata.org/prop/qualifier/value/>
PREFIX pqn: <http://www.wikidata.org/prop/qualifier/value-normalized/>
PREFIX pr: <http://www.wikidata.org/prop/reference/>
PREFIX prv: <http://www.wikidata.org/prop/reference/value/>
PREFIX prn: <http://www.wikidata.org/prop/reference/value-normalized/>
PREFIX wdno: <http://www.wikidata.org/prop/novalue/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX wcplayers: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/players.ttl#>
PREFIX wcmatches: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/matches.ttl#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dbo: <http://dbpedia.org/ontology/>

SELECT ?match ?dbpediaScorer as ?href ?dbpediaScorerName ?dbpediaScorerName as ?name ?image ?dbpediaTeam ?leagueLabel ?team ?scorer ?matchLabel
WHERE
{
	SERVICE <http://query.wikidata.org/sparql> 
		{
			SELECT ?leagueLabel (COUNT(?league) AS ?count) ?scorer ?team ?match ?league ?matchLabel
			WHERE {
					  ?match wdt:P31 wd:Q16466010. # a football match
					  ?match wdt:P361* wd:Q170645. # that's part of the 2018 World Cup
					  ?match p:P1363 ?stmt.      # we want the details of goals
					  ?stmt ps:P1363 ?scorer.    # who scored
					  ?scorer p:P54 ?stmt1.
					  ?stmt1 ps:P54 ?team.       # what teams have they played for
					  MINUS {?stmt1 pq:P582 []} # no end time => player is still playing for team
					  ?team wdt:P31 wd:Q476028. # we only want domestic teams
					  ?team wdt:P118 ?league.    # what league do they play in
					  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
				  }	 
			GROUP BY ?leagueLabel ?league ?scorer ?team ?match ?matchLabel

		}
		
	SERVICE <http://dbpedia.org/sparql> 
			   {
				   SELECT DISTINCT ?dbpediaScorer ?dbpediaScorerName ?dbpediaTeam ?image ?dbpediaLeague
				        FROM <http://dbpedia.org> 
					    WHERE {
                                                    ?dbpediaScorer owl:sameAs ?scorer ;
                                                                 foaf:depiction ?image ;
                                                                 rdfs:label ?dbpediaScorerName .
                                                    filter (lang(?dbpediaScorerName) = "en")
						    ?dbpediaTeam owl:sameAs ?team  . 
                                                    # ?dbpediaLeague owl:sameAs ?league . 
                                             
                                                  }


				}
} ;


-- World Cup 2018
-- Demo 3
-- Reveals Compiler Bug

SPARQL

PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX wdata: <http://www.wikidata.org/wiki/Special:EntityData/>
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX wds: <http://www.wikidata.org/entity/statement/>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX wdref: <http://www.wikidata.org/reference/>
PREFIX wdv: <http://www.wikidata.org/value/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX psv: <http://www.wikidata.org/prop/statement/value/>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX pqv: <http://www.wikidata.org/prop/qualifier/value/>
PREFIX pqn: <http://www.wikidata.org/prop/qualifier/value-normalized/>
PREFIX pr: <http://www.wikidata.org/prop/reference/>
PREFIX prv: <http://www.wikidata.org/prop/reference/value/>
PREFIX prn: <http://www.wikidata.org/prop/reference/value-normalized/>
PREFIX wdno: <http://www.wikidata.org/prop/novalue/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX wcplayers: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/players.ttl#>
PREFIX wcmatches: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/matches.ttl#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dbo: <http://dbpedia.org/ontology/>

SELECT ?dbpediaScorer ?count ?team
WHERE
{
	SERVICE <http://query.wikidata.org/sparql> 
		{
			SELECT ?leagueLabel (COUNT(?league) AS ?count) ?league ?scorer ?team
			WHERE {
					  ?match wdt:P31 wd:Q16466010. # a football match
					  ?match wdt:P361* wd:Q170645. # that's part of the 2018 World Cup
					  ?match p:P1363 ?stmt.      # we want the details of goals
					  ?stmt ps:P1363 ?scorer.    # who scored
					  ?scorer p:P54 ?stmt1.
					  ?stmt1 ps:P54 ?team.       # what teams have they played for
					  MINUS {?stmt1 pq:P582 []} # no end time => player is still playing for team
					  ?team wdt:P31 wd:Q476028. # we only want domestic teams
					  ?team wdt:P118 ?league.    # what league do they play in
					  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
				  }	 
			GROUP BY ?leagueLabel ?league ?scorer ?team

		}
		
	SERVICE <http://dbpedia.org/sparql> 
	   {
		   SELECT DISTINCT ?dbpediaScorer 
		                   # ?image ?subjectName
	        FROM <http://dbpedia.org> 
		    WHERE {
					?dbpediaTeam owl:sameAs ?team  .
					?dbpediaScorer owl:sameAs ?scorer  .
		            # ?dbpediaScorer dct:subject ?subject .

					# optional { ?subject rdfs:label ?subjectName } .
					# FILTER (LANG(?subjectName) = "en")
			
					# optional {?dbpediaScorer foaf:depiction ?image } . 
				 }

		}
}  ;

## Nobel Prize Winners

SPARQL

PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX wdata: <http://www.wikidata.org/wiki/Special:EntityData/>
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX wds: <http://www.wikidata.org/entity/statement/>
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX wdref: <http://www.wikidata.org/reference/>
PREFIX wdv: <http://www.wikidata.org/value/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX psv: <http://www.wikidata.org/prop/statement/value/>
PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX pqv: <http://www.wikidata.org/prop/qualifier/value/>
PREFIX pqn: <http://www.wikidata.org/prop/qualifier/value-normalized/>
PREFIX pr: <http://www.wikidata.org/prop/reference/>
PREFIX prv: <http://www.wikidata.org/prop/reference/value/>
PREFIX prn: <http://www.wikidata.org/prop/reference/value-normalized/>
PREFIX wdno: <http://www.wikidata.org/prop/novalue/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX wcplayers: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/players.ttl#>
PREFIX wcmatches: <http://kingsley.idehen.net/DAV/home/danielhm/Public/world-cup/matches.ttl#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX nobel: <http://data.nobelprize.org/terms/>

SELECT DISTINCT ?id ?fieldLabel ?label ?label as ?name ?wid as ?wikidataID ?dbpediaID ?laureate_nobel_uri ?image

{
	SERVICE <http://query.wikidata.org/sparql> 
	    {

			SELECT (sample(?name) AS ?name) (sample(?text) as ?text) ?id ?wid ?laureate_nobel_uri
			WHERE {
					  SERVICE <http://data.nobelprize.org/sparql> 
					      {
						    ?laureate_nobel_uri nobel:laureateAward ?Nobelid.
						    BIND(REPLACE(str(?laureate_nobel_uri),"http://data.nobelprize.org/resource/laureate/","") AS ?id)

						    OPTIONAL{?laureate_nobel_uri nobel:laureateAward / nobel:year ?Year}
						    OPTIONAL{?Nobelid rdfs:label ?text}
						    OPTIONAL{?Nobelid nobel:laureate/foaf:name ?name}
						    OPTIONAL{?Nobelid nobel:laureate/foaf:birthday ?birthdate}
					  	 }
					  OPTIONAL { ?wid wdt:P2888 ?laureate_nobel_uri}
					  SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
					} 
		    GROUP BY ?id ?wid ?laureate_nobel_uri
			ORDER BY xsd:integer(?id)
		}  
		
	SERVICE <http://dbpedia.org/sparql> 
	   {
		   SELECT DISTINCT ?dbpediaID ?wid
		                   ?image ?subjectName
	        FROM <http://dbpedia.org> 
		    WHERE {
					?dbpediaID owl:sameAs ?wid  ;
		            		   dct:subject ?subject ;
							   dbo:birthName ?label ;
							   dbo:field ?field .

					OPTIONAL { ?subject rdfs:label ?subjectName } . 
					OPTIONAL { ?field rdfs:label ?fieldLabel } . 
					# OPTIONAL { ?dbpediaID dbo:birthName ?label } . 
					FILTER (LANG(?subjectName) = "en")
					FILTER (LANG(?fieldLabel) = "en")
		
					OPTIONAL {?dbpediaID foaf:depiction ?image } . 
				 }
		}		    
} ;

## CONSTRUCT 

PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX wdata: <http://www.wikidata.org/wiki/Special:EntityData/>
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>


CONSTRUCT 
		{
		  ?class a owl:Class . 
		  ?class rdfs:subClassOf ?superclass . 
		  ?class rdfs:label ?classLabel . 
		  ?property rdfs:domain ?class . 
		  ?property rdfs:label ?classLabel .
	
		}	  
WHERE 
	{
		SERVICE <http://query.wikidata.org/sparql> 
		    {
				SELECT ?class ?superclass ?classLabel  ?property 

				WHERE {
						  BIND(wd:Q11344 AS ?mainClass) .    # Q11344 chemical element; Q1420 automobile

						  # Pick one or the other of the following two triple patterns. 
						  ?class wdt:P279* ?mainClass.     # Find subclasses of the main class. 
						  #?mainClass wdt:P279* ?class.     # Find superclasses of the main class. 

						  ?class wdt:P279 ?superclass .     # So we can create rdfs:subClassOf triples
						  ?class rdfs:label ?classLabel.
						  OPTIONAL {
						    ?class wdt:P1963 ?property.
						    ?property rdfs:label ?propertyLabel.
						    FILTER((LANG(?propertyLabel)) = "en")
						    }
						  FILTER((LANG(?classLabel)) = "en")
					  }
		    }
	} 
	
;


---

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 


SELECT ?item ?dbpediaID ?latitude ?longitude
WHERE {
		SERVICE <http://query.wikidata.org/sparql> 
			{
				SELECT DISTINCT ?item ?label ?coord ?layer
				WHERE
				{
				  ?item wdt:P17 wd:Q142 .
				  ?item wdt:P31 wd:Q484170.
				  ?item wdt:P625 ?coord .
				  ?item rdfs:label ?label.
				  FILTER(LANG(?label) = "fr")
				  FILTER(STRENDS(?label, "y"))
				  BIND ( UCASE(SUBSTR(?label,STRLEN(?label)-1,1)) as ?layer )
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "fr" }
				}
			}
	
	SERVICE <http://dbpedia.org/sparql> 
	   {
		   SELECT DISTINCT ?dbpediaID ?image ?subjectName ?latitude ?longitude
	        FROM <http://dbpedia.org> 
		    WHERE {
					?dbpediaID owl:sameAs ?item  ;
		            		   dct:subject ?subject ;
                                           geo:lat ?latitude ;
                                           geo:long ?longitude .

					OPTIONAL { ?subject rdfs:label ?subjectName } . 	
					OPTIONAL {?dbpediaID foaf:depiction ?image } . 
					FILTER (LANG(?subjectName) = "en")
				 }
	}
} 
;


-- Holidays

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 



SELECT ?month_int ?monthLabel ?d ?world_dayLabel ?link ?countries ?dbpediaID 
WHERE {
		SERVICE <http://query.wikidata.org/sparql> 
		 {
			SELECT DISTINCT ?month_int ?monthLabel (?day_int as ?d) ?world_dayLabel 
							(?world_day as ?link) (GROUP_CONCAT(DISTINCT ?countryLabel; separator=", ") as ?countries) 
			WHERE {
					{ 
						SELECT ?month_int ?month ?day_int ?world_day ?country 
						WHERE {
								?month wdt:P31 wd:Q47018901; wdt:P1545 ?month_ordinal.
								?day p:P361 [ps:P361 ?month; pq:P1545 ?day_ordinal ].
								BIND(xsd:integer(?month_ordinal) AS ?month_int)
								BIND(xsd:integer(?day_ordinal) AS ?day_int)
								VALUES ?type {wd:Q2558684 wd:Q422695} # World ___ day; Awareness day 
								?world_day wdt:P31 ?type; wdt:P837 ?day
								OPTIONAL {?world_day wdt:P17 ?country} 
							  }  
					}
		
					SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en".
					        ?month rdfs:label ?monthLabel. ?world_day rdfs:label ?world_dayLabel. ?country rdfs:label ?countryLabel }
				} 
			GROUP BY ?month_int ?monthLabel ?day_int ?world_dayLabel ?world_day
			ORDER BY ?month_int ?d
		}
		
		SERVICE <http://dbpedia.org/sparql> 
		   {
			   SELECT DISTINCT ?dbpediaID ?image ?subjectName # ?dbpediaCountryID ?latitude ?longitude
		        FROM <http://dbpedia.org> 
			    WHERE {
						?dbpediaID owl:sameAs ?link ;
			            		   dct:subject ?subject .

						OPTIONAL { ?subject rdfs:label ?subjectName } . 	
						# OPTIONAL {?dbpediaID foaf:depiction ?image } . 
						FILTER (LANG(?subjectName) = "en")
					 }
			}
  } ;
  
  -- RDFs joing across Wikidata and DBpedia
  
  SPARQL
  
  PREFIX wd: <http://www.wikidata.org/entity/>
  PREFIX wdt: <http://www.wikidata.org/prop/direct/>
  PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
  PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
  PREFIX ps: <http://www.wikidata.org/prop/statement/>
  PREFIX wikibase: <http://wikiba.se/ontology#>
  PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
  PREFIX dbo: <http://dbpedia.org/ontology/>
  PREFIX bd: <http://www.bigdata.com/rdf#>
  PREFIX dct: <http://purl.org/dc/terms/> 



  SELECT DISTINCT ?item ?dbpediaID ?itemLabel ?source ?sourceLabel ?image ?subjectName 
  WHERE {
	  		SERVICE <http://query.wikidata.org/sparql> 
		  		 {
					  SELECT DISTINCT ?item ("00FFFF" AS ?rgb) ?itemLabel ?source ?sourceLabel 
					  WHERE {
							    ?item wdt:P361 wd:Q81414.
							    ?item wdt:P1343 ?source.
							    SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
					  	    }
		         }
				 
	 		SERVICE <http://dbpedia.org/sparql> 
	 		   {
	 			   SELECT DISTINCT ?dbpediaID ?image ?subject ?subjectName 
	 		        FROM <http://dbpedia.org> 
	 			    WHERE {
	 						?dbpediaID owl:sameAs ?item ;
	 			                        dct:subject ?subject .

	 						OPTIONAL { ?subject rdfs:label ?subjectName } . 	
	 						OPTIONAL {?dbpediaID foaf:depiction ?image } . 
	 						FILTER (LANG(?subjectName) = "en")
	 					 }
	 			}
        }
;

-- Version with GROUP_CONCAT on Subject

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 

SELECT DISTINCT ?item ?dbpediaID ?itemLabel ?source ?dbpediaSourceID ?sourceLabel group_concat(distinct(?subjectName); separator=",") as ?topics
  WHERE {
	  		SERVICE <http://query.wikidata.org/sparql> 
		  		 {
					  SELECT DISTINCT ?item ("00FFFF" AS ?rgb) ?itemLabel ?source ?sourceLabel 
					  WHERE {
							    ?item wdt:P361 wd:Q81414.
							    ?item wdt:P1343 ?source.
							    SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
					  	    }
		         }
				 
	 		SERVICE <http://dbpedia.org/sparql> 
	 		   {
	 			   SELECT DISTINCT ?dbpediaID ?image ?subject ?subjectName ?dbpediaSourceID
	 		        FROM <http://dbpedia.org> 
	 			    WHERE {
	 						?dbpediaID owl:sameAs ?item ;
	 			                        dct:subject ?subject .
							
							OPTIONAL {?dbpediaSourceID owl:sameAs ?source} . 

	 						OPTIONAL { ?subject rdfs:label ?subjectName } . 	
	 						OPTIONAL {?dbpediaID foaf:depiction ?image } . 
	 						FILTER (LANG(?subjectName) = "en")
	 					 }
	 			}
        }
GROUP BY ?item ?dbpediaID ?itemLabel ?source ?sourceLabel ?dbpediaSourceID
;

-- Looking up Actor URIs from DBpedia

SPARQL

PREFIX yago: <http://dbpedia.org/class/yago/>

SELECT DISTINCT ?s AS ?id ?name ?dbpediaID ?dbpediaLabel 

{
	{
		SELECT DISTINCT ?s ?name 
		FROM <http://kingsley.idehen.net/DAV/home/danielhm/Public/oscars-2019/91st-oscar-nominations.ttl>
		WHERE {
		        ?s a schema:Person;
		           schema:name ?name 
		     } 
	}


    SERVICE <http://dbpedia-live.openlinksw.com/sparql>
	{

		SELECT DISTINCT ?dbpediaID ?dbpediaLabel
        # FROM <http://dbpedia.org> 
		WHERE {
		        ?dbpediaID a yago:Actor109765278 .
		        OPTIONAL {?dbpediaID rdfs:label ?dbpediaLabel} . 
		        FILTER (LANG(?dbpediaLabel) = "en") 
                FILTER (xsd:string(?dbpediaLabel) = xsd:string(?name))
		     } 
	}
} 

;

-- Musicbrainz lookup

SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX mwapi: <https://www.mediawiki.org/ontology#API/>


SELECT ?artist  ?dbpediaID ?dbpediaLabel ?mburl ?artistLabel 
WHERE
{
	SERVICE <http://query.wikidata.org/sparql>
	{
		SELECT DISTINCT ?artist ?mburl ?artistLabel  
		WHERE {
				  SERVICE wikibase:mwapi {
				      bd:serviceParam wikibase:api "EntitySearch" .
				      bd:serviceParam wikibase:endpoint "www.wikidata.org" .
				      bd:serviceParam mwapi:search "bob marley" .
				      bd:serviceParam mwapi:language "en" .
				      ?artist wikibase:apiOutputItem mwapi:item .
				  }
				  ?artist wdt:P434 ?mbid.
				  wd:P434 wdt:P1921 ?formatterurl.
				  BIND(IRI(REPLACE(?mbid, "^(.+)$", ?formatterurl)) AS ?mburl)
  
				  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
  
			  } 
	   ORDER BY ASC(?num) LIMIT 20
	}

	SERVICE <http://dbpedia-live.openlinksw.com/sparql>
	{

		SELECT DISTINCT ?dbpediaID ?dbpediaLabel
	    # FROM <http://dbpedia.org> 
		WHERE {
		        ?dbpediaID owl:sameAs ?artist .
		        OPTIONAL {?dbpediaID rdfs:label ?dbpediaLabel} . 
		        FILTER (LANG(?dbpediaLabel) = "en") 

		     } 
	}
} ;


-- Fact Feed
SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX dct: <http://purl.org/dc/terms/> 
PREFIX mwapi: <https://www.mediawiki.org/ontology#API/>

SELECT * 
WHERE
{
	SERVICE <http://query.wikidata.org/sparql>
		{
			SELECT DISTINCT ?artist ?mburl ?artistLabel  
			WHERE {
					  SELECT ?person ?personLabel ?Datum ?gnd_id 
					  WHERE { 
							  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". } 
							  ?person wdt:P91 wd:Q38780 . 
							  ?person p:P91 ?statement . 
							  ?statement ps:P91 wd:Q38780 . 
							  ?statement pq:P106 ?Datum .    
							  OPTIONAL {?person wdt:P76 ?gnd_id .}
						  } 
				  }
			ORDER BY ?Datum
		}
} 

;

-- Wikidata, Search Japan, and DBpedia
SPARQL

PREFIX chname: <https://jpsearch.go.jp/entity/chname/>
PREFIX jps: <https://jpsearch.go.jp/term/property#>
PREFIX schema: <http://schema.org/> 
PREFIX wd: <http://www.wikidata.org/entity/>


SELECT ?creator ?work ?date ?url ?image
WHERE {
		SERVICE <http://query.wikidata.org/sparql>
		{
			SELECT ?creator ?work ?date ?url ?image WHERE {
			VALUES ?creator {wd:Q200798}
			SERVICE <https://jpsearch.go.jp/rdf/sparql/> {
				?jps_creator owl:sameAs ?creator .
				?work schema:creator ?jps_creator .
				?work jps:sourceInfo/schema:relatedLink ?url .
				OPTIONAL {?work schema:dateCreated ?date}
				OPTIONAL {?work schema:image ?image}
				}
			}
		}

		
}
;

-- 

-- Philosophers
SPARQL

PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>
PREFIX pq: <http://www.wikidata.org/prop/qualifier/>
PREFIX ps: <http://www.wikidata.org/prop/statement/>
PREFIX wikibase: <http://wikiba.se/ontology#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX dbc: <http://dbpedia.org/resource/Category:>
PREFIX dbo: <http://dbpedia.org/ontology/>

SELECT DISTINCT  ?wditem ?wditemLabel ?date ?image ?work ?workLabel ?coord ?description WHERE {  
    SERVICE <http://dbpedia.org/sparql> {
       ?item dct:subject dbc:Enlightenment_philosophers ;
        #?item dct:subject|dct:subject/skos:broader|dct:subject/skos:broader/skos:broader dbc:Global_Positioning_System ;
        #?item dct:subject|dct:subject/skos:broader dbc:Latvian_scientists ;
              owl:sameAs ?wditem FILTER regex (?wditem, "wikidata.org") .
        #?item dct:subject|dct:subject/skos:broader|dct:subject/skos:broader/skos:broader dbc:Duelling_fatalities .
    }        
    SERVICE <https://query.wikidata.org/sparql> {
	  {?wditem wdt:P569 ?date FILTER(YEAR(?date) > 0).}
    #  UNION
      #{?wditem wdt:P571|wdt:P577|wdt:P580|wdt:P619|wdt:P585 ?date .}
      #FILTER ((YEAR(?date)<1700)) .
      #{?wditem wdt:P625 ?coord .}
      #OPTIONAL {?wditem schema:description ?description FILTER (LANG(?description)="en").}
      #OPTIONAL {?wditem wdt:P1196 ?work. ?work rdfs:label ?workLabel FILTER (LANG(?workLabel)="en") .}
      #OPTIONAL {?wditem wdt:P800 ?work. ?work rdfs:label ?workLabel FILTER (LANG(?workLabel)="en") .}
      OPTIONAL {?wditem wdt:P18 ?image } .  
      ?wditem rdfs:label ?wditemLabel FILTER (LANG(?wditemLabel)="en") .
    }
} 

;
