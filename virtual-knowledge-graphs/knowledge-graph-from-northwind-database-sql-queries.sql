
-- Inspired by findings in the trend analysis doc at: https://insights.stackoverflow.com/trends?tags=sparql%2Ccypher%2Cgraphql%2Csql

-- Cleanup

-- Verify Queries work

--- Categories Relation
SELECT TOP 10 "CategoryID", "CategoryName", "Description", "Picture"
FROM "Demo"."demo"."categories" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."categories"') )
} ;

--- Customers Relation
SELECT TOP 10 "CustomerID", "CompanyName", "ContactName", "ContactTitle", "Address",
        "City", "Region", "PostalCode", "Country", "CountryCode", "Phone",
        "Fax"
FROM "Demo"."demo"."customers" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."customers"') )
} ;

--- Employees Relation 
SELECT TOP 10 "EmployeeID", "LastName", "FirstName", "Title", "TitleOfCourtesy",
        "HireDate", "BirthDate", "Address", "City", "Region", "PostalCode",
        "Country", "CountryCode", "HomePhone", "Extension", "Photo", "Notes",
        "ReportsTo"
FROM "Demo"."demo"."employees" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."employees"') )
} ;

--- Order Details Relation
SELECT TOP 10 "OrderID", "ProductID", "UnitPrice", "Quantity", "Discount"
FROM "Demo"."demo"."order_details" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."order_details"') )
} ;

--- Orders Relation 
SELECT TOP 10 "OrderID", "EmployeeID", "CustomerID", "ShipVia", "OrderDate", "RequiredDate", 
        "ShippedDate", "ShipAddress", "Freight", "ShipName", "ShipCity", "ShipRegion",
        "ShipPostalCode", "ShipCountry", "ShipCountryCode"
FROM "Demo"."demo"."orders" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."orders"') )
} ;

--- Products
SELECT TOP 10 "ProductID", "CategoryID", "SupplierID", "ProductName", "QuantityPerUnit",
        "UnitPrice", "UnitsInStock", "UnitsOnOrder","ReorderLevel", "Discontinued"
FROM "Demo"."demo"."products" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."products"') )
} ;

--- Provinces
SELECT TOP 10 "Province", "CountryCode"
FROM "Demo"."demo"."provinces" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."provinces"') )
} ;

--- Shippers
SELECT TOP 10 "ShipperID", "CompanyName", "Phone"
FROM "Demo"."demo"."shippers" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."shippers"') )
} ;

--- Suppliers
SELECT TOP 10 "SupplierID", "CompanyName", "ContactName", "ContactTitle",
        "Address", "City", "Region","PostalCode", "Country", "CountryCode",
        "Phone", "Fax", "HomePage"
FROM "Demo"."demo"."suppliers" ;

---- Check Existing Quad Maps
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."suppliers"') )
} ;

-- Cleanup 

-- R2RML Mappings 
SPARQL 
CLEAR GRAPH <urn:northwind:demo:sql:r2rml:mappings> ;

-- Quad Map

SPARQL
DROP QUAD MAP <urn:northwind:demo:sql:r2rml:mappings> ;

-- Named Graph associated with Quad Map

SPARQL
CLEAR GRAPH <urn:demo.openlinksw.com:NorthwindDemo> ;


SPARQL

PREFIX rr: <http://www.w3.org/ns/r2rml#> 
PREFIX Demo: <http://demo.openlinksw.com/schemas/NorthwindDemo/> 
PREFIX demo-stat: <http://demo.openlinksw.com/NorthwindDemo/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 

