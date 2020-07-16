SPARQL

PREFIX nhs-covid-tracing: <https://files.digital.nhs.uk/D6/BAA97E/NHS%20Pathways%20Covid-19%20data%202020-04-01.csv#>
PREFIX nhs-covid-tracing-doc: <https://linkeddata.uriburner.com/about/id/https/files.digital.nhs.uk/D6/BAA97E/NHS%20Pathways%20Covid-19%20data%202020-04-01.>
PREFIX nhs-covid-tracing-2: <https://files.digital.nhs.uk/1F/5113E1/111%20Online%20Covid-19%20data_2020-04-01.csv#>
PREFIX nhs-covid-tracing-doc-2: <https://linkeddata.uriburner.com/about/id/https/files.digital.nhs.uk/1F/5113E1/111%20Online%20Covid-19%20data_2020-04-01.>
PREFIX nhs-ward: <https://github.com/britishredcrosssociety/covid-19-vulnerability/raw/master/data/ward_nearest_hospitals.csv#> 
PREFIX nigeria-cdc: <https://docs.google.com/spreadsheets/d/1Z0csxYkWFuvNpfaGQDKnhqdREHcwYbvd3s7vHsWsT5Q/gviz/tq?tqx=out:csv&range=A1:H16&sheet=CDC_Nigeria#> 
PREFIX johns-hopkins-daily: <urn:johns-hopkins:covid19:daily:reports#>
PREFIX johhs-hopkins-daily-reports: <urn:johns-hopkins:covid19:daily:reports#> 
PREFIX nextstrain-metadata-tsv: <https://github.com/nextstrain/ncov/raw/master/data/metadata.tsv#> 

INSERT INTO GRAPH <urn:kidehen:covid19:label:fixes> 

  {
    nhs-covid-tracing:ontology skos:prefLabel  "UK NHS COVID-19 Pathways Ontology"  ;
                               rdfs:comment """Definition of terms used to define COVID-19 Disease Tracking, across annonymized subjects""" . 
    nhs-covid-tracing:class skos:prefLabel  "Disease Tracking Collection"  ;
                               rdfs:comment """Class to which disease tracking events belong""" . 
    nhs-covid-tracing-doc:csv  skos:prefLabel  "NHS Disease Tracking Collection Document"  ;
                               rdfs:comment """RDF sentence collection generated from CSV documents about COVID19 
                                               Disease Tracking by the UK NHS""" . 
    nhs-covid-tracing-2:ontology skos:prefLabel  "UK NHS COVID-19 Disease Spread Potential Ontology"  ;
                               rdfs:comment """Definition of terms used to define COVID-19 Disease Spread potential, across annonymized subjects""" . 
    nhs-covid-tracing-2:class skos:prefLabel  "Disease Spread Potential Tracking Collection"  ;
                               rdfs:comment """Class of events for tracking disease spread potential""" .   
    nhs-covid-tracing-doc-2:csv  skos:prefLabel  "NHS Disease Spread Potential Tracking Collection Document"  ;
                               rdfs:comment """RDF sentence collection generated from CSV documents about COVID19 
                                               Disease Spread Potential Tracking by the UK NHS""" .        

    nigeria-cdc:ontology skos:prefLabel  "Nigeria CDC COVID-19 Data Ontology"  ;
                               rdfs:comment """Definition of terms used to define Nigeria CDC COVID-19 Data""" . 
    nigeria-cdc:class skos:prefLabel  "Nigeria CDC State Data Collection"  ;
                               rdfs:comment """Categorization of Data for a given State""" .   
    nigeria-cdc:csv  skos:prefLabel  "About CDC Nigeria COVID-19 Data by State"  ;
                               rdfs:comment """RDF sentence collection generated from CSV documents about Nigeria CDC COVID-19 Data by State.""" .  

    johns-hopkins-daily:ontology  skos:prefLabel  "Johns Hopkins Daily COVID-19 CSV Dumps Ontology"  ;
                                  rdfs:comment """Definition of terms used to describe Johns's Hopkins Daily Data from CSV Documents.""" .       
    johns-hopkins-daily:class     skos:prefLabel  "Johns Hopkins Daily COVID-19 CSV Data Collection"  ;
                                  rdfs:comment """Categorization of COVID-19 Data for Johns Hopkins Daily""" .    

    johhs-hopkins-daily-reports:dbpedia_country_id  skos:prefLabel  "DBpedia Country ID" .
    johhs-hopkins-daily-reports:dbpedia_state_id    skos:prefLabel  "DBpedia State ID" .  
    johhs-hopkins-daily-reports:dbpedia_county_id   skos:prefLabel  "DBpedia County ID" .

    nextstrain-metadata-tsv:dbpedia_country_id  skos:prefLabel  "DBpedia Country ID" .
    nextstrain-metadata-tsv:nextstrain_id  skos:prefLabel  "Nextrain URI" .
    nextstrain-metadata-tsv:location  skos:prefLabel  "location" .
    nextstrain-metadata-tsv:class  skos:prefLabel  "Nextstrain Specimen Submission Category (Class)" ;
                                   rdfs:comment """Categorization of COVID-19 Specimen Submissions to Nextstrain""" .  
    nextstrain-metadata-tsv:ontology  skos:prefLabel  "Definition of terms used describe COVID-19 Specimen Submissions to Nextstrain" .
  } ;
