CREATE PROCEDURE DB.DBA.EVCF_SCORE (in gr any, in s any, inout am any)
{
  DECLARE tm any;
  DECLARE evc int;

  evc := 0;
  tm := ( SPARQL SELECT sql:VECTOR_AGG(?o) 
    	WHERE { ?s foaf:knows ?o 
    		OPTION ( TRANSITIVE , T_DISTINCT , T_IN (?s) , T_OUT (?o) , T_MIN (1) , T_STEP ('step_no') AS ?dist ) 
		FILTER (?s = iri(?:s) ) 
	      } );

  foreach (any x in tm) do
    {
      DECLARE arr, cur_evc, v any;
      arr := dict_get (am, x);
      IF (arr IS NOT NULL )
	{
	  DECLARE pos int;
	  cur_evc := arr[0];
	  v := arr[1];
	  IF (0 <> (pos := position (s, v)))
	    {
	      evc := evc + cur_evc;
	    }
	}
    }
  RETURN evc;
}
;

CREATE PROCEDURE DB.DBA.EVC_SCORE (in gr any, in tgt any)
{
  DECLARE am, am_copy any;
  DECLARE evc int;
  DECLARE subj,v any;

  am := dict_new (31);
  FOR SELECT *  FROM (SPARQL SELECT ?s count(*) as ?cnt sql:vector_agg(?o) AS ?vec 
  		WHERE   { graph `iri(?:gr)` { ?s foaf:knows ?o } } GROUP BY ?s ORDER BY (?s)) x DO
    {
      dict_put (am, s, vector (cnt, vec));
    }
  am_copy := dict_duplicate (am);
  dict_iter_rewind (am);
  WHILE (dict_iter_next (am, subj, v))
    {
      evc := DB.DBA.EVCF_SCORE (gr, subj, am);
      v [0] := evc;
      dict_put (am_copy, subj, v);
    }
  dict_iter_rewind (am_copy);
  WHILE (dict_iter_next (am_copy, subj, v))
    {
      evc := DB.DBA.EVCF_SCORE (gr, subj, am_copy);
      v [0] := evc;
      dict_put (am, subj, v);
    }
  --dbg_obj_print (dict_to_vector (am, 0));
  --result_names (subj, evc);
  dict_iter_rewind (am);
  WHILE (dict_iter_next (am, subj, v))
    {
      IF (tgt = subj)
	RETURN v[0];
      --result (subj, v[0]);
    }
  RETURN 0;
}
;

-- Grant Execute to SPARQL

GRANT EXECUTE ON DB.DBA.evc_score TO "SPARQL_SELECT"

-- Eigen Vector Centrality (EVC) SPARQL Test Query 

SPARQL
 
SELECT ?s 
       sql:evc_score ('urn:evc', ?s) AS ?evc 
FROM <urn:evc> 
WHERE { ?s foaf:knows ?o } 
GROUP BY ?s 
ORDER BY DESC (?evc) ;

-- Eigen Vector Centrality (EVC) SPARQL Variant 

SPARQL

SELECT ?s sql:evc_score (?g, ?s) AS ?evc 
WHERE { 
        GRAPH ?g { ?s foaf:knows ?o } 
        FILTER (?g = <urn:evc> ) 
      } 
GROUP BY ?s 
ORDER BY DESC (?evc)