INSERT { 
            GRAPH <urn:northwind:demo:sql:r2rml:mappings> 
              {

				<#TriplesMapCategories> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "CategoryID", "CategoryName", "Description", "Picture"
																						  FROM "Demo"."demo"."categories" 
													  							   """ ]; 
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/categories/CategoryID={CategoryID}#this"; rr:class Demo:Categories; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categoryid ] ; rr:objectMap [ rr:column "CategoryID" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categoryname ] ; rr:objectMap [ rr:column "CategoryName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:description ] ; rr:objectMap [ rr:column "Description" ]; ] ;
				# rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:picture ] ; rr:objectMap [ rr:column "Picture" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categories_of_products ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapProducts>;  rr:joinCondition [ rr:child "CategoryID" ; rr:parent "CategoryID" ] ; ]; ] .

				<#TriplesMapCountries> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "Name", "Code", "Lat", "Lng",
																						  		 "SmallFlagDAVResourceName", "LargeFlagDAVResourceName",
																								 "SmallFlagDAVResourceURI", "LargeFlagDAVResourceURI"
																						  FROM "Demo"."demo"."countries" 
													  							   """ ];  
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/countries/Name={Name}#this"; rr:class Demo:Countries; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:name ] ; rr:objectMap [ rr:column "Name" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:code ] ; rr:objectMap [ rr:column "Code" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:smallflagdavresourcename ] ; rr:objectMap [ rr:column "SmallFlagDAVResourceName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:largeflagdavresourcename ] ; rr:objectMap [ rr:column "LargeFlagDAVResourceName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:smallflagdavresourceuri ] ; rr:objectMap [ rr:column "SmallFlagDAVResourceURI" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:largeflagdavresourceuri ] ; rr:objectMap [ rr:column "LargeFlagDAVResourceURI" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:lat ] ; rr:objectMap [ rr:column "Lat" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:lng ] ; rr:objectMap [ rr:column "Lng" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:countries_of_provinces ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapProvinces>;  rr:joinCondition [ rr:child "Code" ; rr:parent "CountryCode" ] ; ]; ] .

				<#TriplesMapCustomers> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "CustomerID", "CompanyName", "ContactName", "ContactTitle", "Address",
																						  		 "City", "Region", "PostalCode", "Country", "CountryCode", "Phone",
																								 "Fax"
																						  FROM "Demo"."demo"."customers" 
													  							   """ ];
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/customers/CustomerID={CustomerID}#this"; rr:class Demo:Customers, foaf:Agent, foaf:Organization ; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:customerid ] ; rr:objectMap [ rr:column "CustomerID" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:companyname ] ; rr:objectMap [ rr:column "CompanyName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:contactname ] ; rr:objectMap [ rr:column "ContactName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:contacttitle ] ; rr:objectMap [ rr:column "ContactTitle" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:address ] ; rr:objectMap [ rr:column "Address" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:city ] ; rr:objectMap [ rr:column "City" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:region ] ; rr:objectMap [ rr:column "Region" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:postalcode ] ; rr:objectMap [ rr:column "PostalCode" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:country ] ; rr:objectMap [ rr:column "Country" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:countrycode ] ; rr:objectMap [ rr:column "CountryCode" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:phone ] ; rr:objectMap [ rr:column "Phone" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:fax ] ; rr:objectMap [ rr:column "Fax" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:customers_of_orders ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrders>;  rr:joinCondition [ rr:child "CustomerID" ; rr:parent "CustomerID" ] ; ]; ] .

				<#TriplesMapEmployees> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "EmployeeID", "LastName", "FirstName", "Title", "TitleOfCourtesy",
																						  		 "HireDate", "BirthDate", "Address", "City", "Region", "PostalCode",
																								 "Country", "CountryCode", "HomePhone", "Extension", "Photo", "Notes",
																								 "ReportsTo"
																						  FROM "Demo"."demo"."employees" 
													  							   """ ]; 
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/employees/EmployeeID={EmployeeID}#this"; rr:class Demo:Employees, foaf:Agent, foaf:Person ; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:employeeid ] ; rr:objectMap [ rr:column "EmployeeID" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:lastname ] ; rr:objectMap [ rr:column "LastName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:firstname ] ; rr:objectMap [ rr:column "FirstName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:title ] ; rr:objectMap [ rr:column "Title" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:titleofcourtesy ] ; rr:objectMap [ rr:column "TitleOfCourtesy" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:birthdate ] ; rr:objectMap [ rr:column "BirthDate" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:hiredate ] ; rr:objectMap [ rr:column "HireDate" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:address ] ; rr:objectMap [ rr:column "Address" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:city ] ; rr:objectMap [ rr:column "City" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:region ] ; rr:objectMap [ rr:column "Region" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:postalcode ] ; rr:objectMap [ rr:column "PostalCode" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:country ] ; rr:objectMap [ rr:column "Country" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:countrycode ] ; rr:objectMap [ rr:column "CountryCode" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:homephone ] ; rr:objectMap [ rr:column "HomePhone" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:extension ] ; rr:objectMap [ rr:column "Extension" ]; ] ;
				# rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:photo ] ; rr:objectMap [ rr:column "Photo" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:notes ] ; rr:objectMap [ rr:column "Notes" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:reportsto ] ; rr:objectMap [ rr:column "ReportsTo" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:employees_of_orders ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrders>;  rr:joinCondition [ rr:child "EmployeeID" ; rr:parent "EmployeeID" ] ; ]; ] .

				<#TriplesMapOrder_Details> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "OrderID", "ProductID", "UnitPrice", "Quantity", "Discount"
																						  FROM "Demo"."demo"."order_details" 
													  							   """ ]; 
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/order_details/OrderID={OrderID}/ProductID={ProductID}#this"; rr:class Demo:Order_Details; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitprice ] ; rr:objectMap [ rr:column "UnitPrice" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:quantity ] ; rr:objectMap [ rr:column "Quantity" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:discount ] ; rr:objectMap [ rr:column "Discount" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:order_details_has_orders ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindDemo/orders/OrderID={OrderID}#this" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:order_details_has_products ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindDemo/products/ProductID={ProductID}#this" ]; ] .

				<#TriplesMapOrders> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "OrderID", "EmployeeID", "CustomerID", "ShipVia", "OrderDate", "RequiredDate", 
																						  		 "ShippedDate", "ShipAddress", "Freight", "ShipName", "ShipCity", "ShipRegion",
																								 "ShipPostalCode", "ShipCountry", "ShipCountryCode"
																						  FROM "Demo"."demo"."orders" 
													  							   """ ]; 
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/orders/OrderID={OrderID}#this"; rr:class Demo:Orders; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orderid ] ; rr:objectMap [ rr:column "OrderID" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orderdate ] ; rr:objectMap [ rr:column "OrderDate" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:requireddate ] ; rr:objectMap [ rr:column "RequiredDate" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shippeddate ] ; rr:objectMap [ rr:column "ShippedDate" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:freight ] ; rr:objectMap [ rr:column "Freight" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipname ] ; rr:objectMap [ rr:column "ShipName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipaddress ] ; rr:objectMap [ rr:column "ShipAddress" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipcity ] ; rr:objectMap [ rr:column "ShipCity" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipregion ] ; rr:objectMap [ rr:column "ShipRegion" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shippostalcode ] ; rr:objectMap [ rr:column "ShipPostalCode" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipcountry ] ; rr:objectMap [ rr:column "ShipCountry" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipcountrycode ] ; rr:objectMap [ rr:column "ShipCountryCode" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_customers ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindDemo/customers/CustomerID={CustomerID}#this" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_employees ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindDemo/employees/EmployeeID={EmployeeID}#this" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_shippers ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindDemo/shippers/ShipVia={ShipVia}#this" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_of_order_details ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrder_Details>;  rr:joinCondition [ rr:child "OrderID" ; rr:parent "OrderID" ] ; ]; ] .

				<#TriplesMapProducts> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "ProductID", "CategoryID", "SupplierID", "ProductName", "QuantityPerUnit",
																						  	     "UnitPrice", "UnitsInStock", "UnitsOnOrder","ReorderLevel", "Discontinued"
																						  FROM "Demo"."demo"."products" 
													  							   """ ];  
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/products/ProductID={ProductID}#this"; rr:class Demo:Products; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:productid ] ; rr:objectMap [ rr:column "ProductID" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:productname ] ; rr:objectMap [ rr:column "ProductName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:quantityperunit ] ; rr:objectMap [ rr:column "QuantityPerUnit" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitprice ] ; rr:objectMap [ rr:column "UnitPrice" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitsinstock ] ; rr:objectMap [ rr:column "UnitsInStock" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitsonorder ] ; rr:objectMap [ rr:column "UnitsOnOrder" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:reorderlevel ] ; rr:objectMap [ rr:column "ReorderLevel" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:discontinued ] ; rr:objectMap [ rr:column "Discontinued" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_has_categories ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindDemo/categories/CategoryID={CategoryID}#this" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_has_suppliers ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindDemo/suppliers/SupplierID={SupplierID}#this" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_of_order_details ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrder_Details>;  rr:joinCondition [ rr:child "ProductID" ; rr:parent "ProductID" ] ; ]; ] .

				<#TriplesMapProvinces> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "Province", "CountryCode"
																						  FROM "Demo"."demo"."provinces" 
													  							   """ ];  
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/provinces/CountryCode={CountryCode}/Province={Province}#this"; rr:class Demo:Provinces; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:province ] ; rr:objectMap [ rr:column "Province" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:provinces_has_countries ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindDemo/countries/CountryCode={CountryCode}#this" ]; ] .

				<#TriplesMapShippers> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "ShipperID", "CompanyName", "Phone"
																						  FROM "Demo"."demo"."shippers" 
													  							   """ ]; 
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/shippers/ShipperID={ShipperID}#this"; rr:class Demo:Shippers, foaf:Agent, foaf:Organization ; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipperid ] ; rr:objectMap [ rr:column "ShipperID" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:companyname ] ; rr:objectMap [ rr:column "CompanyName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:phone ] ; rr:objectMap [ rr:column "Phone" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shippers_of_orders ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrders>;  rr:joinCondition [ rr:child "ShipperID" ; rr:parent "ShipVia" ] ; ]; ] .

				<#TriplesMapSuppliers> a rr:TriplesMap; rr:logicalTable [ rr:sqlQuery """
																						  SELECT "SupplierID", "CompanyName", "ContactName", "ContactTitle",
																						  	     "Address", "City", "Region","PostalCode", "Country", "CountryCode",
																								 "Phone", "Fax", "HomePage"
																						  FROM "Demo"."demo"."suppliers" 
													  							   """ ];  
				rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindDemo/suppliers/SupplierID={SupplierID}#this"; rr:class Demo:Suppliers, foaf:Agent, foaf:Organization ; rr:graph <http://demo.openlinksw.com/NorthwindDemo#> ];
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:supplierid ] ; rr:objectMap [ rr:column "SupplierID" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:companyname ] ; rr:objectMap [ rr:column "CompanyName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:contactname ] ; rr:objectMap [ rr:column "ContactName" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:contacttitle ] ; rr:objectMap [ rr:column "ContactTitle" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:address ] ; rr:objectMap [ rr:column "Address" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:city ] ; rr:objectMap [ rr:column "City" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:region ] ; rr:objectMap [ rr:column "Region" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:postalcode ] ; rr:objectMap [ rr:column "PostalCode" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:country ] ; rr:objectMap [ rr:column "Country" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:countrycode ] ; rr:objectMap [ rr:column "CountryCode" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:phone ] ; rr:objectMap [ rr:column "Phone" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:fax ] ; rr:objectMap [ rr:column "Fax" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:homepage ] ; rr:objectMap [ rr:column "HomePage" ]; ] ;
				rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:suppliers_of_products ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapProducts>;  rr:joinCondition [ rr:child "SupplierID" ; rr:parent "SupplierID" ] ; ]; ] .

            }
} ;

-- Generate & Execute Virtual RDF Views Script, hence the use of EXEC()

EXEC ('SPARQL ' || DB.DBA.R2RML_MAKE_QM_FROM_G ('urn:northwind:demo:sql:r2rml:mappings')) ;



-- Test RDF generated Virtual RDF Views


---- Check New Categories Quad Map
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."categories"') )
} ;


---- Check New Customers Quad Map
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."customers"') )
} ;

---- Check New Employess Quad Map
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."employees"') )
} ;


---- Check New Order_Details Quad Map

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."order_details"') )
} ;


---- Check New Orders Quad Map

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."orders"') )
} ;

---- Check New Products Quad Map
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."products"') )
} ;


---- Check New Provinces Quad Map
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."provinces"') )
} ;


---- Check New Shippers Quad Map
SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."shippers"') )
} ;


---- Check New Suppliers Quad Map

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT DISTINCT  ?s2 AS ?sqlTable 
                 ?s1 AS ?rdfQuadMap
                 ?s6 AS ?rdfSubjectURITemplate
                 ?s3 AS ?rdfPredicate 
                 ?s10 AS ?rdfObjectValue
                 ?s8 AS ?rdfObjectDataType
WHERE 
 {
   ?s1  a virtrdf:QuadMap .
   ?s1  virtrdf:qmTableName ?s2 .
   ?s1  virtrdf:qmPredicateRange-rvrFixedValue ?s3 . 
   ?s1  virtrdf:qmSubjectMap ?s4 .
   ?s4  virtrdf:qmvFormat ?s5 .
   ?s5  virtrdf:qmfCustomString1 ?s6 .
   ?s1  virtrdf:qmObjectMap ?s7 .
   ?s7  virtrdf:qmvFormat ?s8 .
   ?s7  virtrdf:qmvColumns ?s9 .
   ?s9  rdf:_1 ?s10          
   FILTER (CONTAINS(STR(?s2),'sqlquery') AND CONTAINS(STR(?s2),'FROM "Demo"."demo"."suppliers"') )
} ;

 -- Super Key Test re SPASQLQB
 -- Currently returns empty solution

SPARQL
SELECT DISTINCT ?Classes ?o
WHERE {
        ?s virtrdf:qmTableName ?o; 
           virtrdf:qmPredicateRange-rvrFixedValue ?ref.
        ?ref <http://www.w3.org/2000/01/rdf-schema#domain> ?Classes . 
        FILTER ((str(?o) = '"cs"."etl"."test"')) 
        FILTER (?Classes != <http://www.w3.org/2000/01/rdf-schema#Resource> )
      }  
LIMIT 100 ;

-- Super Key Test re SPASQLQB Alternative

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  ?s1 as ?rdfQuadMap
                 ?s2 as ?sparqlGraph
                 ?s3 as ?sqlDataSource
                 ?s4 as ?entityType
                
WHERE 
 {
   ?s1  a virtrdf:QuadMap ;
        virtrdf:qmGraphRange-rvrFixedValue ?s2 ;
        virtrdf:qmTableName ?s3 ;
        virtrdf:qmObjectRange-rvrFixedValue ?s4 . 

   FILTER ( ?s2 = <http://demo.openlinksw.com/NorthwindDemo#> )

} ;

-- Virtual directories for instance data

DB.DBA.VHOST_REMOVE (
	 lhost=>'*ini*',
	 vhost=>'*ini*',
	 lpath=>'/NorthwindDemo'
);

DB.DBA.VHOST_DEFINE (
	 lhost=>'*ini*',
	 vhost=>'*ini*',
	 lpath=>'/NorthwindDemo',
	 ppath=>'/',
	 is_dav=>0,
	 is_brws=>0,
	 vsp_user=>'dba',
	 ses_vars=>0,
     opts=>vector ('url_rewrite', 'NorthwindDemo_rule_list1'),
	 is_default_host=>0
);

DB.DBA.URLREWRITE_CREATE_RULELIST ( 'NorthwindDemo_rule_list1', 1, vector ( 'NorthwindDemo_rule1' ));

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ( 
  'NorthwindDemo_rule1', 1,
  '([^#]*)',
  vector ('path'),
  1,
  '/describe/?url=http%%3A//^{URIQADefaultHost}^%U%%23this&graph=http%%3A//^{URIQADefaultHost}^/NorthwindDemo%%23&distinct=0',
  vector ('path'),
  NULL,
  NULL,
  2,
  303,
  NULL
);

-- Test Queries against Quad Maps

--- Test 1

SPARQL
SELECT SAMPLE(?s) AS ?sample COUNT(1) AS ?count ?o
FROM <http://demo.openlinksw.com/NorthwindDemo#> 
WHERE {?s a ?o}
GROUP BY ?o
ORDER BY DESC(?count)
LIMIT 50 ;

--- Test 2 (workaround)

SPARQL
SELECT ?o IRI(max(str(?s))) AS ?sample COUNT(1) AS ?count
FROM <http://demo.openlinksw.com/NorthwindDemo#> 
WHERE {?s a ?o}
GROUP BY ?o
ORDER BY DESC(?count)
LIMIT 50 ;

--- Test 3
--- NOTE: FCT needs the virtual graph scope to be enabled in regards to entity description visibility

SPARQL
SELECT (SAMPLE(?s) AS ?sample) (count(*) AS ?count) (?o AS ?type)
FROM <http://demo.openlinksw.com/NorthwindDemo#>
WHERE {?s a ?o}
GROUP BY ?o ;

--- Test Sample Order 

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  *
FROM <http://demo.openlinksw.com/NorthwindDemo#>
WHERE {
        ?s ?p ?o .
        FILTER ( ?s = <http://demo.openlinksw.com/NorthwindDemo/orders/OrderID=10643#this> ) 
      } ;

-- Test Sample Supplier

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  *
FROM <http://demo.openlinksw.com/NorthwindDemo#>
WHERE {
        ?s ?p ?o .
        FILTER ( ?s = <http://demo.openlinksw.com/NorthwindDemo/suppliers/SupplierID=19#this> ) 
      } ;

-- Test Sample Customer 

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  *
FROM <http://demo.openlinksw.com/NorthwindDemo#>
WHERE {
        ?s ?p ?o .
        FILTER ( ?s = <http://demo.openlinksw.com/NorthwindDemo/customers/CustomerID=ALFKI#this> ) 
      } ;

-- Test Sample Employee

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  *
FROM <http://demo.openlinksw.com/NorthwindDemo#>
WHERE {
        ?s ?p ?o .
        FILTER ( ?s = <http://demo.openlinksw.com/NorthwindDemo/employees/EmployeeID=3#this> ) 
      } 
