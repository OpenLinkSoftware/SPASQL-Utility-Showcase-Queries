CREATE PROCEDURE DB.DBA.EVCF (in gr any, in s any, inout am any)
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
      IF (arr is not null)
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

CREATE PROCEDURE DB.DBA.EVCC (in gr any)
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
  dbg_obj_print (dict_to_vector (am, 0));
  am_copy := dict_duplicate (am);
  dict_iter_rewind (am);
  while (dict_iter_next (am, subj, v))
    {
      evc := DB.DBA.EVCF (__i2id(gr), subj, am);
      v [0] := evc;
      dict_put (am_copy, subj, v);
    }
  dict_iter_rewind (am_copy);
  while (dict_iter_next (am_copy, subj, v))
    {
      evc := DB.DBA.EVCF (__i2id(gr), subj, am_copy);
      v [0] := evc;
      dict_put (am, subj, v);
    }
  --dbg_obj_print (dict_to_vector (am, 0));
  result_names (subj, evc);
  dict_iter_rewind (am);
  while (dict_iter_next (am, subj, v))
    {
      result (subj, v[0]);
    }
}
;

-- EVC 

SELECT *
FROM DB.DBA.evcc (gr) (subj
varchar, evc int) x  
WHERE gr = 'urn:evc' 
ORDER BY evc DESC, subj ASC ;
