-- Inference Rule

    SPARQL

    PREFIX schema-https: <https://schema.org/> 
    PREFIX schema: <http://schema.org/> 
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    PREFIX dbo: <http://dbpedia.org/ontology/> 
    PREFIX dbp: <http://dbpedia.org/property/> 

    INSERT {
            GRAPH <urn:rdfs:subclass:subproperty:mappings> 
                {
                    # Classes and Sub-Classes
                    schema:NewsArticle rdfs:subClassOf schema:Article .
                    schema:TechArticle rdfs:subClassOf schema:Article .
                    schema:NewsArticle rdfs:subClassOf schema:Article . 
                    schema:BlogPosting rdfs:subClassOf schema:Article . 
                    schema:MusicGroup rdfs:subClassOf schema:Organization . 
                    schema:Corporation rdfs:subClassOf schema:Organization . 
                    schema:NewsMediaOrganization rdfs:subClassOf schema:Organization . 
                    schema:Restaurant rdfs:subClassOf schema:Organization . 
                    schema-https:Restaurant rdfs:subClassOf schema:Organization .
                    schema:Hotel rdfs:subClassOf schema:Organization . 
                    schema-https:Hotel rdfs:subClassOf schema:Organization .
                    schema:Corporation rdfs:subClassOf schema:Organization . 
                    schema-https:Corporation rdfs:subClassOf schema:Organization . 
                    schema:SocialEvent rdfs:subClassOf schema:Event . 
                    # schema:ContactPoint rdfs:subClassOf schema:Person . 
                    schema:SocialMediaPosting rdfs:subClassOf schema:BlogPosting . 
                    schema:ReportageNewsArticle rdfs:subClassOf schema:NewsArticle . 
                    schema:OpinionNewsArticle rdfs:subClassOf schema:NewsArticle .
                    schema:LiveBlogPosting rdfs:subClassOf schema:BlogPosting . 
                    schema:SportsTeam rdfs:subClassOf schema:Organization . 
                    schema:SportsEvent rdfs:subClassOf schema:Event . 
                    schema:WebApplication rdfs:subClassOf schema:SoftwareApplication .
                    schema:SearchAction rdfs:subClassOf schema:Action .
                    schema-https:SearchAction rdfs:subClassOf schema:Action .
                    dbo:Book rdfs:subClassOf schema:Book .
                    dbo:Person rdfs:subClassOf schema:Person .

                    # Equivalent Classes
                    schema-https:SoftwareApplication owl:equivalentClass schema:SoftwareApplication .
                    schema-https:Blog owl:equivalentClass schema:Blog .
                    schema:QAPage owl:equivalentClass schema:FAQPage .
                    schema-https:FAQPage owl:equivalentClass schema:FAQPage .
                    schema-https:Restaurant owl:equivalentClass schema:Restaurant .
                    schema-https:Hotel owl:equivalentClass schema:Hotel .
                    schema-https:OpinionNewsArticle owl:equivalentClass schema:OpinionNewsArticle .

                    # Properties and Sub-Properties
                    schema:title rdfs:subPropertyOf schema:name .
                    schema:legalName rdfs:subPropertyOf schema:name .
                    schema-https:legalName rdfs:subPropertyOf schema:name .
                    rdfs:label rdfs:subPropertyOf schema:name .
                    dbp:name rdfs:subPropertyOf schema:name .
                    rdfs:comment rdfs:subPropertyOf schema:description .
                    dbo:isbn rdfs:subPropertyOf schema:isbn . 
                    dbp:isbn rdfs:subPropertyOf schema:isbn . 
                    dbp:author rdfs:subPropertyOf schema:author .
                    dbp:pubDate rdfs:subPropertyOf schema:datePublished .
                    schema:alternateName rdfs:subPropertyOf schema:name .
                    schema-https:alternateName rdfs:subPropertyOf schema:name .
                    schema:author rdfs:subPropertyOf schema:creator .
                    schema-https:author rdfs:subPropertyOf schema:creator .
                    schema:provider rdfs:subPropertyOf schema:publisher .
                    schema-https:provider rdfs:subPropertyOf schema:publisher .
                    schema:episode rdfs:subPropertyOf schema:hasPart . 
                    schema:worksFor rdfs:subPropertyOf schema:memberOf . 
                    schema:screenshot rdfs:subPropertyOf schema:image . 
                    schema:applicationCategory rdfs:subPropertyOf schema:category . 
                    schema:recipeCategory rdfs:subPropertyOf schema:category . 
                    schema:contentUrl rdfs:subPropertyOf schema:downloadUrl . 
                    schema-https:contentUrl rdfs:subPropertyOf schema:downloadUrl . 
                    schema:encodingFormat rdfs:subPropertyOf schema:contentType . 

                    # Equivalent Properties
                    schema-https:name owl:equivalentProperty schema:name . 
                    schema-https:description owl:equivalentProperty schema:description .
                    schema-https:articleBody owl:equivalentProperty schema:articleBody .
                    schema-https:image owl:equivalentProperty schema:image .
                    schema-https:publisher owl:equivalentProperty schema:publisher .  
                    schema-https:dateModified owl:equivalentProperty schema:datePublished . 
                    schema-https:datePublished owl:equivalentProperty schema:dateModified .  
                    schema-https:commentCount owl:equivalentProperty schema:commentCount .
                    schema-https:headline owl:equivalentProperty schema:headline .
                    schema-https:keywords owl:equivalentProperty schema:keywords .
                    schema-https:applicationCategory owl:equivalentProperty schema:applicationCategory . 
                    schema-https:thumbnailUrl owl:equivalentProperty schema:thumbnailUrl . 
                    schema-https:blogPost owl:equivalentProperty schema:blogPost . 
                    schema-https:image owl:equivalentProperty schema:image .
                    schema:episodes owl:equivalentProperty schema:episode . 
                    schema:actors owl:equivalentProperty schema:actor . 
                    schema:review owl:equivalentProperty schema:reviews . 
                    foaf:name owl:equivalentProperty schema:name . 
                    schema:mainEntityOfPage owl:equivalentProperty schema:url . 
                    
                } 
            } ;

    -- Check data loaded       
    SPARQL SELECT * FROM <urn:rdfs:subclass:subproperty:mappings> WHERE {?s ?p ?o} ;

    -- Upadate Rule based on graph

    RDFS_RULE_SET ('urn:rdfs:subclass:subproperty:inference:rules', 'urn:rdfs:subclass:subproperty:mappings') ;


-- News Articles
SPARQL ADD <https://www.washingtonpost.com/technology/2022/10/05/uber-obstruction-sullivan-hacking/#osds> TO <urn:schemaorg:data:abox> ;
SPARQL ADD <https://www.thetimes.co.uk/article/dna-sheds-light-on-diversity-in-the-dark-ages-79tbg0zhq#osds> TO <urn:schemaorg:data:abox> ;
SPARQL ADD <https://www.cnn.com/2022/10/06/europe/nobel-peace-prize-preview-2022-intl-cmd/index.html#osds> TO <urn:schemaorg:data:abox> ;
SPARQL ADD <https://news.crunchbase.com/business/top-startup-investors-2022-tiger-global-insight-softbank/#osds> TO <urn:schemaorg:data:abox> ;
SPARQL ADD <https://www.businessinsider.com/tech-engineer-developer-salary-google-amazon-microsoft-ibm-apple-intel-2021-6#intel-engineering-managers-can-make-more-than-300000-9#osds> TO <urn:schemaorg:data:abox> ;
SPARQL ADD <https://www.businessinsider.com/see-how-much-apple-pays-engineers-analysts-and-thousands-others-2022-9#osds> TO <urn:schemaorg:data:abox> ;
SPARQL ADD <https://venturebeat.com/security/why-web-apps-are-one-of-this-years-leading-attack-vectors/> TO <urn:schemaorg:data:abox> ;

-- Books

SPARQL ADD <urn:amazon:books> TO <urn:schemaorg:data:abox> ;

-- Via SPARQL

SPARQL
INSERT {
            GRAPH <urn:schemaorg:data:abox> 
                { 
                                ?s a schema:NewsArticle ;
                                    schema:publisher ?publisher ;
                                    schema:author ?author ;
                                    schema:headline ?headline ;
                                    schema:datePublished ?published ;
                                    schema:dateModified ?modified ;
                                    schema:keywords  ?keywords ;
                                    schema:mainEntityOfPage ?mainEntityOfPage ;
                                    schema:articleBody ?body ;
                                    schema:articleBody ?description .
                }
    }
WHERE {

        GRAPH ?g 
                { 
                    ?s a schema:NewsArticle ;
                        schema:publisher ?publisher ;
                        schema:author ?author ;
                        schema:headline ?headline ;
                        schema:datePublished ?published ;
                        schema:dateModified ?modified ;
                        schema:keywords  ?keywords ;
                        schema:mainEntityOfPage ?mainEntityOfPage .
                    OPTIONAL {?s schema:articleBody ?body} . 
                    OPTIONAL {?s schema:description ?description } . 
                }
    } 

LIMIT 2000 ;

-- DBpedia Books
    SPARQL DEFINE get:soft "no-sponge" LOAD <https://tinyurl.com/2ryc3w9j> INTO <urn:schemaorg:data:abox> ; 

-- Job Postings via without Sponging
-- Following OSDS download 

    SPARQL ADD <https://jobs.apple.com/en-in/details/200314122/in-technical-specialist> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://googleoperationscenter.com/jobs/6203492002/> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.verizon.com/about/work/jobs/8027934-principal-engineer> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://jobs.apple.com/en-in/details/200314122/in-technical-specialist> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.smartrecruiters.com/Comcast-CentralPA/83869704-customer-experience-representative> TO <urn:schemaorg:data:abox> ;

-- Job Postings with Sponging
    
    SPARQL DEFINE get:soft "soft" LOAD <https://jobs.apple.com/en-in/details/200314122/in-technical-specialist> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://googleoperationscenter.com/jobs/6203492002/> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.verizon.com/about/work/jobs/8027934-principal-engineer> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://jobs.apple.com/en-in/details/200314122/in-technical-specialist> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.smartrecruiters.com/Comcast-CentralPA/83869704-customer-experience-representative> INTO <urn:schemaorg:data:abox> ;

