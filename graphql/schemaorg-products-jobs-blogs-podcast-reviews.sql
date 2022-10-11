-- News Articles
    SPARQL ADD <https://www.washingtonpost.com/technology/2022/10/05/uber-obstruction-sullivan-hacking/#osds> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.thetimes.co.uk/article/dna-sheds-light-on-diversity-in-the-dark-ages-79tbg0zhq#osds> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.cnn.com/2022/10/06/europe/nobel-peace-prize-preview-2022-intl-cmd/index.html#osds> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://news.crunchbase.com/business/top-startup-investors-2022-tiger-global-insight-softbank/#osds> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.businessinsider.com/tech-engineer-developer-salary-google-amazon-microsoft-ibm-apple-intel-2021-6#intel-engineering-managers-can-make-more-than-300000-9#osds> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://www.businessinsider.com/see-how-much-apple-pays-engineers-analysts-and-thousands-others-2022-9#osds> TO <urn:schemaorg:data:abox> ;
    SPARQL ADD <https://venturebeat.com/security/why-web-apps-are-one-of-this-years-leading-attack-vectors/> TO <urn:schemaorg:data:abox> ;
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
                                  gql:AggregateRating, gql:AggregateRatings ;
                gql:dataGraph    <urn:schemaorg:data:abox> ; # Instance Data (ABox) Graph
                gql:schemaGraph <urn:graphql:schemaorg:products:orgs:jobs> . # This Schema and Mappings

        # Schema.org to GraphQL Entity Type Mappings #

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
            gql:rdfClass schema:Image .
        
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

        schema:about a owl:ObjectProperty ;
            rdfs:range schema:Thing ;
            rdfs:domain schema:BlogPosting, schema:NewsArticle, schema:FAQPage, schema:WebPage;
            gql:type gql:Array ;
            gql:field gql:about .

        schema:offers a owl:ObjectProperty ;
            rdfs:range schema:Offer ;
            rdfs:domain schema:Product, schema:FAQPage, schema:WebPage, schema:SoftwareApplication ;
            gql:type gql:Array ;
            gql:field gql:offers .

        schema:mainEntityOfPage a owl:ObjectProperty ;
            rdfs:range schema:WebPage ;
            rdfs:domain schema:Product, schema:NewsArticle, schema:Person, schema:Organization,
                        schema:PodcastEpisode, schema:BlogPosting ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:mainEntityOfPage .
        
        schema:mainEntity a owl:ObjectProperty ;
            rdfs:range schema:Question, schema:Answer, schema:Thing ;
            rdfs:domain schema:FAQPage, schema:WebPage, schema:BlogPosting ;
            gql:type gql:Array ;
            # gql:type gql:Scalar ;
            gql:field gql:mainEntity .

        schema:image a owl:ObjectProperty ;
            rdfs:range schema:Image ;
            rdfs:domain schema:Product, schema:FAQPage, schema:NewsArticle, schema:Person, schema:WebPage,
                        schema:PodcastEpisode, schema:BlogPosting ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:image .

         schema:logo a owl:ObjectProperty ;
            rdfs:range schema:Image ;
            rdfs:domain schema:Brand, schema:Organization ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:image .

        schema:url a owl:ObjectProperty ;
            rdfs:range schema:URL ;
            rdfs:domain schema:Product, schema:FAQPage, schema:NewsArticle, schema:BlogPosting ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:url .

        schema:downloadUrl a owl:ObjectProperty ;
            rdfs:range schema:URL ;
            rdfs:domain schema:SoftwareApplication ;
            # gql:type gql:Array ;
            gql:type gql:Scalar ;
            gql:field gql:downloadUrl .


        schema:aggregateRating a owl:ObjectProperty ;
            rdfs:range schema:AggregateRating ;
            rdfs:domain schema:Review, schema:SoftwareApplication ;
            gql:type gql:Scalar ;
            gql:field gql:aggregateRating .

        schema:potentialAction a owl:ObjectProperty ;
            rdfs:range schema:Action ;
            rdfs:domain schema:Product, schema:Offer ;
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
            gql:type gql:Scalar ;
            gql:field gql:worksFor .

        schema:name a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Product, schema:Offer, 
                        schema:FAQPage, schema:Question, 
                        schema:Organization, schema:Person, schema:WebPage,
                        schema:PodcastEpisode, schema:BlogPosting, schema:Review,
                        schema:SoftwareApplication ;
            gql:type gql:Scalar ;
            gql:field gql:name .

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

        schema:text a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Answer ;
            gql:type gql:Scalar ;
            gql:field gql:text .

        schema:description a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:Product, schema:JobPosting, schema:Organization, 
                        schema:NewsArticle, schema:Person, schema:WebPage, schema:SoftwareApplication ;
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
            rdfs:domain schema:JobPosting ;
            gql:type gql:Scalar ;
            gql:field gql:title .

        schema:hiringOrganization a owl:ObjectProperty ;
            rdfs:range schema:Organization ;
            rdfs:domain schema:JobPosting ;
            gql:type gql:Scalar ;
            gql:field gql:hiringOrganization .

        schema:keywords a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:NewsArticle, schema:WebPage ;
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

        schema:author a owl:ObjectProperty ;
            rdfs:range schema:Organization, schema:Person ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:BlogPosting, schema:WebPage,
                        schema:PodcastEpisode, schema:Review, schema:SoftwareApplication ;
            gql:type gql:Scalar ;
            gql:field gql:schemaAuthor .

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


        schema:applicationCategory a owl:DatatypeProperty ;
            rdfs:range xsd:string ;
            rdfs:domain schema:SoftwareApplication ;
            gql:type gql:Scalar ;
            gql:field gql:applicationCategory .

        schema:publisher a owl:ObjectProperty ;
            rdfs:range schema:Organization, schema:Person ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:WebPage, schema:BlogPosting,
                        schema:SoftwareApplication, schema:PodcastEpisode ;
            gql:type gql:Scalar ;
            gql:field gql:schemaPublisher .

        schema:dateCreated a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:BlogPosting, schema:PodcastEpisode ;
            gql:type gql:Scalar ;
            gql:field gql:dateCreated .

        schema:datePublished a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:BlogPosting, schema:PodcastEpisode, schema:Review ;
            gql:type gql:Scalar ;
            gql:field gql:datePublished .
        
        schema:dateModified a owl:DatatypeProperty ;
            rdfs:range xsd:date ;
            rdfs:domain schema:NewsArticle, schema:Book, schema:BlogPosting, schema:PodcastEpisode ;
            gql:type gql:Scalar ;
            gql:field gql:dateModified .

        schema:ratingCount a owl:DatatypeProperty ;
            rdfs:range xsd:integer ;
            rdfs:domain schema:AggregateRating ;
            gql:type gql:Scalar ;
            gql:field gql:ratingCount .

        schema:ratingValue a owl:DatatypeProperty ;
            rdfs:range xsd:decimal ;
            rdfs:domain schema:AggregateRating ;
            gql:type gql:Scalar ;
            gql:field gql:ratingValue .
        
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
            WebPages(name: String, keywords: String, description: String, iri: IRI): [WebPage]
            "Web Pages Collection"
            PodcastEpisodes(name: String, description: String, iri: IRI): [PodcastEpisode]
            "BlogPostings Collection"
            BlogPostings(name: String, about: IRI, articleBody: String, iri: IRI): [BlogPosting]
            "Reviews Collection"
            Reviews(name: String, reviewBody: String, reviewRating: Int, author: String, iri: IRI): [Review]
            "Software Applications Collection"
            SoftwareApplications(name: String, downloadUrl: IRI, applicationCategory: String, operatingSystem: String, offers: IRI, iri: IRI): [SoftwareApplication]
            "Aggregate Ratings Collection"
            AggregateRatings( ratingCount: Int, ratingValue: Float, iri: IRI): [AggregateRating]
        }

        " [SchemaOrganization class](http://schema.org/Organization) "
        type SchemaOrganization {
            iri: IRI!
            name: String
            description: String
        }

        " [SchemaPerson class](http://schema.org/Person) "
        type SchemaPerson {
            iri: IRI!
            name: String
            jobTitle: String
            description: String
            worksFor: [SchemaOrganization]
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
            mainEntity: [Question]
            url: IRI
            image: IRI
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
            image: IRI
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            mainEntityOfPage: IRI
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
            image: IRI
        }

        " [BlogPosting class](http://schema.org/BlogPosting) "
        type BlogPosting    {
            iri: IRI!
            name: String
            editor: String
            schemaAuthor: [SchemaPerson]
            schemaPublisher: [SchemaOrganization]
            articleBody: String
            image: IRI
        }

        " [Review class](http://schema.org/Review) "
        type Review    {
            iri: IRI!
            name: String
            reviewRating: Int
            reviewBody: String
            author: String
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
        }

        " [AggregateRating class](http://schema.org/AggregateRating) "
        type AggregateRating   {
            iri: IRI!
            ratingCount: Int
            ratingValue: Float
        }
          '), '', 'urn:graphql:intro:schemaorg:products:orgs:jobs');

    GQL_INTRO_ADD ('urn:graphql:intro:schemaorg:products:orgs:jobs'); -- Add modified Instrospection Data to GQL Bridge Type System Schema
