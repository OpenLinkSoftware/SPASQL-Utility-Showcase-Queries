## This query performs a Sponger Crawl across the listed Solid Pods
## If an ACL is in place for restricting sponging this query should work i.e., if the 
## user isn't logged in.

DEFINE input:grab-all "yes"

SELECT DISTINCT  ?o2 as ?entity 
WHERE {
		 { <https://solid.turnguard.com:8440/public/> ldp:contains ?o.
	         OPTIONAL {?o owl:sameAs ?o2} .
		 }
	         UNION
		 { <https://kidehen3.solid.openlinksw.com:8445/public/> ldp:contains ?o.
         	OPTIONAL {?o owl:sameAs ?o2} .
	 	 }
		 	 UNION
		 { <https://kidehen3.solid.openlinksw.com:8444/public/> ldp:contains ?o.
      		OPTIONAL {?o owl:sameAs ?o2} .
 	 	 }
	         UNION
		 { <https://drive.verborgh.org/public/RWWCrewQA/> ldp:contains ?o.
      		OPTIONAL {?o owl:sameAs ?o2} .
 	 	 }
	         UNION
		 { <https://timbl.com/timbl/Public/Test/2018/RWWCrew%20only/> ldp:contains ?o.
      		OPTIONAL {?o owl:sameAs ?o2} .
 	 	 }
	         UNION
		 { <https://melvin.solid.live/public/RWWCrew/> ldp:contains ?o.
      		OPTIONAL {?o owl:sameAs ?o2} .
 	 	 }
  } ;