-- Via SPARQL 

SPARQL
INSERT {
            GRAPH <urn:schemaorg:data:abox> 
                { 
                    ?s a schema:JobPosting . 
                    ?s schema:name ?name .
                    ?s schema:title ?title .
                    ?s schema:description ?jobDesc .
                    ?s schema:datePosted ?datePosted .
                    ?s schema:validThrough ?valid .
                    ?s schema:employmentType ?jobType .
                    ?s schema:hiringOrganization ?org .

                    ?org schema:name ?orgName .
                    ?org schema:description  ?orgDesc . 
                }
    }
WHERE {
        SERVICE <https://linkeddata.uriburner.com/sparql>
        {
            SELECT * 
            WHERE {                  
                    GRAPH ?g 
                            { 
                                ?s a schema:JobPosting . 
                                OPTIONAL {?s schema:name ?name} .
                                OPTIONAL { ?s schema:title ?title } .
                                OPTIONAL { ?s schema:description ?jobDesc } .
                                OPTIONAL { ?s schema:datePosted ?datePosted } .
                                OPTIONAL { ?s schema:validThrough ?valid } .
                                OPTIONAL { ?s schema:employmentType ?jobType } .
                                OPTIONAL { ?s schema:hiringOrganization ?org } .
                                
                                ?org a schema:Organization.
                                OPTIONAL {?org schema:name ?orgName } .
                                OPTIONAL {?org schema:description  ?orgDesc }. 
                            }
            }
        }
    } 

LIMIT 1000 ;

-- Products & FAQs
-- Without Sponging
-- Following OSDS download 
    SPARQL ADD <https://www.apple.com/iphone-12-pro/key-features/> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.att.com/buy/phones/apple-iphone-13-128gb-pink.html> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.virginmedia.com/mobile/pay-monthly/apple/iphone-12-pro> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.apple.com/shop/buy-iphone/iphone-11/6.1-inch-display-128gb-black-unlocked> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.apple.com/us-hed/shop/buy-iphone/iphone-12-pro> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.apple.com/shop/buy-iphone/iphone-13/6.1-inch-display-256gb-starlight-verizon> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.apple.com/shop/questions/iphone> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.t-mobile.com/cell-phone/apple-iphone-13?sku=194252705452> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.t-mobile.com/cell-phone/apple-iphone-13-pro-max?sku=194252697474> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.apple.com/shop/buy-watch/apple-watch-ultra#osds> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://virtuoso.openlinksw.com/faq/#osds> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://uda.openlinksw.com/faq/#osds> TO  <urn:schemaorg:data:abox> ;

-- Turtle Doc Loads
    SPARQL DEFINE get:soft "no-sponge" LOAD <http://uda.openlinksw.com/data/turtle/general/uda_how_do_i.ttl> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "no-sponge" LOAD <http://www.openlinksw.com/data/turtle/general/odbc-faq.ttl> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "no-sponge" LOAD <http://virtuoso.openlinksw.com/data/turtle/general/virtuoso-faq.ttl> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "no-sponge" LOAD <http://virtuoso.openlinksw.com/data/turtle/lod-connectivity/2020/LODOffers-Licenses-Prices-2020.ttl> INTO <urn:schemaorg:data:abox> ;

-- With Sponging
    SPARQL DEFINE get:soft "soft" LOAD <https://www.apple.com/iphone-12-pro/key-features/> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.att.com/buy/phones/apple-iphone-13-128gb-pink.html> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.verizon.com/products/otterbox-otter-pop-symmetry-series-case-iphone-12-mini-stardust/> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.virginmedia.com/mobile/pay-monthly/apple/iphone-12-pro> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.apple.com/shop/buy-iphone/iphone-11/6.1-inch-display-128gb-black-unlocked> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.apple.com/us-hed/shop/buy-iphone/iphone-12-pro> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.apple.com/shop/questions/iphone> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.t-mobile.com/cell-phone/apple-iphone-13?sku=194252705452> INTO <urn:schemaorg:data:abox> ;
    SPARQL DEFINE get:soft "soft" LOAD <https://www.t-mobile.com/cell-phone/apple-iphone-13-pro-max?sku=194252697474> INTO <urn:schemaorg:data:abox> ;

-- Products Via SPARQL

    SPARQL
    INSERT {
                GRAPH <urn:schemaorg:data:abox>
                    { 
                        ?s a schema:Product . 
                        ?s schema:name ?name .
                        ?s schema:image ?image .
                        ?s schema:offers ?offer .
                        ?s schema:sku ?sku .
                        ?s schema:description ?description .
                        ?s schema:brand ?brand .
                        ?s schema:price ?price . 
                        ?s schema:maintEntityOfPage ?page . 
                        ?s schema:url ?url . 
                    }
        }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Product . 
                                                ?s schema:name ?name .
                                                OPTIONAL { ?s schema:mainEntityOfPage ?pageURL } .
                                                BIND (?pageURL AS ?page ) .
                                                OPTIONAL { ?s schema:url ?webPageURL } .
                                                BIND (?webPageURL AS ?url ) .
                                                OPTIONAL { ?s schema:image ?imageURL } .
                                                BIND (?imageURL AS ?image ) .
                                                OPTIONAL { ?s schema:offers ?offer } .
                                                OPTIONAL { ?s schema:sku ?sku } .
                                                ?s schema:description ?description .
                                                OPTIONAL { ?s schema:brand ?brand } .
                                                # FILTER (CONTAINS(STR(?name), 'iPhone'))
                                                # FILTER (LANG(?description) = "en")
                                                # FILTER (LANG(?name) = "en")
                                                OPTIONAL {?offer schema:name ?offerName .
                                                ?offer schema:price ?offerPrice .
                                                ?offer schema:sku  ?offerSku }. 
                                            }
                                    }
                                LIMIT 1000
                        }
                    }
        }
    }  ;

