-- Assumes DirsAllowed includes natural_earth directory 
create function DB.DBA.GEO_NE_PATH_TO_FILES () { return 'natural_earth/'; }
;

create procedure DB.DBA.GEO_NE_INS_MDTA (inout raw_metas any, inout g_attrs any, inout env any)
{
  declare ses any;
  declare fldctr, fldcount integer;
  if (__tag of vector <> __tag (g_attrs))
    return;
  ses := string_output();
  http (sprintf ('sparql insert in graph <file://%s> {\n  `iri(?::0)` <origin> <file://%s> ;\n    <shp_entity_idx> ?::1;\n    <http://www.opengis.net/ont/geosparql#asWKT> ?::2', env[0], env[0]), ses);
  fldcount := length (g_attrs);
  for (fldctr := 0; fldctr < fldcount; fldctr := fldctr + 1)
    {
      http (sprintf (';\n    <%s> ?::%d', g_attrs[fldctr][0], fldctr + 3), ses);
    }
  http (' .\n}', ses);
  env[1] := string_output_string (ses);
}
;

create procedure DB.DBA.GEO_NE_INS_SHP (inout g_idx integer, inout g any, inout g_metas any, inout g_attrs any, inout env any)
{
  declare iri varchar;
  declare stat, msg, params any;
  iri := sprintf ('file://%s#shp%d', env[0], g_idx);
  if (env[1] is null)
    return;
  stat := '00000';
  msg := '';
  params := vector_concat (vector (iri, g_idx, 0), g_attrs);
  params[2] := g;
  exec (env[1], stat, msg, params, vector ('use_cache', 1));
  if (stat <> '00000')
    {
      dbg_obj_princ ('exec ', env[1], ' failed with params ', params);
      signal (stat, msg);
    }
  if (999 = mod (g_idx, 1000))
    {
      commit work;
      dbg_obj_princ ('loaded ', iri, ' from file ', env[0]);
    }
}
;

create procedure DB.DBA.SHP_DUMMY_CBK (inout g_idx integer, inout g any, inout g_metas any, inout g_attrs any, inout env any)
{
  dbg_obj_princ ('SHP_DUMMY_CBK (', g_idx, g, g_attrs, env, ')');
}
;

create procedure GEO_NE_LOAD (in fname varchar)
{
  "ShapefileIO read_all_shapes_local_file" (fname,  null, 0, vector ('DB.DBA.GEO_NE_INS_MDTA', 'DB.DBA.GEO_NE_INS_SHP', 'DB.DBA.SHP_DUMMY_CBK', 'DB.DBA.SHP_DUMMY_CBK'), vector (fname, null));
  commit work;
}
;

create procedure GEO_NE_LOAD_DIR (in path varchar, in graph varchar := null)
{
  declare ls any;
  declare inx int;
  if (not (path like '%/'))
    path := path || '/';
  ls := sys_dirlist (path, 1);
  for (inx := 0; inx < length (ls); inx := inx + 1)
    {
      if (ls[inx] like '%.shp')
	{
          DB.DBA.GEO_NE_LOAD (path || ls[inx]);
	}
    }
}
;

-- GEO_NE_LOAD ('natural_earth/10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_J_1000.shp');

GEO_NE_LOAD_DIR (DB.DBA.GEO_NE_PATH_TO_FILES() || '10m_cultural/');
GEO_NE_LOAD_DIR (DB.DBA.GEO_NE_PATH_TO_FILES() || '10m_cultural/ne_10m_parks_and_protected_areas/');
GEO_NE_LOAD_DIR (DB.DBA.GEO_NE_PATH_TO_FILES() || '10m_physical/');
GEO_NE_LOAD_DIR (DB.DBA.GEO_NE_PATH_TO_FILES() || '10m_physical/ne_10m_graticules_all/');
GEO_NE_LOAD_DIR (DB.DBA.GEO_NE_PATH_TO_FILES() || '10m_physical/ne_10m_bathymetry_all/');

-- Cleanup i.e., removal of relations that aren't applicable to GeoSPARQL

