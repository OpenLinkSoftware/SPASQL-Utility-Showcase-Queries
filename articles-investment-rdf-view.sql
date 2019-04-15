GRANT SELECT ON "csv"."demo"."articles" to SPARQL_SELECT;
GRANT SELECT ON "csv"."demo"."companies" to SPARQL_SELECT;
GRANT SELECT ON "csv"."demo"."investments" to SPARQL_SELECT;
GRANT SELECT ON "csv"."demo"."investors" to SPARQL_SELECT;


SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
CREATE  IRI CLASS csv:articles "http://^{URIQADefaultHost}^/csv/articles/id/%U#this" (in _id varchar not null) . ;
SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
CREATE  IRI CLASS csv:companies "http://^{URIQADefaultHost}^/csv/companies/id/%U#this" (in _id varchar not null) . ;
SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
CREATE  IRI CLASS csv:investments "http://^{URIQADefaultHost}^/csv/investments/id/%U#this" (in _id varchar not null) . ;
SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
CREATE  IRI CLASS csv:investors "http://^{URIQADefaultHost}^/csv/investors/id/%U#this" (in _id varchar not null) . ;


DROP VIEW "csv"."demo"."csv__Total"; 
CREATE  VIEW "csv"."demo"."csv__Total" as select (cnt0*cnt1)+(cnt2*cnt3)+(cnt4*cnt5)+(cnt6*cnt7) AS cnt FROM 
 (SELECT COUNT(*) cnt0 FROM "csv"."demo"."articles") tb0, 
 (SELECT COUNT(*)+1 as cnt1 FROM DB.DBA.TABLE_COLS where "TABLE" = 'csv.demo.articles'  and "COLUMN" <> '_IDN') tb1,
 (SELECT COUNT(*) cnt2 FROM "csv"."demo"."companies") tb2, 
 (SELECT COUNT(*)+1 as cnt3 FROM DB.DBA.TABLE_COLS where "TABLE" = 'csv.demo.companies'  and "COLUMN" <> '_IDN') tb3,
 (SELECT COUNT(*) cnt4 FROM "csv"."demo"."investments") tb4, 
 (SELECT COUNT(*)+1 as cnt5 FROM DB.DBA.TABLE_COLS where "TABLE" = 'csv.demo.investments'  and "COLUMN" <> '_IDN') tb5,
 (SELECT COUNT(*) cnt6 FROM "csv"."demo"."investors") tb6, 
 (SELECT COUNT(*)+1 as cnt7 FROM DB.DBA.TABLE_COLS where "TABLE" = 'csv.demo.investors'  and "COLUMN" <> '_IDN') tb7
; 
GRANT SELECT ON "csv"."demo"."csv__Total" to SPARQL_SELECT; 


SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
PREFIX csv-stat: <http://demo.openlinksw.com:8890/csv/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 

ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "csv"."demo"."articles" as articles_s
 { 
   CREATE csv:qm-articles AS GRAPH iri ("http://^{URIQADefaultHost}^/csv#")  
    { 
      # Maps FROM columns of "csv.demo.articles"
      csv:articles (articles_s."id")  a csv:articles ;
      csv:author articles_s."author" as csv:demo-articles-author ;
      csv:companies articles_s."companies" as csv:demo-articles-companies ;
      csv:foundcbref articles_s."foundcbref" as csv:demo-articles-foundcbref ;
      csv:foundnlpref articles_s."foundnlpref" as csv:demo-articles-foundnlpref ;
      csv:id articles_s."id" as csv:demo-articles-id ;
      csv:image articles_s."image" as csv:demo-articles-image ;
      csv:pdate articles_s."pdate" as csv:demo-articles-pdate ;
      csv:pmonth articles_s."pmonth" as csv:demo-articles-pmonth ;
      csv:pyear articles_s."pyear" as csv:demo-articles-pyear ;
      csv:snippet articles_s."snippet" as csv:demo-articles-snippet ;
      csv:source articles_s."source" as csv:demo-articles-source ;
      csv:title articles_s."title" as csv:demo-articles-title ;
      csv:url articles_s."url" as csv:demo-articles-url ;
      csv:snippet_id articles_s."snippet_ID" as csv:demo-articles-snippet_id .

    }
 }

;

SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
PREFIX csv-stat: <http://demo.openlinksw.com:8890/csv/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "csv"."demo"."companies" as companies_s
 { 
   CREATE csv:qm-companies AS GRAPH iri ("http://^{URIQADefaultHost}^/csv#")  
    { 
      # Maps FROM columns of "csv.demo.companies"
      csv:companies (companies_s."id")  a csv:companies ;
      csv:______blog_feed_url companies_s."______blog_feed_url" as csv:demo-companies-______blog_feed_url ;
      csv:blog_url companies_s."blog_url" as csv:demo-companies-blog_url ;
      csv:category_code companies_s."category_code" as csv:demo-companies-category_code ;
      csv:city companies_s."city" as csv:demo-companies-city ;
      csv:countrycode companies_s."countrycode" as csv:demo-companies-countrycode ;
      csv:deadpooled_date companies_s."deadpooled_date" as csv:demo-companies-deadpooled_date ;
      csv:description companies_s."description" as csv:demo-companies-description ;
      csv:email_address companies_s."email_address" as csv:demo-companies-email_address ;
      csv:founded_date companies_s."founded_date" as csv:demo-companies-founded_date ;
      csv:founded_month companies_s."founded_month" as csv:demo-companies-founded_month ;
      csv:founded_year companies_s."founded_year" as csv:demo-companies-founded_year ;
      csv:freebaseid companies_s."freebaseid" as csv:demo-companies-freebaseid ;
      csv:hasstatus companies_s."hasstatus" as csv:demo-companies-hasstatus ;
      csv:homepage_url companies_s."homepage_url" as csv:demo-companies-homepage_url ;
      csv:id companies_s."id" as csv:demo-companies-id ;
      csv:label companies_s."label" as csv:demo-companies-label ;
      csv:location_lat companies_s."location_lat" as csv:demo-companies-location_lat ;
      csv:location_lon companies_s."location_lon" as csv:demo-companies-location_lon ;
      csv:number_of_employees companies_s."number_of_employees" as csv:demo-companies-number_of_employees ;
      csv:one_competitor companies_s."one_competitor" as csv:demo-companies-one_competitor ;
      csv:overview companies_s."overview" as csv:demo-companies-overview ;
      csv:phone_number companies_s."phone_number" as csv:demo-companies-phone_number ;
      csv:revenue companies_s."revenue" as csv:demo-companies-revenue ;
      csv:revenuecurrency companies_s."revenuecurrency" as csv:demo-companies-revenuecurrency ;
      csv:revenuedate companies_s."revenuedate" as csv:demo-companies-revenuedate ;
      csv:statecode companies_s."statecode" as csv:demo-companies-statecode ;
      csv:url companies_s."url" as csv:demo-companies-url ;
      csv:webpage companies_s."webpage" as csv:demo-companies-webpage .

    }
 }

;

SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
PREFIX csv-stat: <http://demo.openlinksw.com:8890/csv/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "csv"."demo"."investments" as investments_s
 { 
   CREATE csv:qm-investments AS GRAPH iri ("http://^{URIQADefaultHost}^/csv#")  
    { 
      # Maps FROM columns of "csv.demo.investments"
      csv:investments (investments_s."id")  a csv:investments ;
      csv:companies investments_s."companies" as csv:demo-investments-companies ;
      csv:funded_date investments_s."funded_date" as csv:demo-investments-funded_date ;
      csv:funded_month investments_s."funded_month" as csv:demo-investments-funded_month ;
      csv:funded_year investments_s."funded_year" as csv:demo-investments-funded_year ;
      csv:hassourcedescription investments_s."hassourcedescription" as csv:demo-investments-hassourcedescription ;
      csv:hassourceurl investments_s."hassourceurl" as csv:demo-investments-hassourceurl ;
      csv:id investments_s."id" as csv:demo-investments-id ;
      csv:investors investments_s."investors" as csv:demo-investments-investors ;
      csv:label investments_s."label" as csv:demo-investments-label ;
      csv:raised_amount investments_s."raised_amount" as csv:demo-investments-raised_amount ;
      csv:raised_currency_code investments_s."raised_currency_code" as csv:demo-investments-raised_currency_code ;
      csv:round_code investments_s."round_code" as csv:demo-investments-round_code ;
      csv:shortinvid investments_s."shortInvID" as csv:demo-investments-shortinvid .

    }
 }

;

SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
PREFIX csv-stat: <http://demo.openlinksw.com:8890/csv/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "csv"."demo"."investors" as investors_s
 { 
   CREATE csv:qm-investors AS GRAPH iri ("http://^{URIQADefaultHost}^/csv#")  
    { 
      # Maps FROM columns of "csv.demo.investors"
      csv:investors (investors_s."id")  a csv:investors ;
      csv:overview_id investors_s."overview_ID" as csv:demo-investors-overview_id ;
      csv:affiliation_name investors_s."affiliation_name" as csv:demo-investors-affiliation_name ;
      csv:alias_list investors_s."alias_list" as csv:demo-investors-alias_list ;
      csv:birthplace investors_s."birthplace" as csv:demo-investors-birthplace ;
      csv:blog_feed_url investors_s."blog_feed_url" as csv:demo-investors-blog_feed_url ;
      csv:blog_url investors_s."blog_url" as csv:demo-investors-blog_url ;
      csv:category_code investors_s."category_code" as csv:demo-investors-category_code ;
      csv:city investors_s."city" as csv:demo-investors-city ;
      csv:countrycode investors_s."countrycode" as csv:demo-investors-countrycode ;
      csv:created_at investors_s."created_at" as csv:demo-investors-created_at ;
      csv:deadpooled_date investors_s."deadpooled_date" as csv:demo-investors-deadpooled_date ;
      csv:description investors_s."description" as csv:demo-investors-description ;
      csv:email_address investors_s."email_address" as csv:demo-investors-email_address ;
      csv:first_name investors_s."first_name" as csv:demo-investors-first_name ;
      csv:founded_month investors_s."founded_month" as csv:demo-investors-founded_month ;
      csv:founded_year investors_s."founded_year" as csv:demo-investors-founded_year ;
      csv:homepage_url investors_s."homepage_url" as csv:demo-investors-homepage_url ;
      csv:id investors_s."id" as csv:demo-investors-id ;
      csv:investor_category_code investors_s."investor_category_code" as csv:demo-investors-investor_category_code ;
      csv:investortype investors_s."investortype" as csv:demo-investors-investortype ;
      csv:label investors_s."label" as csv:demo-investors-label ;
      csv:last_name investors_s."last_name" as csv:demo-investors-last_name ;
      csv:number_of_employees investors_s."number_of_employees" as csv:demo-investors-number_of_employees ;
      csv:overview investors_s."overview" as csv:demo-investors-overview ;
      csv:phone_number investors_s."phone_number" as csv:demo-investors-phone_number ;
      csv:statecode investors_s."statecode" as csv:demo-investors-statecode ;
      csv:twitter_username investors_s."twitter_username" as csv:demo-investors-twitter_username ;
      csv:updated_at investors_s."updated_at" as csv:demo-investors-updated_at ;
      csv:url investors_s."url" as csv:demo-investors-url ;
      csv:web_presence investors_s."web_presence" as csv:demo-investors-web_presence .

    }
 }

;

SPARQL
PREFIX csv: <http://demo.openlinksw.com:8890/schemas/csv/> 
PREFIX csv-stat: <http://demo.openlinksw.com:8890/csv/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "csv"."demo"."articlesCount" as articlescount_s
 FROM "csv"."demo"."companiesCount" as companiescount_s
 FROM "csv"."demo"."investmentsCount" as investmentscount_s
 FROM "csv"."demo"."investorsCount" as investorscount_s
 FROM "csv"."demo"."csv__Total" as csv__total_s
 { 
   CREATE csv:qm-VoidStatistics AS GRAPH iri ("http://^{URIQADefaultHost}^/csv#") option (exclusive) 
    { 
      # voID Statistics 
      csv-stat: a void:Dataset as csv:dataset-csv ; 
       void:sparqlEndpoint <http://demo.openlinksw.com:8890/sparql> as csv:dataset-sparql-csv ; 
      void:statItem csv-stat:Stat . 
      csv-stat:Stat a scovo:Item ; 
       rdf:value csv__total_s.cnt as csv:stat-decl-csv ; 
       scovo:dimension void:numOfTriples . 

      csv-stat: void:statItem csv-stat:articlesStat as csv:statitem-csv-articles . 
      csv-stat:articlesStat a scovo:Item as csv:statitem-decl-csv-articles ; 
      rdf:value articlescount_s.cnt as csv:statitem-cnt-csv-articles ; 
      scovo:dimension void:numberOfResources as csv:statitem-type-1-csv-articles ; 
      scovo:dimension csv:articles as csv:statitem-type-2-csv-articles .

      csv-stat: void:statItem csv-stat:companiesStat as csv:statitem-csv-companies . 
      csv-stat:companiesStat a scovo:Item as csv:statitem-decl-csv-companies ; 
      rdf:value companiescount_s.cnt as csv:statitem-cnt-csv-companies ; 
      scovo:dimension void:numberOfResources as csv:statitem-type-1-csv-companies ; 
      scovo:dimension csv:companies as csv:statitem-type-2-csv-companies .

      csv-stat: void:statItem csv-stat:investmentsStat as csv:statitem-csv-investments . 
      csv-stat:investmentsStat a scovo:Item as csv:statitem-decl-csv-investments ; 
      rdf:value investmentscount_s.cnt as csv:statitem-cnt-csv-investments ; 
      scovo:dimension void:numberOfResources as csv:statitem-type-1-csv-investments ; 
      scovo:dimension csv:investments as csv:statitem-type-2-csv-investments .

      csv-stat: void:statItem csv-stat:investorsStat as csv:statitem-csv-investors . 
      csv-stat:investorsStat a scovo:Item as csv:statitem-decl-csv-investors ; 
      rdf:value investorscount_s.cnt as csv:statitem-cnt-csv-investors ; 
      scovo:dimension void:numberOfResources as csv:statitem-type-1-csv-investors ; 
      scovo:dimension csv:investors as csv:statitem-type-2-csv-investors .

    }
 }