-- FAQs via SPARQL
   SPARQL
    INSERT {
                GRAPH <urn:schemaorg:data:abox>
                    { 
                        ?s a schema:FAQPage . 
                        ?s schema:name ?name .
                        ?s schema:mainEntity ?question .
                        ?s schema:url ?webPageURL .
                        ?s schema:image ?imageURL .
                        ?s schema:offers ?offer .
                        ?question a schema:Question .
                        ?question schema:name ?questionName . 
                        ?question schema:acceptedAnswer ?answer .
                        ?answer a schema:Answer . 
                        ?answer schema:name ?answerName .
                        ?answer schema:text ?text .
                    }
        }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:FAQPage . 
                                                OPTIONAL { ?s schema:name ?name } .
                                                OPTIONAL { ?s schema:mainEntity ?question } .
                                                OPTIONAL { ?s schema:url ?webPageURL } .
                                                OPTIONAL { ?s schema:image ?imageURL } .
                                                OPTIONAL { ?s schema:offers ?offer } .
                                                ?question a schema:Question .
                                                OPTIONAL { ?question schema:name ?questionName } . 
                                                OPTIONAL { ?question schema:acceptedAnswer ?answer } .
                                                FILTER (isIRI(?answer))
                                                ?answer a schema:Answer . 
                                                OPTIONAL { ?answer schema:name ?answerName } .
                                                OPTIONAL { ?answer schema:text ?text } .
                                            }
                                    }
                                # LIMIT 1000
                        }
                    }
        }
    }  ;
    -- News Articles, Web Pages, People, and Organizations
    -- Web Pages Via SPARQL
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox> { ?s ?p ?o . }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:WebPage ;
                                                ?p ?o . 
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

    -- News Article Via SPARQL
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox> { ?s ?p ?o . }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:NewsArticle ;
                                                ?p ?o . 
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

    -- Organizations Via SPARQL
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox> { ?s ?p ?o . }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Organization ;
                                                ?p ?o . 
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

    -- People Via SPARQL
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox> { ?s ?p ?o . }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Person ;
                                                ?p ?o . 
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;
    
    -- BlogPostings
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox> 
                { 
                    ?s a schema:BlogPosting ;
                        schema:author ?author ;
                        ?p ?o . 
                    ?author ?p1 ?o1 .
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:BlogPosting ;
                                                    schema:author ?author ;
                                                    ?p ?o . 
                                                ?author ?p1 ?o1 .
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

    -- PodcastEpisode Via SPARQL
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox> { ?s ?p ?o . }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:PodcastEpisode ;
                                                ?p ?o . 
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

    -- Reviews Via SPARQL
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox> { ?s ?p ?o . }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Review ;
                                                ?p ?o . 
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Software Applications Via SPARQL
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:SoftwareApplication ;
                       schema:aggregateRating ?rating ;
                    ?p ?o . 
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:SoftwareApplication ;
                                                ?p ?o . 
                                                OPTIONAL {?s schema:aggregateRating ?rating} .
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- UDA Software Applications Via SPARQL
    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:SoftwareApplication ;
                        schema:name ?name ;
                        schema:downloadUrl ?downloadUrl ;
                        schema:description ?desc ;
                        schema:aggregateRating ?rating ;
                        schema:applicationCategory ?category ;
                        schema:applicationSubCategory ?subCategory ;
                        ?p ?o . 
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://www.openlinksw.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:SoftwareApplication ;
                                                   schema:name ?name ;
                                                   schema:downloadUrl ?downloadUrl ;
                                                   schema:description ?desc ;
                                                   ?p ?o . 
                                                OPTIONAL {?s schema:aggregateRating ?rating } .
                                                OPTIONAL {?s schema:applicationCategory ?category } .
                                                OPTIONAL {?s schema:applicationSubCategory ?subCategory } .
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Events Via SPARQL

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:Event ;
                    schema:startDate ?startDate ;
                    schema:offers ?offers ;
                    ?p ?o .
                    ?offers ?p1 ?o1.
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Event ;
                                                schema:startDate ?startDate ;
                                                schema:offers ?offers ;
                                                schema:location ?location ;
                                                ?p ?o .
                                                filter (! isBlank(?s))

                                                ?offers ?p1 ?o1.
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Places Via SPARQL

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:Place ;
                        schema:address ?address ;
                        ?p ?o .
                        ?address ?p1 ?o1 .
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Place ;
                                                schema:address ?address ;
                                                ?p ?o .
                                                filter (! isBlank(?s))

                                                ?address ?p1 ?o1 .
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Addresses Via SPARQL

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:PostalAddress ;
                    ?p ?o .
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:PostalAddress ;
                                                ?p ?o .
                                                # filter (! isBlank(?s))
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Books Via SPARQL

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:Book ;
                    ?p ?o .
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Book ;
                                                ?p ?o .
                                                # filter (! isBlank(?s))
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Courses Via SPARQL

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:Course ;
                    ?p ?o .
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Course ;
                                                ?p ?o .
                                                # filter (! isBlank(?s))
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Videos Via SPARQL

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:VideoObject ;
                        schema:author ?author ;
                        schema:genre ?genre ;
                        schema:duration ?duration ;
                        schema:description ?description ;
                        ?p ?o .
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:VideoObject ;
                                                   schema:author ?author ;
                                                   schema:genre ?genre ;
                                                   schema:duration ?duration ;
                                                   schema:description ?description ;
                                                   ?p ?o .
                                                # filter (! isBlank(?s))
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Images via SPARQL

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:ImageObject ;
                        schema:height ?height ;
                        schema:width ?width . 
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:ImageObject ;
                                                   schema:height ?height ;
                                                   schema:width ?width . 
                                                # filter (! isBlank(?s))
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- DataFeeds

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:DataFeed ;
                        schema:title ?title ;
                        schema:date ?date ;
                        schema:dataFeedElement ?item ;
                        ?p ?o.
                    ?item schema:title ?itemTitle ;
                            ?p2 ?o2. 
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:DataFeed ;
                                                   schema:title ?title ;
                                                   schema:date ?date ;
                                                   schema:dataFeedElement ?item ;
                                                   ?p ?o.
                                                ?item schema:title ?itemTitle ;
                                                      ?p2 ?o2. 
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

    -- Search Actions

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:SearchAction ;
                       schema:name ?name ;
                       schema:target ?target .
                    ?target schema:urlTemplate ?urlTemplate .
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:SearchAction ;
                                                   schema:name ?name ;
                                                   schema:target ?target .
                                                ?target schema:urlTemplate ?urlTemplate .
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;

-- Datasets

    SPARQL
    INSERT {
              GRAPH <urn:schemaorg:data:abox>                                             
                { 
                    ?s a schema:Dataset ;
                        schema:name ?name ;
                        schema:description ?desc ;
                        # leaving inference to resolve schema:author subProperty of schema:creator.
                        schema:author ?creator ;
                        schema:datePublished ?datePublished ;
                        schema:dateModified ?dateModified ;
                        schema:distribution ?dist.
                    ?dist schema:contentUrl ?contentUrl ;
                            schema:encodingFormat ?format .
                }
           }
    WHERE {
            {
                SELECT * 
                WHERE {
                        SERVICE <https://linkeddata.uriburner.com/sparql>
                            {
                                SELECT * 
                                WHERE {
                                        GRAPH ?g 
                                            { 
                                                ?s a schema:Dataset ;
                                                   schema:name ?name ;
                                                   schema:description ?desc ;
                                                   schema:distribution ?dist.
                                                OPTIONAL {?s schema:creator ?creator}.
                                                OPTIONAL {?s schema:datePublished ?datePublished}.
                                                OPTIONAL {?s schema:dateModified ?dateModified}.
                                                ?dist schema:contentUrl ?contentUrl ;
                                                      schema:encodingFormat ?format .
                                            }
                                      }
                                LIMIT 1000 
                            }
                        }
            }
        } ;


    -- Cleanup

    SPARQL CLEAR GRAPH <urn:graphql:schemaorg:products:orgs:jobs> ;
    SPARQL SELECT COUNT(*) FROM <urn:graphql:schemaorg:products:orgs:jobs> WHERE {?s ?p ?o} ;

    -- GraphQL Mapping Graph 
    SPARQL
    PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
    PREFIX owl: <http://www.w3.org/2002/07/owl#> 
    PREFIX dbo: <http://dbpedia.org/ontology/> 
    PREFIX dbp: <http://dbpedia.org/property/> 
    PREFIX	gql: <http://www.openlinksw.com/schemas/graphql#> 
    PREFIX dct: <http://purl.org/dc/terms/> 

    INSERT DATA INTO <urn:graphql:schemaorg:products:orgs:jobs>
    {
        #  Schema.Org to GraphQL Entity & Property Mappings  
            gql:Map gql:schemaObjects gql:SchemaProduct, gql:SchemaProducts, gql:Offer, gql:Offers, gql:WebPage, gql:FAQPage, gql:FAQPages, 
                                gql:Question, gql:Questions, gql:Answer, gql:Answers, gql:WebPage, gql:WebPages,
                                gql:Images, gql:Actions, gql:Url, gql:JobPosting, gql:JobPostings, gql:SchemaOrganization,
                                gql:SchemaOrganizations, gql:NewsArticle, gql:NewsArticles, gql:SchemaPerson, gql:SchemaPeople,
                                gql:Book, gql:Books, gql:Course, gql:Courses, gql:Car, gql:Cars, gql:BlogPosting, gql:BlogPostings,
                                gql:PodcastEpisode, gql:PodcastEpisodes, gql:Review, gql:Reviews, gql:SoftwareApplication, gql:SoftwareApplications,
                                gql:AggregateRating, gql:AggregateRatings, gql:VideoObject, gql:VideoObjects, gql:ImageObject, gql:ImageObjects,
                                gql:Place, gql:Places, gql:SchemaAddress, gql:SchemaAddresses, gql:SchemaEvent, gql:SchemaEvents, gql:Course,
                                gql:Courses, gql:SchemaBook, gql:SchemaBooks, gql:DataFeed, gql:DataFeeds, gql:DataFeedItem, gql:DataFeedItems, 
                                gql:TVSerial, gql:TVSeries, gql:Episode, gql:Episodes, gql:CreativeWorkSeason, gql:CreativeWorkSeasons, gql:CreativeWorkSerial, 
                                gql:CreativeWorkSeries, gql:MusicRecording, gql:MusicRecordings, gql:MusicAlbum, gql:MusicAlbums, gql:SportsTeam, gql:SportsTeams,
                                gql:HowTo, gql:HowTos, gql:HowToStep, gql:HowToSteps, gql:HowToTool, gql:HowToTools, gql:HowToDirection, gql:HowToDirections,
                                gql:HowToSection, gql:HowToSections, gql:Blog, gql:Blogs, gql:TVSeason, gql:TVSeasons, gql:SportsTeam, gql:SportsTeams,
                                gql:SportsEvent, gql:SportsEvents, gql:Restaurant, gql:Restaurants, gql:GeoCoordinates, gql:GeoPoints,
                                gql:LocationFeatureSpecification, gql:LocationFeatureSpecifications, gql:Hotel, gql:Hotels, gql:ContactPoint, gql:ContactPoints,
                                gql:Rating, gql:Ratings, gql:HotelRoom, gql:HotelRooms, gql:SearchAction, gql:SearchActions, gql:EntryPoint, gql:EntryPoint,
                                gql:Dataset, gql:Datasets, gql:DataDownload, gql:DataDownloads, gql:Recipe, gql:Recipes ; 
                gql:dataGraph    <urn:schemaorg:data:abox> ; # Instance Data (ABox) Graph
                gql:schemaGraph <urn:graphql:schemaorg:products:orgs:jobs> ; # This Schema and Mappings
                gql:inferenceName "urn:rdfs:subclass:subproperty:inference:rules" .

        # Schema.org to GraphQL Entity Type Mappings #

        gql:Recipe gql:type gql:Object ;
            gql:rdfClass schema:Recipe .

        gql:Recipes gql:type gql:Array ;
            gql:rdfClass schema:Recipe .

        gql:DataDownload gql:type gql:Object ;
            gql:rdfClass schema:DataDownload .

        gql:DataDownloads gql:type gql:Array ;
            gql:rdfClass schema:DataDownload .

        gql:Dataset gql:type gql:Object ;
            gql:rdfClass schema:Dataset .

        gql:Datasets gql:type gql:Array ;
            gql:rdfClass schema:Dataset .

        gql:EntryPoint gql:type gql:Object ;
            gql:rdfClass schema:EntryPoint .

        gql:EntryPoints gql:type gql:Array ;
            gql:rdfClass schema:EntryPoint .

        gql:SearchAction gql:type gql:Object ;
            gql:rdfClass schema:SearchAction .

        gql:SearchActions gql:type gql:Array ;
            gql:rdfClass schema:SearchAction .

        gql:HotelRoom gql:type gql:Object ;
            gql:rdfClass schema:HotelRoom .
            
        gql:HotelRooms gql:type gql:Array ;
            gql:rdfClass schema:HotelRoom .

        gql:Rating gql:type gql:Object ;
            gql:rdfClass schema:Rating .
            
        gql:Ratings gql:type gql:Array ;
            gql:rdfClass schema:Rating .

        gql:ContactPoint gql:type gql:Object ;
            gql:rdfClass schema:ContactPoint .
            
        gql:ContactPoints gql:type gql:Array ;
            gql:rdfClass schema:ContactPoint .

        gql:Hotel gql:type gql:Object ;
            gql:rdfClass schema:Hotel .
            
        gql:Hotels gql:type gql:Array ;
            gql:rdfClass schema:Hotel .

        gql:LocationFeatureSpecification gql:type gql:Object ;
            gql:rdfClass schema:LocationFeatureSpecification .
            
        gql:LocationFeatureSpecifications gql:type gql:Array ;
            gql:rdfClass schema:LocationFeatureSpecification .

        gql:GeoCoordinates gql:type gql:Object ;
            gql:rdfClass schema:GeoCoordinates .
            
        gql:GeoPoints gql:type gql:Array ;
            gql:rdfClass schema:GeoCoordinates .

        gql:Restaurant gql:type gql:Object ;
            gql:rdfClass schema:Restaurant .
            
        gql:Restaurants gql:type gql:Array ;
            gql:rdfClass schema:Restaurant .

        gql:SportsEvent gql:type gql:Object ;
            gql:rdfClass schema:SportsEvent .
            
        gql:SportsEvents gql:type gql:Array ;
            gql:rdfClass schema:SportsEvent .

        gql:SportsTeam gql:type gql:Object ;
            gql:rdfClass schema:SportsTeam .
            
        gql:SportsTeams gql:type gql:Array ;
            gql:rdfClass schema:SportsTeam .

        gql:TVSeason gql:type gql:Object ;
            gql:rdfClass schema:TVSeason .
            
        gql:TVSeasons gql:type gql:Array ;
            gql:rdfClass schema:TVSeason .

        gql:Blog gql:type gql:Object ;
            gql:rdfClass schema:Blog .
            
        gql:Blogs gql:type gql:Array ;
            gql:rdfClass schema:Blog .

        gql:HowToSection gql:type gql:Object ;
            gql:rdfClass schema:HowToSection .
            
        gql:HowToSections gql:type gql:Array ;
            gql:rdfClass schema:HowToSection .

        gql:HowToDirection gql:type gql:Object ;
            gql:rdfClass schema:HowToDirection .
            
        gql:HowToDirections gql:type gql:Array ;
            gql:rdfClass schema:HowToDirection .

        gql:HowToTool gql:type gql:Object ;
            gql:rdfClass schema:HowToTool .
            
        gql:HowToTools gql:type gql:Array ;
            gql:rdfClass schema:HowToTool .

        gql:HowToStep gql:type gql:Object ;
            gql:rdfClass schema:HowToStep .
            
        gql:HowToSteps gql:type gql:Array ;
            gql:rdfClass schema:HowToStep .

        gql:HowTo gql:type gql:Object ;
            gql:rdfClass schema:HowTo .
            
        gql:HowTos gql:type gql:Array ;
            gql:rdfClass schema:HowTo .

        gql:SportsTeam gql:type gql:Object ;
            gql:rdfClass schema:SportsTeam .
            
        gql:SportTeams gql:type gql:Array ;
            gql:rdfClass schema:SportTeam .

        gql:MusicAlbum gql:type gql:Object ;
            gql:rdfClass schema:MusicRecording .
            
        gql:MusicAlbums gql:type gql:Array ;
            gql:rdfClass schema:MusicRecording .

        gql:MusicRecording gql:type gql:Object ;
            gql:rdfClass schema:MusicRecording .
            
        gql:MusicRecordings gql:type gql:Array ;
            gql:rdfClass schema:MusicRecording .

        gql:TVSerial gql:type gql:Object ;
            gql:rdfClass schema:TVSeries .
            
        gql:TVSeries gql:type gql:Array ;
            gql:rdfClass schema:TVSeries .

        gql:Episode gql:type gql:Object ;
            gql:rdfClass schema:Episode .
            
        gql:Episodes gql:type gql:Array ;
            gql:rdfClass schema:Episode .

        gql:DataFeedItem gql:type gql:Object ;
            gql:rdfClass schema:DataFeedItem .
            
        gql:DataFeedItems gql:type gql:Array ;
            gql:rdfClass schema:DataFeedItem .

        gql:DataFeed gql:type gql:Object ;
            gql:rdfClass schema:DataFeed .
            
        gql:DataFeeds gql:type gql:Array ;
            gql:rdfClass schema:DataFeed .

        gql:SchemaBook gql:type gql:Object ;
            gql:rdfClass schema:Book .
            
        gql:SchemaBooks gql:type gql:Array ;
            gql:rdfClass schema:Book .

        gql:Course gql:type gql:Object ;
            gql:rdfClass schema:Course .
            
        gql:Courses gql:type gql:Array ;
            gql:rdfClass schema:Course .

        gql:SchemaEvent gql:type gql:Object ;
            gql:rdfClass schema:Event .
            
        gql:SchemaEvents gql:type gql:Array ;
            gql:rdfClass schema:Event .

        gql:SchemaAddress gql:type gql:Object ;
            gql:rdfClass schema:PostalAddress .
            
        gql:SchemaAddresses gql:type gql:Array ;
            gql:rdfClass schema:PostalAddress .

        gql:Place gql:type gql:Object ;
            gql:rdfClass schema:Place .

        gql:Places gql:type gql:Array ;
            gql:rdfClass schema:Place .

        gql:ImageObject gql:type gql:Object ;
            gql:rdfClass schema:ImageObject .

        gql:ImageObjects gql:type gql:Array ;
            gql:rdfClass schema:ImageObject .

        gql:VideoObject gql:type gql:Object ;
            gql:rdfClass schema:VideoObject .

        gql:VideoObjects gql:type gql:Array ;
            gql:rdfClass schema:VideoObject .

        gql:AggregateRating gql:type gql:Object ;
            gql:rdfClass schema:AggregateRating .

        gql:AggregateRatings gql:type gql:Array ;
            gql:rdfClass schema:AggregateRating .

        gql:SoftwareApplication gql:type gql:Object ;
            gql:rdfClass schema:SoftwareApplication .

        gql:SoftwareApplications gql:type gql:Array ;
            gql:rdfClass schema:SoftwareApplication .

        gql:Review gql:type gql:Object ;
            gql:rdfClass schema:Review .

        gql:Reviews gql:type gql:Array ;
            gql:rdfClass schema:Review .

        gql:BlogPosting gql:type gql:Object ;
            gql:rdfClass schema:BlogPosting .

        gql:BlogPostings gql:type gql:Array ;
            gql:rdfClass schema:BlogPosting .

        gql:PodcastEpisode gql:type gql:Object ;
            gql:rdfClass schema:PodcastEpisode .

        gql:PodcastEpisodes gql:type gql:Array ;
            gql:rdfClass schema:PodcastEpisode .

        gql:SchemaPerson gql:type gql:Object ;
            gql:rdfClass schema:Person .

        gql:SchemaPeople gql:type gql:Array ;
            gql:rdfClass schema:Person .

        gql:SchemaOrganization gql:type gql:Object ;
            gql:rdfClass schema:Organization .

        gql:SchemaOrganizations gql:type gql:Array ;
            gql:rdfClass schema:Organization .

        gql:SchemaProduct gql:type gql:Object ;
            gql:rdfClass schema:Product .

        gql:SchemaProducts gql:type gql:Array ;
            gql:rdfClass schema:Product .

        gql:Offer gql:type gql:Object ;
            gql:rdfClass schema:Offer .

        gql:Offers gql:type gql:Array ;
            gql:rdfClass schema:Offer .
        
        gql:WebPage gql:type gql:Object ;
            gql:rdfClass schema:WebPage .

        gql:WebPages gql:type gql:Array ;
            gql:rdfClass schema:WebPage .

        gql:FAQPage gql:type gql:Object ;
            gql:rdfClass schema:FAQPage .
        
        gql:FAQPages gql:type gql:Array ;
            gql:rdfClass schema:FAQPage .

        gql:Question gql:type gql:Object ;
            gql:rdfClass schema:Question .

        gql:Questions gql:type gql:Array ;
            gql:rdfClass schema:Question .

        gql:Answer gql:type gql:Object ;
            gql:rdfClass schema:Answer .
        
         gql:Answers gql:type gql:Array ;
            gql:rdfClass schema:Answer .

        gql:Images gql:type gql:Array ;
            gql:rdfClass schema:ImageObject .
        
        gql:Actions gql:type gql:Array ;
            gql:rdfClass schema:Action .

        gql:Url gql:type gql:Object ;
            gql:rdfClass schema:URL .
        
        gql:JobPosting gql:type gql:Object ;
            gql:rdfClass schema:JobPosting . 

        gql:JobPostings gql:type gql:Array ;
            gql:rdfClass schema:JobPosting .

        gql:SchemaOrganization gql:type gql:Object ;
            gql:rdfClass schema:Organization .

        gql:SchemaOrganizations gql:type gql:Array ;
            gql:rdfClass schema:Organization .

        gql:NewsArticle gql:type gql:Object ;
            gql:rdfClass schema:NewsArticle .
        
        gql:NewsArticles gql:type gql:Array ;
            gql:rdfClass schema:NewsArticle .

        # GraphQL Entity Field (Property) to Schema.org Product Property Mappings #

        ## Object Properties

        schema:hasPart a owl:ObjectProperty ;
            rdfs:range schema:Thing ;
            rdfs:domain schema:Thing ;
            gql:type gql:Array ;
            gql:field gql:hasPart .

        schema:memberOf a owl:ObjectProperty ;
            rdfs:range schema:Organization ;
            rdfs:domain schema:Person, schema:Organization ;
            gql:type gql:Array ;
            gql:field gql:memberOf .

        schema:distribution a owl:ObjectProperty ;
            rdfs:range schema:DataDownload ;
            rdfs:domain schema:Dataset ;
            gql:type gql:Array ;
            gql:field gql:distribution .

        schema:target a owl:ObjectProperty ;
            rdfs:range schema:EntryPoint ;
            rdfs:domain schema:SearchAction ;
            gql:type gql:Array ;
            gql:field gql:target .

        schema:containsPlace a owl:ObjectProperty ;
            rdfs:range schema:HotelRoom ;
            rdfs:domain schema:Hotel ;
            gql:type gql:Array ;
            gql:field gql:containsPlace .

        schema:starRating a owl:ObjectProperty ;
            rdfs:range schema:Rating ;
            rdfs:domain schema:Hotel, schema:Organization, schema:Restaurant ;
            gql:type gql:Array ;
            gql:field gql:starRating .

        schema:contactPoint a owl:ObjectProperty ;
            rdfs:range schema:contactPoint ;
            rdfs:domain schema:Place, schema:Restaurant, schema:Hotel, schema:Organization ;
            gql:type gql:Array ;
            gql:field gql:contactPoint .

        schema:amenityFeature a owl:ObjectProperty ;
            rdfs:range schema:LocationFeatureSpecification ;
            rdfs:domain schema:Place, schema:Restaurant, schema:Hotel ;
            gql:type gql:Array ;
            gql:field gql:amenityFeature .

        schema:value a owl:ObjectProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:LocationFeatureSpecification ;
            gql:type gql:Array ;
            gql:field gql:value .

        schema:geo a owl:ObjectProperty ;
            rdfs:range schema:GeoCoordinates ;
            rdfs:domain schema:Place, schema:Restaurant, schema:PostalAddress ;
            gql:type gql:Array ;
            gql:field gql:geo .

        schema:homeTeam a owl:ObjectProperty ;
            rdfs:range schema:SportsTeam ;
            rdfs:domain schema:SportsEvent ;
            gql:type gql:Array ;
            gql:field gql:homeTeam .

        schema:awayTeam a owl:ObjectProperty ;
            rdfs:range schema:SportsTeam ;
            rdfs:domain schema:SportsEvent ;
            gql:type gql:Array ;
            gql:field gql:awayTeam .

        schema:episode a owl:ObjectProperty ;
            rdfs:range schema:Episode ;
            rdfs:domain schema:TVSeries, schema:TVSeason ;
            gql:type gql:Array ;
            gql:field gql:episode .

        schema:blogPost a owl:ObjectProperty ;
            rdfs:range schema:BlogPosting ;
            rdfs:domain schema:Blog ;
            gql:type gql:Array ;
            gql:field gql:blogPost .
        
        schema:step a owl:ObjectProperty ;
            rdfs:range schema:HowToStep ;
            rdfs:domain schema:HowTo ;
            gql:type gql:Array ;
            gql:field gql:step .

        schema:dataFeedElement a owl:ObjectProperty ;
            rdfs:range schema:DataFeedItem ;
            rdfs:domain schema:DataFeed ;
            gql:type gql:Array ;
            gql:field gql:dataFeedElement .

        schema:about a owl:ObjectProperty ;
            rdfs:range schema:Thing ;
            rdfs:domain schema:BlogPosting, schema:Blog, schema:NewsArticle, schema:FAQPage, schema:WebPage, 
                        schema:Course, schema:Book, schema:TVSeries, schema:Episode, schema:Movie,
                        schema:HowTo, schema:HowToSection, schema:HowToDirection ;
            gql:type gql:Array ;
            gql:field gql:about .

        schema:image a owl:ObjectProperty ;
            rdfs:range schema:ImageObject ;
            rdfs:domain schema:Thing, schema:Blog, schema:BlogPosting, schema:NewsArticle, schema:FAQPage, schema:WebPage, 
                        schema:Course, schema:Book, schema:DataFeed, schema:DataFeedItem,
                        schema:TVSeries, schema:Episode, schema:Movie, schema:SoftwareApplication,
                        schema:HowToSection, schema:HowTo, schema:HowToStep, schema:SearchAction, schema:Recipe ;
            gql:type gql:Array ;
            gql:field gql:image .

        schema:organizer a owl:ObjectProperty ;
            rdfs:range schema:Organization ;
            rdfs:domain schema:Event, schema:Course ;
            gql:type gql:Array ;
            gql:field gql:organizer .

        schema:contactPoint a owl:ObjectProperty ;
            rdfs:range schema:Person ;
            rdfs:domain schema:DataFeed, schema:Organization, schema:Hotel, schema:Restaurant ;
            gql:type gql:Array ;
            gql:field gql:contactPoint .

        schema:author a owl:ObjectProperty ;
            rdfs:range schema:Organization, schema:Person ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:BlogPosting, schema:WebPage,
                        schema:PodcastEpisode, schema:Review, schema:SoftwareApplication,
                        schema:VideoObject, schema:Course, schema:Book, schema:DataFeed, schema:DataFeedItem,
                        schema:HowTo, schema:FAQPage, schema:Restaurant, schema:Dataset, schema:Recipe ;
            # gql:type gql:Scalar ;
            gql:type gql:Array ;
            gql:field gql:schemaAuthor .

        schema:review a owl:ObjectProperty ;
            rdfs:range schema:Review ;
            rdfs:domain schema:Event, schema:Course, schema:Book, schema:TVSeries, schema:Movie, 
                        schema:Episode, schema:Hotel, schema:Restaurant ;
            gql:type gql:Array ;
            gql:field gql:review .

        # schema:reviews a owl:ObjectProperty ;
        #    rdfs:range schema:Review ;
        #    rdfs:domain schema:Event, schema:Course, schema:Book, schema:TVSeries, schema:Movie, 
        #                schema:Episode ;
        #    gql:type gql:Array ;
        #    gql:field gql:reviews .

        schema:trailer a owl:ObjectProperty ;
            rdfs:range schema:VideoObject ;
            rdfs:domain schema:TVSeries, schema:Episode, schema:Movie ;
            gql:type gql:Array ;
            gql:field gql:trailer .

        schema:actor a owl:ObjectProperty ;
            rdfs:range schema:Person ;
            rdfs:domain schema:TVSeries, schema:Episode, schema:Movie ;
            gql:type gql:Array ;
            gql:field gql:actor .

        schema:musicBy a owl:ObjectProperty ;
            rdfs:range schema:MusicGroup ;
            rdfs:domain schema:TVSeries, schema:Episode, schema:Movie ;
            gql:type gql:Array ;
            gql:field gql:musicBy .

        schema:director a owl:ObjectProperty ;
            rdfs:range schema:Person ;
            rdfs:domain schema:TVSeries, schema:Episode, schema:Movie ;
            gql:type gql:Array ;
            gql:field gql:director .

        schema:productionCompany a owl:ObjectProperty ;
            rdfs:range schema:Organization ;
            rdfs:domain schema:TVSeries, schema:Episode, schema:Movie ;
            gql:type gql:Array ;
            gql:field gql:productionCompany .

        schema:partOfSeason a owl:ObjectProperty ;
            rdfs:range schema:CreativeWorkSeason ;
            rdfs:domain schema:Episode ;
            gql:type gql:Array ;
            gql:field gql:partOfSeason .

        schema:partOfSeries a owl:ObjectProperty ;
            rdfs:range schema:CreativeWorkSeries ;
            rdfs:domain schema:Episode ;
            gql:type gql:Array ;
            gql:field gql:partOfSeries .

        schema:offers a owl:ObjectProperty ;
            rdfs:range schema:Offer ;
            rdfs:domain schema:Product, schema:FAQPage, schema:WebPage, schema:SoftwareApplication,
                        schema:Course, schema:Event, schema:Book, schema:Restaurant, schema:Hotel ;
            gql:type gql:Array ;
            gql:field gql:offers .

        schema:mainEntityOfPage a owl:ObjectProperty ;
            rdfs:range schema:WebPage ;
            rdfs:domain schema:Product, schema:NewsArticle, schema:Person, schema:Organization,
                        schema:PodcastEpisode, schema:BlogPosting, schema:SearchAction, schema:EntryPoint ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:mainEntityOfPage .
        
        schema:mainEntity a owl:ObjectProperty ;
            rdfs:range schema:Question, schema:Answer, schema:Thing ;
            rdfs:domain schema:FAQPage, schema:WebPage, schema:BlogPosting, schema:DataFeed ;
            gql:type gql:Array ;
            # gql:type gql:Scalar ;
            gql:field gql:mainEntity .

        schema:thumbnail a owl:ObjectProperty ;
            rdfs:range schema:ImageObject ;
            rdfs:domain schema:Product, schema:FAQPage, schema:NewsArticle, schema:Person, schema:WebPage,
                        schema:PodcastEpisode, schema:BlogPosting, schema:VideoObject ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:thumbnail .

        schema:ImageObject a owl:ObjectProperty ;
            rdfs:range schema:ImageObject ;
            rdfs:domain schema:Product, schema:FAQPage, schema:NewsArticle, schema:Person, schema:WebPage,
                        schema:PodcastEpisode, schema:BlogPosting ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:image .

         schema:logo a owl:ObjectProperty ;
            rdfs:range schema:ImageObject ;
            rdfs:domain schema:Brand, schema:Organization ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:image .

        schema:url a owl:ObjectProperty ;
            rdfs:range schema:URL ;
            rdfs:domain schema:Product, schema:FAQPage, schema:NewsArticle, schema:BlogPosting,
                        schema:VideoObject, schema:ImageObject, schema:HowToStep, schema:HowToSection ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:url .

        schema:downloadUrl a owl:ObjectProperty ;
            rdfs:range schema:URL ;
            rdfs:domain schema:SoftwareApplication, schema:DataDownload ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:downloadUrl .

        schema:aggregateRating a owl:ObjectProperty ;
            rdfs:range schema:AggregateRating ;
            rdfs:domain schema:Review, schema:SoftwareApplication, schema:Book, schema:Course,
                        schema:TVSeries, schema:Movie, schema:Episode, schema:Restaurant, schema:Hotel, schema:Place,
                        schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:aggregateRating .

        schema:tool a owl:ObjectProperty ;
            rdfs:range schema:HowToTool ;
            rdfs:domain schema:HowTo ;
            gql:type gql:Array ;
            gql:field gql:tool .

        schema:potentialAction a owl:ObjectProperty ;
            rdfs:range schema:Action ;
            rdfs:domain schema:Product, schema:Offer, schema:WebPage, schema:Application ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:potentialAction .

        schema:acceptedAnswer a owl:ObjectProperty ;
            rdfs:range schema:Answer ;
            rdfs:domain schema:Question ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:acceptedAnswer .

        schema:worksFor a owl:ObjectProperty ;
            rdfs:range schema:Organization ;
            rdfs:domain schema:Person ;
            gql:type gql:Array ;
            gql:field gql:worksFor .

        schema:hiringOrganization a owl:ObjectProperty ;
            rdfs:range schema:Organization ;
            rdfs:domain schema:JobPosting ;
            gql:type gql:Scalar ;
            gql:field gql:hiringOrganization .

        schema:location a owl:ObjectProperty ;
            rdfs:range schema:Place ;
            rdfs:domain schema:Event, schema:SportsEvent, schema:Course ;
            gql:type gql:Array ;
            gql:field gql:location .
        
        schema:address a owl:ObjectProperty ;
            rdfs:range schema:PostalAddress ;
            rdfs:domain schema:Place, schema:Organization, schema:Restaurant, schema:Hotel ;
            gql:type gql:Array ;
            gql:field gql:postalAddress .

        schema:itemListElement a owl:ObjectProperty ;
            rdfs:range schema:HowToDirection ;
            rdfs:domain schema:HowToStep, schema:HowToSection ;
            gql:type gql:Array ;
            gql:field gql:itemListElement .


    
    ## Datatype Properties

        schema:name a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Thing, schema:Product, schema:Offer, 
                        schema:FAQPage, schema:Question, 
                        schema:Organization, schema:Person, schema:WebPage,
                        schema:PodcastEpisode, schema:BlogPosting, schema:Review,
                        schema:SoftwareApplication, schema:VideoObject, schema:Event,
                        schema:Place, schema:Course, schema:Book, schema:TVSeries, schema:TVSeason,
                        schema:Episode, schema:DataFeed, schema:DataFeedItem, schema:HowTo, schema:HowToStep,
                        schema:HowToTool, schema:HowToSection, schema:Blog, schema:SportsEvent,
                        schema:SportsTeam, schema:Restaurant, schema:Hotel, schema:LocationFeatureSpecification,
                        schema:HotelRoom, schema:SearchAction, schema:EntryPoint, schema:Dataset, schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:name .

        schema:bed a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:HotelRoom ;
            gql:type gql:Scalar ;
            gql:field gql:bed .

        schema:contactType a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:ContactPoint ;
            gql:type gql:Scalar ;
            gql:field gql:contactType .

        schema:contactOption a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:ContactPoint ;
            gql:type gql:Scalar ;
            gql:field gql:contactOption .

        schema:addressCountry a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:PostalAddress ;
            gql:type gql:Scalar ;
            gql:field gql:addressCountry .

        schema:addressLocality a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:PostalAddress ;
            gql:type gql:Scalar ;
            gql:field gql:addressLocality .

        schema:addressRegion a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:PostalAddress ;
            gql:type gql:Scalar ;
            gql:field gql:addressRegion .

        schema:postalCode a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:PostalAddress ;
            gql:type gql:Scalar ;
            gql:field gql:postalCode .

        schema:streetAddress a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:PostalAddress ;
            gql:type gql:Scalar ;
            gql:field gql:streetAddress .

        schema:email a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Person, schema:Organization ;
            gql:type gql:Scalar ;
            gql:field gql:email .

        schema:telephone a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Person, schema:Organization, schema:Restaurant,
                        schema:Hotel, schema:ContactPoint ;
            gql:type gql:Scalar ;
            gql:field gql:telephone .

        schema:servesCuisine a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Restaurant ;
            gql:type gql:Scalar ;
            gql:field gql:servesCuisine .

        schema:openingHours a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Restaurant ;
            gql:type gql:Scalar ;
            gql:field gql:openingHours .

        schema:issn a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:TVSeries, schema:Episode, schema:Movie ;
            gql:type gql:Scalar ;
            gql:field gql:issn .

        schema:isbn a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Book ;
            gql:type gql:Scalar ;
            gql:field gql:isbn .

        schema:numberOfPages a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:Book ;
            gql:type gql:Scalar ;
            gql:field gql:numberOfPages .

        schema:episodeNumber a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:Episode ;
            gql:type gql:Scalar ;
            gql:field gql:episodeNumber .

        schema:interactionCount a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:VideoObject ;
            gql:type gql:Scalar ;
            gql:field gql:interactionCount .

        schema:numberofEpisodes a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:TVSeason, schema:TVSeries ;
            gql:type gql:Scalar ;
            gql:field gql:numberofEpisodes .

        schema:episodeNumber a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:TVSeason, schema:TVSeries ;
            gql:type gql:Scalar ;
            gql:field gql:episodeNumber .

        schema:position a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:HowToDirection, schema:HowToSection ;
            gql:type gql:Scalar ;
            gql:field gql:position .

        schema:ratingValue a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:Rating ;
            gql:type gql:Scalar ;
            gql:field gql:ratingValue .

        schema:abstract a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Book, schema:Episode, schema:Movie ;
            gql:type gql:Scalar ;
            gql:field gql:abstract .

        schema:bookFormat a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Book ;
            gql:type gql:Scalar ;
            gql:field gql:bookFormat .

        schema:bookEdition a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Book ;
            gql:type gql:Scalar ;
            gql:field gql:bookEdition .

        schema:paid a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:VideoObject ;
            gql:type gql:Scalar ;
            gql:field gql:paid .

        schema:height a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:ImageObject ;
            gql:type gql:Scalar ;
            gql:field gql:height .
        
        schema:width a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:ImageObject ;
            gql:type gql:Scalar ;
            gql:field gql:width .

        schema:familyFriendly a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:VideoObject ;
            gql:type gql:Scalar ;
            gql:field gql:familyFriendly .

        schema:duration a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:VideoObject ;
            gql:type gql:Scalar ;
            gql:field gql:duration .

        schema:videoid a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:VideoObject ;
            gql:type gql:Scalar ;
            gql:field gql:videoid .

        schema:jobTitle a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Person ;
            gql:type gql:Scalar ;
            gql:field gql:jobTitle .

        schema:familyName a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Person ;
            gql:type gql:Scalar ;
            gql:field gql:familyName .

        schema:givenName a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Person ;
            gql:type gql:Scalar ;
            gql:field gql:givenName .

        schema:reviewBody a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Review ;
            gql:type gql:Scalar ;
            gql:field gql:reviewBody .
        
        schema:reviewRating a owl:DatatypeProperty ;
            rdfs:range xsd:int ;
            rdfs:domain schema:Review ;
            gql:type gql:Scalar ;
            gql:field gql:reviewRating .

        schema:priceRange a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Restaurant ;
            gql:type gql:Scalar ;
            gql:field gql:priceRange .

        schema:text a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Answer, schema:DataFeed, schema:HowToStep ;
            gql:type gql:Scalar ;
            gql:field gql:text .

        schema:description a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Thing, schema:Product, schema:JobPosting, schema:Organization, 
                        schema:NewsArticle, schema:Person, schema:WebPage, schema:SoftwareApplication,
                        schema:FAQPage, schema:VideoObject, schema:BlogPosting, schema:Course, schema:Book,
                        schema:DataFeed, schema:TVSeries, schema:HowTo, schema:HowToStep, schema:Blog,
                        schema:TVSeason, schema:Episode, schema:Restaurant, schema:Hotel, schema:SearchAction,
                        schema:EntryPoint, schema:Dataset, schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:description .

        schema:sku a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Product, schema:Offer ;
            gql:type gql:Scalar ;
            gql:field gql:sku .

        schema:brand a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Product ;
            gql:type gql:Scalar ;
            gql:field gql:brand .

        schema:price a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:Product, schema:Offer ;
            gql:type gql:Scalar ;
            gql:field gql:price .

        schema:estimatedCost a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:HowTo ;
            gql:type gql:Scalar ;
            gql:field gql:price .

        schema:priceCurrency a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Offer ;
            gql:type gql:Scalar ;
            gql:field gql:priceCurrency .

        schema:lowPrice a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:Offer ;
            gql:type gql:Scalar ;
            gql:field gql:lowPrice .

        schema:highPrice a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:Offer ;
            gql:type gql:Scalar ;
            gql:field gql:highPrice .

        schema:startDate a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:Event, schema:SportsEvent, schema:Course ;
            gql:type gql:Scalar ;
            gql:field gql:startDate .

        schema:endDate a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:Event, schema:SportsEvent, schema:Course ;
            gql:type gql:Scalar ;
            gql:field gql:endDate .

        schema:datePosted a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:JobPosting ;
            gql:type gql:Scalar ;
            gql:field gql:datePosted .

        schema:validThrough a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:JobPosting ;
            gql:type gql:Scalar ;
            gql:field gql:validThrough.
        
        schema:employmentType a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:JobPosting ;
            gql:type gql:Scalar ;
            gql:field gql:employmentType .

        schema:title a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:JobPosting, schema:DataFeed, schema:DataFeedItem ;
            gql:type gql:Scalar ;
            gql:field gql:title .

        schema:keywords a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:NewsArticle, schema:WebPage, schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:keywords .

        schema:articleBody a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:NewsArticle, schema:BlogPosting ;
            gql:type gql:Scalar ;
            gql:field gql:articleBody .

        schema:headline a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:NewsArticle, schema:PodcastEpisode ;
            gql:type gql:Scalar ;
            gql:field gql:headline .

        schema:editor a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:PodcastEpisode ;
            gql:type gql:Scalar ;
            gql:field gql:editor .

        schema:operatingSystem a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:SoftwareApplication ;
            gql:type gql:Scalar ;
            gql:field gql:operatingSystem .

        schema:category a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Product, schema:DataFeed ;
            gql:type gql:Scalar ;
            gql:field gql:category .

        schema:applicationCategory a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:SoftwareApplication ;
            gql:type gql:Scalar ;
            gql:field gql:applicationCategory .

        schema:genre a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:VideoObject, schema:TVSeries, schema:Movie ;
            gql:type gql:Array ;
            gql:field gql:genre .

        schema:contentRating a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:VideoObject, schema:TVSeries, schema:Movie ;
            gql:type gql:Scalar ;
            gql:field gql:contentRating .

        schema:inLanguage a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Course, schema:Book, schema:WebPage, schema:VideoObject, schema:FAQPage,
                        schema:DataFeed ;
            gql:type gql:Scalar ;
            gql:field gql:inLanguage .

        schema:publisher a owl:ObjectProperty ;
            rdfs:range schema:Organization, schema:Person ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:WebPage, schema:BlogPosting,
                        schema:SoftwareApplication, schema:PodcastEpisode, schema:Book,
                        schema:Course, schema:SearchAction, schema:Dataset ;
            gql:type gql:Scalar ;
            gql:field gql:schemaPublisher .

        schema:dateCreated a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:BlogPosting, schema:PodcastEpisode, schema:DataFeed,
                        schema:DataFeedItem, schema:SoftwareApplication ;
            gql:type gql:Scalar ;
            gql:field gql:dateCreated .

        schema:datePublished a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:BlogPosting, schema:PodcastEpisode, schema:Review,
                        schema:DataFeed, schema:DataFeedItem, schema:TVSeries, schema:Movie, schema:HowTo, schema:FAQPage,
                        schema:SoftwareApplication, schema:Dataset ;
            gql:type gql:Scalar ;
            gql:field gql:datePublished .
        
        schema:dateModified a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:BlogPosting, schema:PodcastEpisode, schema:HowTo,
                        schema:FAQPage, schema:SoftwareApplication, schema:Dataset ;
            gql:type gql:Scalar ;
            gql:field gql:dateModified .

        schema:ratingCount a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:AggregateRating ;
            gql:type gql:Scalar ;
            gql:field gql:ratingCount .

        schema:commentCount a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:HowTo ;
            gql:type gql:Scalar ;
            gql:field gql:commentCount .

        schema:requiredQuantity a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:HowToTool ;
            gql:type gql:Scalar ;
            gql:field gql:requiredQuantity .

        schema:ratingValue a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:AggregateRating ;
            gql:type gql:Scalar ;
            gql:field gql:ratingValue .

        schema:height a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:Person ;
            gql:type gql:Scalar ;
            gql:field gql:height .

        schema:weight a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:Person ;
            gql:type gql:Scalar ;
            gql:field gql:weight .

        schema:latitude a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:GeoCoordinates ;
            gql:type gql:Scalar ;
            gql:field gql:latitude .

        schema:longitude a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:GeoCoordinates ;
            gql:type gql:Scalar ;
            gql:field gql:longitude .

        schema:birthdate a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:Person ;
            gql:type gql:Scalar ;
            gql:field gql:birthdate .

        schema:nationality a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Person ;
            gql:type gql:Scalar ;
            gql:field gql:nationality .

        schema:currencyAccepted a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Hotel ;
            gql:type gql:Scalar ;
            gql:field gql:currencyAccepted .

        schema:contentType a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:EntryPoint, schema:DataDownload ;
            gql:type gql:Scalar ;
            gql:field gql:contentType .

        schema:encodingType a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:EntryPoint ;
            gql:type gql:Scalar ;
            gql:field gql:encodingType .

        schema:httpMethod a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:EntryPoint ;
            gql:type gql:Scalar ;
            gql:field gql:httpMethod .
        
        schema:urlTemplate a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:EntryPoint ;
            gql:type gql:Scalar ;
            gql:field gql:urlTemplate .

        schema:contentSize a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:DataDownload ;
            gql:type gql:Scalar ;
            gql:field gql:contentSize .

        schema:cookTime a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:cookTime .

        schema:prepTime a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:prepTime .

        schema:recipeCategory a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:recipeCategory .

        schema:recipeCuisine a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:recipeCuisine .

        schema:recipeIngredient a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Recipe ;
            gql:type gql:Array ;
            gql:field gql:recipeIngredient .

        schema:recipeInstructions a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:recipeInstructions .

        schema:recipeYield a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Recipe ;
            gql:type gql:Scalar ;
            gql:field gql:recipeYield .
        
    } ;

    -- Clear Introspection Graph 
    SPARQL CLEAR GRAPH <urn:graphql:intro:schemaorg:products:orgs:jobs> ;  
    
     -- Update GQL Bridge Type Schema
    GQL_INIT_TYPE_SCHEMA(); -- Initialize GQL Type Schema for modification 
    -- Remove overlapping GQL Mapping
    GQL_INTRO_DEL ('urn:graphql:intro:schemaorg:products'); -- Delete Instrospection Data from the GQL Bridge Type System Schema
    -- Remove GQL Mapping to be replaced
    GQL_INTRO_DEL ('urn:graphql:intro:schemaorg:products:orgs:jobs'); -- Delete Instrospection Data from the GQL Bridge Type System Schema
    --TTLP (GQL_CREATE_TYPE_SCHEMA ('urn:graphql:schemaorg:products:orgs:jobs'), '', 'urn:graphql:intro:schemaorg:products:orgs:jobs'); -- Generate Introspection Data 

   TTLP (GQL_GENERATE_INTRO ('
           type Query {
            "Offers Collection"
            Offers(name: String, iri: IRI, price: Float): [Offer]
            "Products Collection"
            SchemaProducts(name: String, iri: IRI): [SchemaProduct]
            "FAQ Pages Collection"
            FAQPages(name: String, iri: IRI, mainEntity: IRI): [FAQPage]
            "Questions Collection"
            Questions(name: String, iri: IRI, mainEntity: IRI): [Question]
            "Answers Collection"
            Answers(text: String, iri: IRI): [Answer]
            "SchemaOrganizations Collection"
            SchemaOrganizations(name: String, iri: IRI): [SchemaOrganization]
            "JobPostings Collection"
            JobPostings(title: String, datePosted: String, validThrough: String, iri: IRI): [JobPosting]
            "News Articles Collection"
            NewsArticles(keyword: String, headline: String, datePublished: String, dateModified: String, schemaAuthor: IRI, schemaPublisher: IRI, iri: IRI): [NewsArticle]
            "SchemaOrganization Collection"
            SchemaOrganizations(name: String, description: String, iri: IRI): [SchemaOrganization]
            "SchemaPeople  Collection"
            SchemaPeople(name: String, jobTitle: String, iri: IRI): [SchemaPerson]
            "Web Pages Collection"
            WebPages(name: String, keywords: String, iri: IRI): [WebPage]
            "Web Pages Collection"
            PodcastEpisodes(name: String, description: String, iri: IRI): [PodcastEpisode]
            "BlogPostings Collection"
            BlogPostings(name: String, about: IRI, articleBody: String, iri: IRI): [BlogPosting]
            "Reviews Collection"
            Reviews(name: String, reviewBody: String, reviewRating: Int, schemaAuthor: String, iri: IRI): [Review]
            "Software Applications Collection"
            SoftwareApplications(name: String, downloadUrl: IRI, applicationCategory: String, operatingSystem: String, offers: IRI, iri: IRI): [SoftwareApplication]
            "Aggregate Ratings Collection"
            AggregateRatings( ratingCount: Int, ratingValue: Float, iri: IRI): [AggregateRating]
            "Video Collections"
            VideoObjects(name: String, videoid: String, schemaAuthor: String, paid: String, iri: IRI): [VideoObject]
            "Image Collections"
            ImageObjects(width: Int, height: Int, iri: IRI): [ImageObject]
            "Place Collections"
            Places(name: String, iri: IRI): [Place]
            "Schema Addresses Collections"
            SchemaAddresses(iri: IRI): [SchemaAddress]
            "Schema Events Collections"
            SchemaEvents(name: String, region: String, addressCountry: String, iri: IRI): [SchemaEvent]
            "Books Collections"
            SchemaBooks(name: String, iri: IRI): [SchemaBook]
            "Courses Collections"
            Courses(name: String, iri: IRI): [Course]
            "DataFeeds Collections"
            DataFeeds(title: String, iri: IRI): [DataFeed]
            "DataFeedItems Collections"
            DataFeedItems(title: String, iri: IRI): [DataFeedItem]
            "TV Series Collections"
            TVSeries(contentRating: String, iri: IRI): [TVSerial]
            "TV Seasons Collections"
            TVSeasons(contentRating: String, iri: IRI): [TVSeason]
            "Episodes Collections"
            Episodes(contentRating: String, iri: IRI): [Episode]
            "HowTo Collections"
            HowTos(name: String, iri: IRI): [HowTo]
            "HowToSteps Collections"
            HowToSteps(name: String, iri: IRI): [HowToStep]
            "HowTo Directions Collections"
            HowToDirections(position: Int, iri: IRI): [HowToDirection]
            "HowTo Tools Collections"
            HowToTool(name: String, iri: IRI): [HowToTool]
            "HowTo Sections Collections"
            HowToSection(name: String, iri: IRI): [HowToSection]
            "Blog Collections"
            Blogs(name: String, iri: IRI): [Blog]  
            "Sports Team Collections"
            SportsTeams(name: String, iri: IRI): [SportsTeam] 
            "Sports Events Collections"
            SportsEvents(name: String, location: String, iri: IRI): [SportsEvent]  
            "Restaurants Collections"
            Restaurants(name: String, iri: IRI): [Restaurant]  
            "LocationFeatureSpecifications Collections"
            LocationFeatureSpecifications(name: String, iri: IRI): [LocationFeatureSpecification]   
            "Hotels Collections"
            Hotels(name: String, iri: IRI): [Hotel] 
            "Hotel Rooms Collections"
            HotelRooms(bed: String, iri: IRI): [HotelRoom]   
            "Geo Points Collections"
            GeoPoints(latitude: Float, longitude: Float, iri: IRI): [GeoCoordinates]     
            "Contact Points Collections"
            ContactPoints(telephone: String,  iri: IRI): [ContactPoint]  
            "Ratings Collections"
            Ratings(ratingValue: Int, iri: IRI): [Rating]  
            "Search Actions Collections"
            SearchActions(name: String, iri: IRI): [SearchAction]  
            "EntryPoints Collections"
            EntryPoints(name: String, iri: IRI): [EntryPoint]  
            "Datasets Collections"
            Datasets(name: String, iri: IRI): [Dataset]      
            "DataDownloads Collections"
            DataDownloads(name: String, iri: IRI): [DataDownload]  
            "Recipes Collections"
            Recipes(name: String, iri: IRI): [Recipe]      
        }

        " [SchemaOrganization class](http://schema.org/Organization) "
        type SchemaOrganization {
            iri: IRI!
            name: String
            description: String
            postalAddress: [SchemaAddress]
            contactPoint: [ContactPoint]
        }

        " [SchemaPerson class](http://schema.org/Person) "
        type SchemaPerson {
            iri: IRI!
            name: String
            jobTitle: String
            description: String
            worksFor: [SchemaOrganization]
            email: String
            birthdate: String
            height: Float
            weight: Float
            nationality: String
            mainEntityOfPage: [WebPage]
        }

        " [JobPosting class](http://schema.org/JobPosting) "
        type JobPosting {
            iri: IRI!
            title: String
            description: String
            datePosted: String
            validThrough: String
            employmentType: String
            hiringOrganization: [SchemaOrganization]
        }

        " [Product class](http://schema.org/Product) "
        type SchemaProduct {
            iri: IRI!
            name: String
            description: String
            sku: String
            brand: String
            offers: [Offer]
            mainEntityOfPage: IRI
            image: IRI
            url: IRI
            potentialAction: IRI
        }

        " [Offer class](http://schema.org/Offer) "
        type Offer {
            iri: IRI!
            name: String
            sku: String
            potentialAction: IRI
            price: Float
            priceCurrency: String
            lowPrice: Float
            highPrice: Float
        }

        " [Question class](http://schema.org/Question) "
        type Question     {
            iri: IRI!
            name: String
            acceptedAnswer: [Answer]
        }

        " [Answer class](http://schema.org/Answer) "
        type Answer     {
            iri: IRI!
            text: String
        }

        " [WebPage class](http://schema.org/WebPage) "
        type WebPage     {
            iri: IRI!
            name: String
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            description: String
            keywords: String
            offers: [Offer]
            image: IRI
        }

        " [FAQPage class](http://schema.org/FAQPage) "
        type FAQPage     {
            iri: IRI!
            name: String
            description: String
            mainEntity: [Question]
            image: [ImageObject]
            offers: [Offer]
        }

       " [NewsArticle class](http://schema.org/NewsArticle) "
       type NewsArticle     {
            iri: IRI!
            headline: String
            datePublished: String
            dateModified: String
            keywords: String
            articleBody: String
            description: String
            image: [ImageObject]
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            mainEntityOfPage: [WebPage]
            url: IRI
        }

        " [PodcastEpisode class](http://schema.org/PodcastEpisode) "
        type PodcastEpisode     {
            iri: IRI!
            name: String
            editor: String
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            description: String
            image: [ImageObject]
        }

        " [BlogPosting class](http://schema.org/BlogPosting) "
        type BlogPosting    {
            iri: IRI!
            name: String
            editor: String
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            articleBody: String
            image: [ImageObject]
        }

        " [Review class](http://schema.org/Review) "
        type Review    {
            iri: IRI!
            name: String
            reviewRating: Int
            reviewBody: String
            schemaAuthor: [SchemaPerson]
            datePublished: String
        }

        " [SoftwareApplication class](http://schema.org/SoftwareApplication) "
        type SoftwareApplication    {
            iri: IRI!
            name: String
            aggregateRating: IRI
            applicationCategory: String
            operatingSystem: String
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            downloadUrl: IRI
            offers: [Offer]
            aggregateRating: [AggregateRating]
            description: String
            image: [ImageObject]
            datePublished: String
            dateModified: String
        }

        " [AggregateRating class](http://schema.org/AggregateRating) "
        type AggregateRating   {
            iri: IRI!
            ratingCount: Int
            ratingValue: Float
        }

        " [VideoObject class](http://schema.org/VideoObject) "
        type VideoObject   {
            iri: IRI!
            name: String
            description: String
            paid: String
            videoid: String
            thumbnail: [ImageObject]
            genre: String
            duration: String 
        }

        " [ImageObject class](http://schema.org/ImageObject) "
        type ImageObject   {
            iri: IRI!
            height: Int
            width: Int
        }

        " [Place class](http://schema.org/Place) "
        type Place  {
            iri: IRI!
            name: String
            postalAddress: [SchemaAddress]
        }

        " [SchemaAddress class](http://schema.org/PostalAddress) "
        type SchemaAddress  {
            iri: IRI!
            streetAddress: String
            addressLocality: String
            addressCountry: String
            postalCode: String
        }

        " [SchemaEvent class](http://schema.org/Event) "
        type SchemaEvent  {
            iri: IRI!
            name: String
            description: String
            startDate: String
            endDate: String
            image: [ImageObject]
            location: [Place]
            region: String
            offers: [Offer]
            organizer: [SchemaOrganization]
        }

        " [SchemaBook class](http://schema.org/Book) "
        type SchemaBook  {
            iri: IRI!
            name: String
            description: String
            image: [ImageObject]
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            aggregateRating: [AggregateRating]
            bookFormat: String
            bookEdition: String
            numberOfPages: Int
            isbn: String
            inLanguage: String
            reviews: [Review]
        }

        " [Course class](http://schema.org/Course) "
        type Course  {
            iri: IRI!
            name: String
            description: String
            aggregateRating: [AggregateRating]
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            image: [ImageObject]
        }

        " [DataFeed class](http://schema.org/DataFeed) "
        type DataFeed  {
            iri: IRI!
            title: String
            description: String
            datePublished: String
            inLanguage: String
            schemaAuthor: [SchemaPerson]
            image: [ImageObject]
            dataFeedElement: [DataFeedItem]
            text: String
            contactPoint: [ContactPoint]
        }

        " [DataFeedItem class](http://schema.org/DataFeedItem) "
        type DataFeedItem  {
            iri: IRI!
            name: String
            datePublished: String
            schemaAuthor: [SchemaPerson]
            image: [ImageObject]
        }

        " [TVSerial class](http://schema.org/TVSeries) "
        type TVSerial  {
            iri: IRI!
            name: String
            description: String
            genre: String
            actor: [SchemaPerson]
            director: [SchemaPerson]
            productionCompany: [SchemaOrganization]
            image: [ImageObject]
            contentRating: String
            datePublished: String
            review: [Review]
            episode: [Episode]
        }

        " [TVSeason class](http://schema.org/TVSeries) "
        type TVSeason  {
            iri: IRI!
            name: String
            episode: [Episode]
            numberofEpisodes: Int
        }

        " [Episode class](http://schema.org/Episode) "
        type Episode  {
            iri: IRI!
            name: String
            episodeNumber: Int
            description: String
            genre: String
            actor: [SchemaPerson]
            director: [SchemaPerson]
            productionCompany: [SchemaOrganization]
            image: [ImageObject]
            contentRating: String
            datePublished: String
            review: [Review]
        }

        " [HowTo class](http://schema.org/HowTo) "
        type HowTo  {
            iri: IRI!
            name: String
            description: String
            step: [HowToStep]
            schemaAuthor: [SchemaPerson]
            datePublished: String
            dateModified: String
            commentCount: Int
            image: [ImageObject]
            tool: [HowToTool]
            estimatedCost: Float
        }

        " [HowToStep class](http://schema.org/HowToStep) "
        type HowToStep  {
            iri: IRI!
            name: String
            url: String
            text: String
            itemListElement: [HowToDirection]
            image: [ImageObject]
        }

        " [HowToDirection class](http://schema.org/HowToDirection) "
        type HowToDirection  {
            iri: IRI!
            text: String
            position: Int
        }

        " [HowToTool class](http://schema.org/HowTool) "
        type HowToTool  {
            iri: IRI!
            name: String
            requiredQuantity: Int
            image: [ImageObject]
        }
        " [HowToSections class](http://schema.org/HowSection) "
        type HowToSection  {
            iri: IRI!
            name: String
            image: [ImageObject]
            url: String
            position: Int
            itemListElement: [HowToStep]
        }

        " [Blog class](http://schema.org/Blog) "
        type Blog     {
            iri: IRI!
            name: String
            blogPost: [BlogPosting]
            description: String
        }

        " [SportsTeam class](http://schema.org/SportsTeam) "
        type SportsTeam     {
            iri: IRI!
            name: String
            logo: [ImageObject]
            url: String
        }

        " [SportsEvent class](http://schema.org/SportsEvent) "
        type SportsEvent     {
            iri: IRI!
            name: String
            homeTeam: [SportsTeam]
            awayTeam: [SportsTeam]
            location: [Place]
            startDate: String
            endDate: String
        }

        " [Restaurant class](http://schema.org/Restaurant) "
        type Restaurant     {
            iri: IRI!
            name: String
            description: String
            postalAddress: [SchemaAddress]
            image: [ImageObject]
            aggregateRating: [AggregateRating]
            servesCuisine: String
            priceRange: String
            openingHours: String
            geo: [GeoCoordinates]
            telephone: String
            review: [Review]
        }

        " [Hotel class](http://schema.org/Hotel) "
        type Hotel     {
            iri: IRI!
            name: String
            description: String
            postalAddress: [SchemaAddress]
            image: [ImageObject]
            aggregateRating: [AggregateRating]
            geo: [GeoCoordinates]
            telephone: String
            review: [Review]
            amenityFeature: [LocationFeatureSpecification]
            ratingValue: [Rating]
            containsPlace: [HotelRoom]
            currencyAccepted: String
        }

        " [LocationFeatureSpecification class](http://schema.org/LocationFeatureSpecification) "
        type LocationFeatureSpecification   {
            iri: IRI!
            name: String
            value: String
        }

        " [GeoCoordinates class](http://schema.org/GeoCoordinates) "
        type GeoCoordinates   {
            iri: IRI!
            latitude: Float
            longitude: Float
        }

        " [ContactPoint class](http://schema.org/ContactPoint) "
        type ContactPoint   {
            iri: IRI!
            contactType: String
            telephone: String
            contactOption: String
        }

        " [Rating class](http://schema.org/Rating) "
        type Rating  {
            iri: IRI!
            ratingValue: Int
        }

        " [HotelRoom class](http://schema.org/HotelRoom) "
        type HotelRoom  {
            iri: IRI!
            bed: String
        }

        " [SearchAction class](http://schema.org/SearchAction) "
        type SearchAction  {
            iri: IRI!
            name: String
            description: String
            target: [EntryPoint]
            schemaPublisher: [SchemaOrganization]
        }

        " [EntryPoint class](http://schema.org/EntryPoint) "
        type EntryPoint  {
            iri: IRI!
            name: String
            description: String
            httpMethod: String
            contentType: String
            urlTemplate: String
        }

        " [Dataset class](http://schema.org/Dataset) "
        type Dataset  {
            iri: IRI!
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            name: String
            description: String
            distribution: [DataDownload]
        }

        " [DataDownload class](http://schema.org/DataDownload) "
        type DataDownload  {
            iri: IRI!
            name: String
            contentType: String
            downloadUrl: String
        }

        " [Recipe class](http://schema.org/Recipe) "
        type Recipe  {
            iri: IRI!
            name: String
            description: String
            schemaAuthor: [SchemaPerson]
            aggregateRating: [AggregateRating]
            cookTime: String
            image: [ImageObject]
            keywords: String
            prepTime: String
            recipeCategory: String
            recipeCuisine: String
            recipeIngredient: String
            recipeInstructions: String
            recipeYield: String 
        }

          '), '', 'urn:graphql:intro:schemaorg:products:orgs:jobs');

    GQL_INTRO_ADD ('urn:graphql:intro:schemaorg:products:orgs:jobs'); -- Add modified Instrospection Data to GQL Bridge Type System Schema