SPARQL 
DELETE 
		{ 
		  GRAPH ?g { ?s <http://www.opengis.net/ont/geosparql#asWKT> ?shp } 
		} 
INSERT { 
		  GRAPH ?g { ?s <bad_shape> ?shp } 
	   } 
WHERE { 
		  GRAPH ?g { ?s <http://www.opengis.net/ont/geosparql#asWKT> ?shp . 
		  			 FILTER ( bif:GEOS-isUnsupported (?shp)) 
					}
	   };
	   
COMMIT WORK ;
	   

-- Test Queries

-- Query 1

SPARQL

DEFINE sql:select-option "ORDER" 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX lgv: <http://linkedgeodata.org/vocabulary#> 
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>  

SELECT DISTINCT ?p
WHERE { GRAPH ?g 
    { 
	?s <http://www.opengis.net/ont/geosparql#asWKT> ?shp ; 
	?p ?o . 
	FILTER (!(?p in (<http://www.opengis.net/ont/geosparql#asWKT>, <origin>, <shp_entity_idx>, <ScaleRank>, <LabelRank>)))
        FILTER (!bif:GEOS-isUnsupported (?shp))
        FILTER (geof:sfIntersects (?shp, bif:st_point (-0.128056, 51.508057)))
	}} ;
	
-- Query 2

SPARQL

DEFINE sql:select-option "ORDER" 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX lgv: <http://linkedgeodata.org/vocabulary#> 
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>  

SELECT ?g ?s ?p ?o 
WHERE { GRAPH ?g 
    { 
	?s <http://www.opengis.net/ont/geosparql#asWKT> ?shp ; 
	?p ?o . 
	FILTER (!(?p in (<http://www.opengis.net/ont/geosparql#asWKT>, <origin>, <shp_entity_idx>, <ScaleRank>, <LabelRank>)))
        FILTER (!bif:GEOS-isUnsupported (?shp))
        FILTER (geof:sfIntersects (?shp, bif:st_point (-0.128056, 51.508057)))
	}} ;

-- Query 3

SPARQL

DEFINE sql:select-option "ORDER" 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX lgv: <http://linkedgeodata.org/vocabulary#> 
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>  

SELECT DISTINCT sample(?s) as ?sample count(1) as ?count ?o
WHERE { GRAPH ?g 
    { 
		?s <http://www.opengis.net/ont/geosparql#asWKT> ?shp ; 
		a ?o . 
		# FILTER (!(?p in (<http://www.opengis.net/ont/geosparql#asWKT>, <origin>, <shp_entity_idx>, <ScaleRank>, <LabelRank>)))
	    # FILTER (!bif:GEOS-isUnsupported (?shp))
	    # FILTER (geof:sfIntersects (?shp, bif:st_point (-0.128056, 51.508057)))
	}
} 
GROUP BY ?o ;


-- Query 4
-- Exceeds Query Limits on UB
SPARQL

DEFINE sql:select-option "ORDER" 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX lgv: <http://linkedgeodata.org/vocabulary#> 
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>  
PREFIX ogcgsf: <http://www.opengis.net/def/function/geosparql/>

WITH <file://natural_earth/10m_cultural/ne_10m_admin_0_countries.shp> 
SELECT ?name1 GROUP_CONCAT (?name2, ", ")
WHERE {
		?s1 <NAME> ?name1 .
		?s2 <NAME> ?name2 . 
		?s1 <http://www.opengis.net/ont/geosparql#asWKT> ?shp1 .
		 ?s2 <http://www.opengis.net/ont/geosparql#asWKT> ?shp2 .
		filter ( ogcgsf:sfIntersects (?shp1, ?shp2 ))
	  } 
GROUP BY ?name1 
ORDER BY DESC(count(1));


-- Query 5
-- Alternative leveraging sub-query in FILTER

SPARQL

DEFINE sql:select-option "ORDER"
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX lgv: <http://linkedgeodata.org/vocabulary#> 
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>  
PREFIX ogcgsf: <http://www.opengis.net/def/function/geosparql/>

SELECT ?name1 GROUP_CONCAT (?name2, ", ") AS ?group 
FROM <file://natural_earth/10m_cultural/ne_10m_admin_0_countries.shp> 
WHERE {
	    ?s1 <NAME> ?name1 .
	    ?s2 <NAME> ?name2 . 
	    FILTER ( ogcgsf:sfIntersects (
								        (
											 SELECT ?shp1 
											 WHERE { ?s1 <http://www.opengis.net/ont/geosparql#asWKT> ?shp1 .}
									    ),
								        (
											 SELECT ?shp2 
											 WHERE {  ?s2 <http://www.opengis.net/ont/geosparql#asWKT> ?shp2 . }
									     ) 
									 )
		       ) 
	  } 
GROUP BY ?name1 
ORDER BY DESC(COUNT(1)) ;

-- Query 5.5

SPARQL

PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX ogcgsf: <http://www.opengis.net/def/function/geosparql/>
PREFIX bif: <http://www.openlinksw.com/schemas/bif#> 

SELECT ?s1 AS ?href ?name ?name AS ?town bif:st_xmin(?shp1) AS ?longitude bif:st_ymin(?shp1) AS ?latitude ?maxPop 
WHERE {
  		GRAPH <file://natural_earth/10m_cultural/ne_10m_admin_0_boundary_lines_map_units.shp> 
			{ ?england <NAME> "England" ; geo:asWKT ?eng_as_region . }
  		GRAPH <file://natural_earth/10m_cultural/ne_10m_populated_places_simple.shp> 
			{ 
               ?s1 geo:asWKT ?shp1 ; 
                   <LS_NAME> ?name; 
                   <POP_MAX> ?maxPop
            }
			
  		FILTER (geof:sfIntersects (?eng_as_region, ?shp1)) 
	  } ;

-- Query 6
-- Uses http://docs.openlinksw.com/virtuoso/fn_st_xmin/

SPARQL

PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX ogcgsf: <http://www.opengis.net/def/function/geosparql/>
PREFIX bif: <http://www.openlinksw.com/schemas/bif#> 

SELECT ?s1 as ?href ?name bif:st_xmin(?shp1) AS ?longitude bif:st_ymin(?shp1) AS ?latitude
WHERE {
  		GRAPH <file://natural_earth/10m_cultural/ne_10m_admin_0_boundary_lines_map_units.shp> 
			{ ?england <NAME> "England" ; geo:asWKT ?eng_as_region . }
  		GRAPH <file://natural_earth/10m_cultural/ne_10m_populated_places_simple.shp> 
			{ ?s1 geo:asWKT ?shp1 ; <LS_NAME> ?name }
			
  		FILTER (geof:sfIntersects (?eng_as_region, ?shp1)) 
	  } ;
	  
-- Query 7
-- Uses http://docs.openlinksw.com/virtuoso/fn_st_xmin/

SPARQL

PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX ogcgsf: <http://www.opengis.net/def/function/geosparql/>
PREFIX bif: <http://www.openlinksw.com/schemas/bif#> 

SELECT ?s1 as ?href ?name bif:st_xmin(?shp1) AS ?longitude bif:st_ymin(?shp1) AS ?latitude
WHERE {
		GRAPH <file://natural_earth/10m_cultural/ne_10m_admin_0_boundary_lines_map_units.shp> 
		{ ?s <NAME> "Russia" ; geo:asWKT ?region . }
		GRAPH <file://natural_earth/10m_cultural/ne_10m_populated_places_simple.shp> 
		{ ?s1 geo:asWKT ?shp1 ; <LS_NAME> ?name }
	
		FILTER (geof:sfIntersects (?region, ?shp1)) 
  } ;
  
  
-- Query 8 
SPARQL

PREFIX lgv: <http://linkedgeodata.org/ontology/>

SELECT ?href ?name ?churchname ?cafename ?proximity ?latitude ?longitude 
WHERE {
	  SERVICE <http://lod.openlinksw.com/sparql> 
	       { 
			  SELECT DISTINCT ?cafe as ?href 
			                  ?cafename as ?name
			  			  	  ?church 
							  ?churchname 
							  ( bif:round ( bif:st_distance ( ?churchgeo, ?cafegeo ) ) ) as ?proximity 
			                  ?lat as ?latitude
			                  ?long as ?longitude
			   WHERE  { 
					      ?church a lgv:PlaceOfWorship .
					      ?church geo:geometry ?churchgeo .
					      ?church rdfs:label ?churchname .
					      ?cafe a lgv:Cafe .
					      ?cafe rdfs:label ?cafename .
					      ?cafe geo:geometry ?cafegeo .
					      ?cafe geo:lat ?lat .
					      ?cafe geo:long ?long .
					      FILTER ( bif:st_intersects ( ?churchgeo, bif:st_point ( 2.3498,48.853 ) ,5 ) 
					  			 && 
					  			 bif:st_intersects ( ?cafegeo, ?churchgeo, 0.9 ) 
					  		   ) 
	                   }
	       }  
    } ;
	
-- Query 9

SPARQL

PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX ogcgsf: <http://www.opengis.net/def/function/geosparql/>
PREFIX bif: <http://www.openlinksw.com/schemas/bif#> 

SELECT ?river_name GROUP_CONCAT (DISTINCT ?border_name, "; ") 
WHERE {
		 GRAPH <file://natural_earth/10m_physical/ne_10m_rivers_lake_centerlines.shp> 
		     { ?river <NAME> ?river_name } 
		 GRAPH <file://natural_earth/10m_cultural/ne_10m_admin_0_boundary_lines_map_units.shp> 
		     { ?border <NAME> ?border_name } 

		 FILTER (ogcgsf:sfCrosses (
									   (
											SELECT ?river_shp 
											WHERE { ?river ogcgs:asWKT ?river_shp }
									   ) ,
									   (
										   SELECT ?border_shp 
										   WHERE { ?border ogcgs:asWKT ?border_shp}) 
									   ) 
								   )
	} 
GROUP BY ?river_name 
HAVING(count(1) > 1) 
ORDER BY ?river_name  ;