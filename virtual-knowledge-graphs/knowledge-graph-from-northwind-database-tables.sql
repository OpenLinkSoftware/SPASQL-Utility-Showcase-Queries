-- Test SQL Tables

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
-- Clear Named Graphs

SPARQL CLEAR GRAPH <urn:demo:tables:r2rml:mappings> ;
SPARQL CLEAR GRAPH <urn:demo.openlinksw.com:tables:NorthwindQA> ;


-- Drop Existing Quad Maps

SPARQL DROP QUAD MAP <urn:demo:tables:r2rml:mappings> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/NorthwindQA/qm-VoidStatistics> ;


-- Load Mapping Descriptions into a Designated Named Graph (or Internal Virtuoso Document) identified by its IRI

SPARQL

PREFIX rr: <http://www.w3.org/ns/r2rml#> 
PREFIX Demo: <http://demo.openlinksw.com/schemas/NorthwindQA/> 
PREFIX demoqa-stat: <http://demo.openlinksw.com/NorthwindQA/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 

INSERT { 
			GRAPH <urn:demo:tables:r2rml:mappings> 
				{
					<#TriplesMapCategories> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Categories" ]; 
					rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindQA/categories/CategoryID={CategoryID}#this"; rr:class Demo:Categories; rr:graph <http://demo.openlinksw.com/NorthwindQA#> ];
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categoryid ] ; rr:objectMap [ rr:column "CategoryID" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categoryname ] ; rr:objectMap [ rr:column "CategoryName" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:description ] ; rr:objectMap [ rr:column "Description" ]; ] ;
					# rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:picture ] ; rr:objectMap [ rr:column "Picture" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:categories_of_products ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapProducts>;  rr:joinCondition [ rr:child "CategoryID" ; rr:parent "CategoryID" ] ; ]; ] .

					<#TriplesMapCustomers> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Customers" ]; 
					rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindQA/customers/CustomerID={CustomerID}#this"; rr:class Demo:Customers; rr:graph <http://demo.openlinksw.com/NorthwindQA#> ];
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

					<#TriplesMapEmployees> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Employees" ]; 
					rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindQA/employees/EmployeeID={EmployeeID}#this"; rr:class Demo:Employees; rr:graph <http://demo.openlinksw.com/NorthwindQA#> ];
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

					<#TriplesMapOrder_Details> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Order_Details" ]; 
					rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindQA/order_details/OrderID={OrderID}/ProductID={ProductID}#this"; rr:class Demo:Order_Details; rr:graph <http://demo.openlinksw.com/NorthwindQA#> ];
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitprice ] ; rr:objectMap [ rr:column "UnitPrice" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:quantity ] ; rr:objectMap [ rr:column "Quantity" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:discount ] ; rr:objectMap [ rr:column "Discount" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:order_details_has_orders ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindQA/orders/OrderID={OrderID}#this" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:order_details_has_products ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindQA/products/ProductID={ProductID}#this" ]; ] .

					<#TriplesMapOrders> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Orders" ]; 
					rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindQA/orders/OrderID={OrderID}#this"; rr:class Demo:Orders; rr:graph <http://demo.openlinksw.com/NorthwindQA#> ];
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
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_customers ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindQA/customers/CustomerID={CustomerID}#this" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_employees ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindQA/employees/EmployeeID={EmployeeID}#this" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_has_shippers ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindQA/shippers/ShipVia={ShipVia}#this" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:orders_of_order_details ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrder_Details>;  rr:joinCondition [ rr:child "OrderID" ; rr:parent "OrderID" ] ; ]; ] .

					<#TriplesMapProducts> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Products" ]; 
					rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindQA/products/ProductID={ProductID}#this"; rr:class Demo:Products; rr:graph <http://demo.openlinksw.com/NorthwindQA#> ];
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:productid ] ; rr:objectMap [ rr:column "ProductID" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:productname ] ; rr:objectMap [ rr:column "ProductName" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:quantityperunit ] ; rr:objectMap [ rr:column "QuantityPerUnit" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitprice ] ; rr:objectMap [ rr:column "UnitPrice" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitsinstock ] ; rr:objectMap [ rr:column "UnitsInStock" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:unitsonorder ] ; rr:objectMap [ rr:column "UnitsOnOrder" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:reorderlevel ] ; rr:objectMap [ rr:column "ReorderLevel" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:discontinued ] ; rr:objectMap [ rr:column "Discontinued" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_has_categories ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindQA/categories/CategoryID={CategoryID}#this" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_has_suppliers ] ; rr:objectMap [ rr:termType rr:IRI ; rr:template "http://demo.openlinksw.com/NorthwindQA/suppliers/SupplierID={SupplierID}#this" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:products_of_order_details ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrder_Details>;  rr:joinCondition [ rr:child "ProductID" ; rr:parent "ProductID" ] ; ]; ] .

					<#TriplesMapShippers> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Shippers" ]; 
					rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindQA/shippers/ShipperID={ShipperID}#this"; rr:class Demo:Shippers; rr:graph <http://demo.openlinksw.com/NorthwindQA#> ];
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shipperid ] ; rr:objectMap [ rr:column "ShipperID" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:companyname ] ; rr:objectMap [ rr:column "CompanyName" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:phone ] ; rr:objectMap [ rr:column "Phone" ]; ] ;
					rr:predicateObjectMap [ rr:predicateMap [ rr:constant Demo:shippers_of_orders ] ; rr:objectMap [ rr:parentTriplesMap <#TriplesMapOrders>;  rr:joinCondition [ rr:child "ShipperID" ; rr:parent "ShipVia" ] ; ]; ] .

					<#TriplesMapSuppliers> a rr:TriplesMap; rr:logicalTable [ rr:tableSchema "Demo" ; rr:tableOwner "demo" ; rr:tableName "Suppliers" ]; 
					rr:subjectMap [ rr:termType rr:IRI  ; rr:template "http://demo.openlinksw.com/NorthwindQA/suppliers/SupplierID={SupplierID}#this"; rr:class Demo:Suppliers; rr:graph <http://demo.openlinksw.com/NorthwindQA#> ];
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

-- Generate Quad Mappings from R2RML

EXEC ('SPARQL ' || DB.DBA.R2RML_MAKE_QM_FROM_G ('urn:demo:tables:r2rml:mappings'));

-- Virtual directories for instance data

DB.DBA.VHOST_REMOVE (
	 lhost=>'*ini*',
	 vhost=>'*ini*',
	 lpath=>'/NorthwindQA'
);

DB.DBA.VHOST_DEFINE (
	 lhost=>'*ini*',
	 vhost=>'*ini*',
	 lpath=>'/NorthwindQA',
	 ppath=>'/',
	 is_dav=>0,
	 is_brws=>0,
	 vsp_user=>'dba',
	 ses_vars=>0,
     opts=>vector ('url_rewrite', 'NorthwindQA_rule_list1'),
	 is_default_host=>0
);

DB.DBA.URLREWRITE_CREATE_RULELIST ( 'NorthwindQA_rule_list1', 1, vector ( 'NorthwindQA_rule1' ));

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ( 
  'NorthwindQA_rule1', 1,
  '([^#]*)',
  vector ('path'),
  1,
  '/describe/?url=http%%3A//^{URIQADefaultHost}^%U%%23this&graph=http%%3A//^{URIQADefaultHost}^/NorthwindQA%%23&distinct=0',
  vector ('path'),
  NULL,
  NULL,
  2,
  303,
  NULL
);

-- Test RDF generated Virtual RDF Views

SPARQL
SELECT SAMPLE(?s) AS ?sample COUNT(1) AS ?count ?o
FROM  <http://demo.openlinksw.com/NorthwindQA#> 
WHERE {?s a ?o}
GROUP BY ?o
ORDER BY DESC(?count)
LIMIT 50 ;

-- Test 2 (workaround for RDF Views using rr:query)

SPARQL

SELECT IRI(max(str(?s))) AS ?sample COUNT(1) AS ?count ?o
FROM  <http://demo.openlinksw.com/NorthwindQA#>
WHERE {?s a ?o}
GROUP BY ?o
ORDER BY DESC(?count)
LIMIT 50 ;

--- Test Sample Order 

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  *
FROM <http://demo.openlinksw.com/NorthwindQA#>
WHERE {
        ?s ?p ?o .
        FILTER ( ?s = <http://demo.openlinksw.com/NorthwindQA/orders/OrderID=10643#this> ) 
      } ;

-- Test Sample Supplier

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  *
FROM <http://demo.openlinksw.com/NorthwindQA#>
WHERE {
        ?s ?p ?o .
        FILTER ( ?s = <http://demo.openlinksw.com/NorthwindQA/suppliers/SupplierID=19#this> ) 
      } ;

-- Test Sample Customer 

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  *
FROM <http://demo.openlinksw.com/NorthwindQA#>
WHERE {
        ?s ?p ?o .
        FILTER ( ?s = <http://demo.openlinksw.com/NorthwindQA/customers/CustomerID=ALFKI#this> ) 
      } ;

-- Test Sample Employee

SPARQL
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT  *
FROM <http://demo.openlinksw.com/NorthwindQA#>
WHERE {
        ?s ?p ?o .
        FILTER ( ?s = <http://demo.openlinksw.com/NorthwindQA/employees/EmployeeID=3#this> ) 
      } ;


-- Sync Triples from Virtual RDF Views Graph to Physical RDF Views Graph

-- RDF_VIEW_SYNC_TO_PHYSICAL ('http://demo.openlinksw.com/NorthwindQA#', 1, 'urn:demo.openlinksw.com:tables:NorthwindQA');

-- Test Phyical RDF Views sync'd from Virtual RDF Views Graph

SPARQL
SELECT count(*)
FROM <urn:demo.openlinksw.com:tables:NorthwindQA> 
WHERE {?s ?p ?o} ;

SPARQL
SELECT count(*)
FROM <http://demo.openlinksw.com/NorthwindQA#> 
WHERE {?s ?p ?o} ;

SPARQL
SELECT SAMPLE(?s) AS ?sample COUNT(1) AS ?count ?o
FROM <urn:demo.openlinksw.com:tables:NorthwindQA> 
WHERE {?s a ?o}
GROUP BY ?o
ORDER BY DESC(?count)
LIMIT 50 ;