;


-- Re-sync Full Text Indexes

DB.DBA.VT_INC_INDEX_DB_DBA_RDF_OBJ ();
	
-- Virtual directories for instance data
DB.DBA.URLREWRITE_CREATE _REGEX_RULE (
'csv_rule2',
1,
'(/[^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/csv%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)',
2,
null
);
DB.DBA.URLREWRITE_CREATE _REGEX_RULE (
'csv_rule4',
1,
'/csv/stat([^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/csv/stat%%23%%3E+%%3Fo+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/csv%%23%%3E+WHERE+{+%%3Chttp%%3A//^{URIQADefaultHost}^/csv/stat%%23%%3E+%%3Fp+%%3Fo+}&format=%U',
vector('*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)',
2,
null
);
DB.DBA.URLREWRITE_CREATE _REGEX_RULE (
'csv_rule6',
1,
'/csv/objects/([^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/csv/objects/%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/csv%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)',
2,
null
);
DB.DBA.URLREWRITE_CREATE _REGEX_RULE (
'csv_rule1',
1,
'([^#]*)',
vector('path'),
1,
'/describe/?url=http%%3A//^{URIQADefaultHost}^%U%%23this&graph=http%%3A//^{URIQADefaultHost}^/csv%%23&distinct=0',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE _REGEX_RULE (
'csv_rule7',
1,
'/csv/stat([^#]*)',
vector('path'),
1,
'/describe/?url=http%%3A//^{URIQADefaultHost}^/csv/stat%%23&graph=http%%3A//^{URIQADefaultHost}^/csv%%23',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE _REGEX_RULE (
'csv_rule5',
1,
'/csv/objects/(.*)',
vector('path'),
1,
'/services/rdf/object.binary?path=%%2Fcsv%%2Fobjects%%2F%U&accept=%U',
vector('path', '*accept*'),
null,
null,
2,
null
);
DB.DBA.URLREWRITE_CREATE _RULELIST ( 'csv_rule_list1', 1, vector ( 'csv_rule1', 'csv_rule7', 'csv_rule5', 'csv_rule2', 'csv_rule4', 'csv_rule6'));
DB.DBA.VHOST_REMOVE (lpath=>'/csv');
DB.DBA.VHOST_DEFINE (lpath=>'/csv', ppath=>'/', vsp_user=>'dba', is_dav=>0,
is_brws=>0, opts=>vector ('url_rewrite', 'csv_rule_list1')
);

-- Virtual directories for ontology
DB.DBA.URLREWRITE_CREATE _REGEX_RULE (
'csv_owl_rule2',
1,
'(/[^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/schemas/csv%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)',
2,
null
);
DB.DBA.URLREWRITE_CREATE _REGEX_RULE (
'csv_owl_rule1',
1,
'([^#]*)',
vector('path'),
1,
'/describe/?url=http://^{URIQADefaultHost}^%U',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE _RULELIST ( 'csv_owl_rule_list1', 1, vector ( 'csv_owl_rule1', 'csv_owl_rule2'));
DB.DBA.VHOST_REMOVE (lpath=>'/schemas/csv');
DB.DBA.VHOST_DEFINE (lpath=>'/schemas/csv', ppath=>'/', vsp_user=>'dba', is_dav=>0,
is_brws=>0, opts=>vector ('url_rewrite', 'csv_owl_rule_list1')
);