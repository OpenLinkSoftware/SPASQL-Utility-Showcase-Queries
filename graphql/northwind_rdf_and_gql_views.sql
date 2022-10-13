-- LOG_ENABLE(2,1) ;

-- Cleanup
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-customers> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-employees> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-categories> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-orders> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-order_details> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-products> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-shippers> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-suppliers> ;
SPARQL DROP QUAD MAP <http://demo.openlinksw.com/schemas/northwind/qm-VoidStatistics> ;

-- Quad Mappings for genreating RDF Views
grant select on "Demo"."demo"."Categories" to SPARQL_SELECT;
grant select on "Demo"."demo"."Customers" to SPARQL_SELECT;
grant select on "Demo"."demo"."Employees" to SPARQL_SELECT;
grant select on "Demo"."demo"."Order_Details" to SPARQL_SELECT;
grant select on "Demo"."demo"."Orders" to SPARQL_SELECT;
grant select on "Demo"."demo"."Products" to SPARQL_SELECT;
grant select on "Demo"."demo"."Shippers" to SPARQL_SELECT;
grant select on "Demo"."demo"."Suppliers" to SPARQL_SELECT;


SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:categories "http://^{URIQADefaultHost}^/northwind/categories/CategoryID/%d#this" (in _CategoryID integer not null) . ;
SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:customers "http://^{URIQADefaultHost}^/northwind/customers/CustomerID/%U#this" (in _CustomerID varchar not null) . ;
SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:employees "http://^{URIQADefaultHost}^/northwind/employees/EmployeeID/%d#this" (in _EmployeeID integer not null) . ;
SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:employees_photo "http://^{URIQADefaultHost}^/northwind/objects/employees/EmployeeID/%d/Photo.bin" (in _EmployeeID integer not null) . ;
SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:order_details "http://^{URIQADefaultHost}^/northwind/order_details/OrderID/%d/ProductID/%d#this" (in _OrderID integer not null,in _ProductID integer not null) . ;
SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:orders "http://^{URIQADefaultHost}^/northwind/orders/OrderID/%d#this" (in _OrderID integer not null) . ;
SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:products "http://^{URIQADefaultHost}^/northwind/products/ProductID/%d#this" (in _ProductID integer not null) . ;
SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:shippers "http://^{URIQADefaultHost}^/northwind/shippers/ShipperID/%d#this" (in _ShipperID integer not null) . ;
SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
CREATE iri class northwind:suppliers "http://^{URIQADefaultHost}^/northwind/suppliers/SupplierID/%d#this" (in _SupplierID integer not null) . ;


drop view "Demo"."demo"."northwind__Total"; 
CREATE view "Demo"."demo"."northwind__Total" AS select (cnt0*cnt1)+(cnt2*cnt3)+(cnt4*cnt5)+(cnt6*cnt7)+(cnt8*cnt9)+(cnt10*cnt11)+(cnt12*cnt13)+(cnt14*cnt15) AS cnt FROM 
 (select count(*) cnt0 FROM "Demo"."demo"."Categories") tb0, 
 (select count(*)+1 AS cnt1 FROM DB.DBA.TABLE_COLS WHERE "TABLE" = 'Demo.demo.Categories'  and "COLUMN" <> '_IDN') tb1,
 (select count(*) cnt2 FROM "Demo"."demo"."Customers") tb2, 
 (select count(*)+1 AS cnt3 FROM DB.DBA.TABLE_COLS WHERE "TABLE" = 'Demo.demo.Customers'  and "COLUMN" <> '_IDN') tb3,
 (select count(*) cnt4 FROM "Demo"."demo"."Employees") tb4, 
 (select count(*)+1 AS cnt5 FROM DB.DBA.TABLE_COLS WHERE "TABLE" = 'Demo.demo.Employees'  and "COLUMN" <> '_IDN') tb5,
 (select count(*) cnt6 FROM "Demo"."demo"."Order_Details") tb6, 
 (select count(*)+1 AS cnt7 FROM DB.DBA.TABLE_COLS WHERE "TABLE" = 'Demo.demo.Order_Details'  and "COLUMN" <> '_IDN') tb7,
 (select count(*) cnt8 FROM "Demo"."demo"."Orders") tb8, 
 (select count(*)+1 AS cnt9 FROM DB.DBA.TABLE_COLS WHERE "TABLE" = 'Demo.demo.Orders'  and "COLUMN" <> '_IDN') tb9,
 (select count(*) cnt10 FROM "Demo"."demo"."Products") tb10, 
 (select count(*)+1 AS cnt11 FROM DB.DBA.TABLE_COLS WHERE "TABLE" = 'Demo.demo.Products'  and "COLUMN" <> '_IDN') tb11,
 (select count(*) cnt12 FROM "Demo"."demo"."Shippers") tb12, 
 (select count(*)+1 AS cnt13 FROM DB.DBA.TABLE_COLS WHERE "TABLE" = 'Demo.demo.Shippers'  and "COLUMN" <> '_IDN') tb13,
 (select count(*) cnt14 FROM "Demo"."demo"."Suppliers") tb14, 
 (select count(*)+1 AS cnt15 FROM DB.DBA.TABLE_COLS WHERE "TABLE" = 'Demo.demo.Suppliers'  and "COLUMN" <> '_IDN') tb15
; 
grant select on "Demo"."demo"."northwind__Total" to SPARQL_SELECT; 


SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."Categories" AS categories_s
 FROM "Demo"."demo"."Products" AS products_s
 WHERE (^{products_s.}^."CategoryID" = ^{categories_s.}^."CategoryID") 
 { 
   CREATE northwind:qm-categories AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#")  
    { 
      # Maps FROM columns of "Demo.demo.Categories"
      northwind:categories (categories_s."CategoryID")  a northwind:Categories ;
      northwind:categoryid categories_s."CategoryID" AS northwind:demo-categories-categoryid ;
      northwind:categoryname categories_s."CategoryName" AS northwind:demo-categories-categoryname ;
      northwind:description categories_s."Description" AS northwind:demo-categories-description ;
      # Maps FROM foreign-key relations of "Demo.demo.Categories"
      northwind:categories_of northwind:products (products_s."ProductID")  AS northwind:categories_products_of .

    }
 }

;

SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."Customers" AS customers_s
 FROM "Demo"."demo"."Orders" AS orders_s
 WHERE (^{orders_s.}^."CustomerID" = ^{customers_s.}^."CustomerID") 
 { 
   CREATE northwind:qm-customers AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#")  
    { 
      # Maps FROM columns of "Demo.demo.Customers"
      northwind:customers (customers_s."CustomerID")  a northwind:Customers ;
      northwind:customerid customers_s."CustomerID" AS northwind:demo-customers-customerid ;
      northwind:companyname customers_s."CompanyName" AS northwind:demo-customers-companyname ;
      northwind:contactname customers_s."ContactName" AS northwind:demo-customers-contactname ;
      northwind:contacttitle customers_s."ContactTitle" AS northwind:demo-customers-contacttitle ;
      northwind:address customers_s."Address" AS northwind:demo-customers-address ;
      northwind:city customers_s."City" AS northwind:demo-customers-city ;
      northwind:region customers_s."Region" AS northwind:demo-customers-region ;
      northwind:postalcode customers_s."PostalCode" AS northwind:demo-customers-postalcode ;
      northwind:country customers_s."Country" AS northwind:demo-customers-country ;
      northwind:countrycode customers_s."CountryCode" AS northwind:demo-customers-countrycode ;
      northwind:phone customers_s."Phone" AS northwind:demo-customers-phone ;
      northwind:fax customers_s."Fax" AS northwind:demo-customers-fax ;
      # Maps FROM foreign-key relations of "Demo.demo.Customers"
      northwind:customers_of northwind:orders (orders_s."OrderID")  AS northwind:customers_orders_of .

    }
 }

;

SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."Employees" AS employees_s
 FROM "Demo"."demo"."Orders" AS orders_s
 WHERE (^{orders_s.}^."EmployeeID" = ^{employees_s.}^."EmployeeID") 
 { 
   CREATE northwind:qm-employees AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#")  
    { 
      # Maps FROM columns of "Demo.demo.Employees"
      northwind:employees (employees_s."EmployeeID")  a northwind:Employees ;
      northwind:employeeid employees_s."EmployeeID" AS northwind:demo-employees-employeeid ;
      northwind:lastname employees_s."LastName" AS northwind:demo-employees-lastname ;
      northwind:firstname employees_s."FirstName" AS northwind:demo-employees-firstname ;
      northwind:title employees_s."Title" AS northwind:demo-employees-title ;
      northwind:titleofcourtesy employees_s."TitleOfCourtesy" AS northwind:demo-employees-titleofcourtesy ;
      northwind:birthdate employees_s."BirthDate" AS northwind:demo-employees-birthdate ;
      northwind:hiredate employees_s."HireDate" AS northwind:demo-employees-hiredate ;
      northwind:address employees_s."Address" AS northwind:demo-employees-address ;
      northwind:city employees_s."City" AS northwind:demo-employees-city ;
      northwind:region employees_s."Region" AS northwind:demo-employees-region ;
      northwind:postalcode employees_s."PostalCode" AS northwind:demo-employees-postalcode ;
      northwind:country employees_s."Country" AS northwind:demo-employees-country ;
      northwind:countrycode employees_s."CountryCode" AS northwind:demo-employees-countrycode ;
      northwind:homephone employees_s."HomePhone" AS northwind:demo-employees-homephone ;
      northwind:extension employees_s."Extension" AS northwind:demo-employees-extension ;
      northwind:photo northwind:employees_photo (employees_s."EmployeeID")  AS northwind:demo-employees-photo ;
      northwind:notes employees_s."Notes" AS northwind:demo-employees-notes ;
      northwind:reportsto employees_s."ReportsTo" AS northwind:demo-employees-reportsto ;
      # Maps FROM foreign-key relations of "Demo.demo.Employees"
      northwind:employees_of northwind:orders (orders_s."OrderID")  AS northwind:employees_orders_of .
      northwind:employees_photo (employees_s."EmployeeID")  a aowl:Content ; aowl:body employees_s."Photo" AS northwind:demo-employees-photo-content ; aowl:type "application/octet-stream" .

    }
 }

;

SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."Order_Details" AS order_details_s
 FROM "Demo"."demo"."Orders" AS orders_s
 WHERE (^{order_details_s.}^."OrderID" = ^{orders_s.}^."OrderID") 
 FROM "Demo"."demo"."Products" AS products_s
 WHERE (^{order_details_s.}^."ProductID" = ^{products_s.}^."ProductID") 
 { 
   CREATE northwind:qm-order_details AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#")  
    { 
      # Maps FROM columns of "Demo.demo.Order_Details"
      northwind:order_details (order_details_s."OrderID",order_details_s."ProductID")  a northwind:Order_Details ;
      northwind:orderid order_details_s."OrderID" AS northwind:demo-order_details-orderid ;
      northwind:productid order_details_s."ProductID" AS northwind:demo-order_details-productid ;
      northwind:unitprice order_details_s."UnitPrice" AS northwind:demo-order_details-unitprice ;
      northwind:quantity order_details_s."Quantity" AS northwind:demo-order_details-quantity ;
      northwind:discount order_details_s."Discount" AS northwind:demo-order_details-discount ;
      # Maps FROM foreign-key relations of "Demo.demo.Order_Details"
      northwind:has_orders northwind:orders (orders_s."OrderID")  AS northwind:order_details_has_orders ;
      northwind:has_products northwind:products (products_s."ProductID")  AS northwind:order_details_has_products .

    }
 }

;

SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."Orders" AS orders_s
 FROM "Demo"."demo"."Order_Details" AS order_details_s
 WHERE (^{order_details_s.}^."OrderID" = ^{orders_s.}^."OrderID") 
 FROM "Demo"."demo"."Customers" AS customers_s
 WHERE (^{orders_s.}^."CustomerID" = ^{customers_s.}^."CustomerID") 
 FROM "Demo"."demo"."Employees" AS employees_s
 WHERE (^{orders_s.}^."EmployeeID" = ^{employees_s.}^."EmployeeID") 
 FROM "Demo"."demo"."Shippers" AS shippers_s
 WHERE (^{orders_s.}^."ShipVia" = ^{shippers_s.}^."ShipperID") 
 { 
   CREATE northwind:qm-orders AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#")  
    { 
      # Maps FROM columns of "Demo.demo.Orders"
      northwind:orders (orders_s."OrderID")  a northwind:Orders ;
      northwind:orderid orders_s."OrderID" AS northwind:demo-orders-orderid ;
      northwind:customerid orders_s."CustomerID" AS northwind:demo-orders-customerid ;
      northwind:employeeid orders_s."EmployeeID" AS northwind:demo-orders-employeeid ;
      northwind:orderdate orders_s."OrderDate" AS northwind:demo-orders-orderdate ;
      northwind:requireddate orders_s."RequiredDate" AS northwind:demo-orders-requireddate ;
      northwind:shippeddate orders_s."ShippedDate" AS northwind:demo-orders-shippeddate ;
      northwind:shipvia orders_s."ShipVia" AS northwind:demo-orders-shipvia ;
      northwind:freight orders_s."Freight" AS northwind:demo-orders-freight ;
      northwind:shipname orders_s."ShipName" AS northwind:demo-orders-shipname ;
      northwind:shipaddress orders_s."ShipAddress" AS northwind:demo-orders-shipaddress ;
      northwind:shipcity orders_s."ShipCity" AS northwind:demo-orders-shipcity ;
      northwind:shipregion orders_s."ShipRegion" AS northwind:demo-orders-shipregion ;
      northwind:shippostalcode orders_s."ShipPostalCode" AS northwind:demo-orders-shippostalcode ;
      northwind:shipcountry orders_s."ShipCountry" AS northwind:demo-orders-shipcountry ;
      northwind:shipcountrycode orders_s."ShipCountryCode" AS northwind:demo-orders-shipcountrycode ;
      northwind:rowguid orders_s."ROWGUID" AS northwind:demo-orders-rowguid ;
      # Maps FROM foreign-key relations of "Demo.demo.Orders"
      northwind:has_customers northwind:customers (customers_s."CustomerID")  AS northwind:orders_has_customers ;
      northwind:has_employees northwind:employees (employees_s."EmployeeID")  AS northwind:orders_has_employees ;
      northwind:has_shippers northwind:shippers (shippers_s."ShipperID")  AS northwind:orders_has_shippers ;
      northwind:orders_of northwind:order_details (order_details_s."OrderID",order_details_s."ProductID")  AS northwind:orders_order_details_of .

    }
 }

;

SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."Products" AS products_s
 FROM "Demo"."demo"."Order_Details" AS order_details_s
 WHERE (^{order_details_s.}^."ProductID" = ^{products_s.}^."ProductID") 
 FROM "Demo"."demo"."Categories" AS categories_s
 WHERE (^{products_s.}^."CategoryID" = ^{categories_s.}^."CategoryID") 
 FROM "Demo"."demo"."Suppliers" AS suppliers_s
 WHERE (^{products_s.}^."SupplierID" = ^{suppliers_s.}^."SupplierID") 
 { 
   CREATE northwind:qm-products AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#")  
    { 
      # Maps FROM columns of "Demo.demo.Products"
      northwind:products (products_s."ProductID")  a northwind:Products ;
      northwind:productid products_s."ProductID" AS northwind:demo-products-productid ;
      northwind:productname products_s."ProductName" AS northwind:demo-products-productname ;
      northwind:supplierid products_s."SupplierID" AS northwind:demo-products-supplierid ;
      northwind:categoryid products_s."CategoryID" AS northwind:demo-products-categoryid ;
      northwind:quantityperunit products_s."QuantityPerUnit" AS northwind:demo-products-quantityperunit ;
      northwind:unitprice products_s."UnitPrice" AS northwind:demo-products-unitprice ;
      northwind:unitsinstock products_s."UnitsInStock" AS northwind:demo-products-unitsinstock ;
      northwind:unitsonorder products_s."UnitsOnOrder" AS northwind:demo-products-unitsonorder ;
      northwind:reorderlevel products_s."ReorderLevel" AS northwind:demo-products-reorderlevel ;
      northwind:discontinued products_s."Discontinued" AS northwind:demo-products-discontinued ;
      # Maps FROM foreign-key relations of "Demo.demo.Products"
      northwind:has_categories northwind:categories (categories_s."CategoryID")  AS northwind:products_has_categories ;
      northwind:has_suppliers northwind:suppliers (suppliers_s."SupplierID")  AS northwind:products_has_suppliers ;
      northwind:products_of northwind:order_details (order_details_s."OrderID",order_details_s."ProductID")  AS northwind:products_order_details_of .

    }
 }

;

SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."Shippers" AS shippers_s
 FROM "Demo"."demo"."Orders" AS orders_s
 WHERE (^{orders_s.}^."ShipVia" = ^{shippers_s.}^."ShipperID") 
 { 
   CREATE northwind:qm-shippers AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#")  
    { 
      # Maps FROM columns of "Demo.demo.Shippers"
      northwind:shippers (shippers_s."ShipperID")  a northwind:Shippers ;
      northwind:shipperid shippers_s."ShipperID" AS northwind:demo-shippers-shipperid ;
      northwind:companyname shippers_s."CompanyName" AS northwind:demo-shippers-companyname ;
      northwind:phone shippers_s."Phone" AS northwind:demo-shippers-phone ;
      # Maps FROM foreign-key relations of "Demo.demo.Shippers"
      northwind:shippers_of northwind:orders (orders_s."OrderID")  AS northwind:shippers_orders_of .

    }
 }

;

SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."Suppliers" AS suppliers_s
 FROM "Demo"."demo"."Products" AS products_s
 WHERE (^{products_s.}^."SupplierID" = ^{suppliers_s.}^."SupplierID") 
 { 
   CREATE northwind:qm-suppliers AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#")  
    { 
      # Maps FROM columns of "Demo.demo.Suppliers"
      northwind:suppliers (suppliers_s."SupplierID")  a northwind:Suppliers ;
      northwind:supplierid suppliers_s."SupplierID" AS northwind:demo-suppliers-supplierid ;
      northwind:companyname suppliers_s."CompanyName" AS northwind:demo-suppliers-companyname ;
      northwind:contactname suppliers_s."ContactName" AS northwind:demo-suppliers-contactname ;
      northwind:contacttitle suppliers_s."ContactTitle" AS northwind:demo-suppliers-contacttitle ;
      northwind:address suppliers_s."Address" AS northwind:demo-suppliers-address ;
      northwind:city suppliers_s."City" AS northwind:demo-suppliers-city ;
      northwind:region suppliers_s."Region" AS northwind:demo-suppliers-region ;
      northwind:postalcode suppliers_s."PostalCode" AS northwind:demo-suppliers-postalcode ;
      northwind:country suppliers_s."Country" AS northwind:demo-suppliers-country ;
      northwind:countrycode suppliers_s."CountryCode" AS northwind:demo-suppliers-countrycode ;
      northwind:phone suppliers_s."Phone" AS northwind:demo-suppliers-phone ;
      northwind:fax suppliers_s."Fax" AS northwind:demo-suppliers-fax ;
      northwind:homepage suppliers_s."HomePage" AS northwind:demo-suppliers-homepage ;
      # Maps FROM foreign-key relations of "Demo.demo.Suppliers"
      northwind:suppliers_of northwind:products (products_s."ProductID") AS northwind:suppliers_products_of .

    }
 }

;

SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/> 
PREFIX northwind-stat: <http://demo.openlinksw.com/northwind/stat#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX void: <http://rdfs.org/ns/void#> 
PREFIX scovo: <http://purl.org/NET/scovo#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
ALTER QUAD STORAGE virtrdf:DefaultQuadStorage 
 FROM "Demo"."demo"."CategoriesCount" AS categoriescount_s
 FROM "Demo"."demo"."CustomersCount" AS customerscount_s
 FROM "Demo"."demo"."EmployeesCount" AS employeescount_s
 FROM "Demo"."demo"."Order_DetailsCount" AS order_detailscount_s
 FROM "Demo"."demo"."OrdersCount" AS orderscount_s
 FROM "Demo"."demo"."ProductsCount" AS productscount_s
 FROM "Demo"."demo"."ShippersCount" AS shipperscount_s
 FROM "Demo"."demo"."SuppliersCount" AS supplierscount_s
 FROM "Demo"."demo"."northwind__Total" AS northwind__total_s
 { 
   CREATE northwind:qm-VoidStatistics AS GRAPH IRI ("http://^{URIQADefaultHost}^/northwind#") option (exclusive) 
    { 
      # voID Statistics 
      northwind-stat: a void:Dataset AS northwind:dataset-demo ; 
       void:sparqlEndpoint <http://demo.openlinksw.com/sparql> AS northwind:dataset-sparql-demo ; 
      void:statItem northwind-stat:Stat . 
      northwind-stat:Stat a scovo:Item ; 
       rdf:value northwind__total_s.cnt AS northwind:stat-decl-demo ; 
       scovo:dimension void:numOfTriples . 

      northwind-stat: void:statItem northwind-stat:CategoriesStat AS northwind:statitem-demo-categories . 
      northwind-stat:CategoriesStat a scovo:Item AS northwind:statitem-decl-demo-categories ; 
      rdf:value categoriescount_s.cnt AS northwind:statitem-cnt-demo-categories ; 
      scovo:dimension void:numberOfResources AS northwind:statitem-type-1-demo-categories ; 
      scovo:dimension northwind:Categories AS northwind:statitem-type-2-demo-categories .

      northwind-stat: void:statItem northwind-stat:CustomersStat AS northwind:statitem-demo-customers . 
      northwind-stat:CustomersStat a scovo:Item AS northwind:statitem-decl-demo-customers ; 
      rdf:value customerscount_s.cnt AS northwind:statitem-cnt-demo-customers ; 
      scovo:dimension void:numberOfResources AS northwind:statitem-type-1-demo-customers ; 
      scovo:dimension northwind:Customers AS northwind:statitem-type-2-demo-customers .

      northwind-stat: void:statItem northwind-stat:EmployeesStat AS northwind:statitem-demo-employees . 
      northwind-stat:EmployeesStat a scovo:Item AS northwind:statitem-decl-demo-employees ; 
      rdf:value employeescount_s.cnt AS northwind:statitem-cnt-demo-employees ; 
      scovo:dimension void:numberOfResources AS northwind:statitem-type-1-demo-employees ; 
      scovo:dimension northwind:Employees AS northwind:statitem-type-2-demo-employees .

      northwind-stat: void:statItem northwind-stat:Order_DetailsStat AS northwind:statitem-demo-order_details . 
      northwind-stat:Order_DetailsStat a scovo:Item AS northwind:statitem-decl-demo-order_details ; 
      rdf:value order_detailscount_s.cnt AS northwind:statitem-cnt-demo-order_details ; 
      scovo:dimension void:numberOfResources AS northwind:statitem-type-1-demo-order_details ; 
      scovo:dimension northwind:Order_Details AS northwind:statitem-type-2-demo-order_details .

      northwind-stat: void:statItem northwind-stat:OrdersStat AS northwind:statitem-demo-orders . 
      northwind-stat:OrdersStat a scovo:Item AS northwind:statitem-decl-demo-orders ; 
      rdf:value orderscount_s.cnt AS northwind:statitem-cnt-demo-orders ; 
      scovo:dimension void:numberOfResources AS northwind:statitem-type-1-demo-orders ; 
      scovo:dimension northwind:Orders AS northwind:statitem-type-2-demo-orders .

      northwind-stat: void:statItem northwind-stat:ProductsStat AS northwind:statitem-demo-products . 
      northwind-stat:ProductsStat a scovo:Item AS northwind:statitem-decl-demo-products ; 
      rdf:value productscount_s.cnt AS northwind:statitem-cnt-demo-products ; 
      scovo:dimension void:numberOfResources AS northwind:statitem-type-1-demo-products ; 
      scovo:dimension northwind:Products AS northwind:statitem-type-2-demo-products .

      northwind-stat: void:statItem northwind-stat:ShippersStat AS northwind:statitem-demo-shippers . 
      northwind-stat:ShippersStat a scovo:Item AS northwind:statitem-decl-demo-shippers ; 
      rdf:value shipperscount_s.cnt AS northwind:statitem-cnt-demo-shippers ; 
      scovo:dimension void:numberOfResources AS northwind:statitem-type-1-demo-shippers ; 
      scovo:dimension northwind:Shippers AS northwind:statitem-type-2-demo-shippers .

      northwind-stat: void:statItem northwind-stat:SuppliersStat AS northwind:statitem-demo-suppliers . 
      northwind-stat:SuppliersStat a scovo:Item AS northwind:statitem-decl-demo-suppliers ; 
      rdf:value supplierscount_s.cnt AS northwind:statitem-cnt-demo-suppliers ; 
      scovo:dimension void:numberOfResources AS northwind:statitem-type-1-demo-suppliers ; 
      scovo:dimension northwind:Suppliers AS northwind:statitem-type-2-demo-suppliers .

    }
 }
;



-- Virtual directories for Linked Data Deployment 

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'northwind_rule2',
1,
'(/[^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/northwind%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)|(text/turtle)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'northwind_rule4',
1,
'/northwind/stat([^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/northwind/stat%%23%%3E+%%3Fo+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/northwind%%23%%3E+WHERE+{+%%3Chttp%%3A//^{URIQADefaultHost}^/northwind/stat%%23%%3E+%%3Fp+%%3Fo+}&format=%U',
vector('*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)|(text/turtle)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'northwind_rule6',
1,
'/northwind/objects/([^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/northwind/objects/%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/northwind%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)|(text/turtle)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'northwind_rule1',
1,
'([^#]*)',
vector('path'),
1,
'/describe/?url=http%%3A//^{URIQADefaultHost}^%U%%23this&graph=http%%3A//^{URIQADefaultHost}^/northwind%%23&distinct=0',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'northwind_rule7',
1,
'/northwind/stat([^#]*)',
vector('path'),
1,
'/describe/?url=http%%3A//^{URIQADefaultHost}^/northwind/stat%%23&graph=http%%3A//^{URIQADefaultHost}^/northwind%%23',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'northwind_rule5',
1,
'/northwind/objects/(.*)',
vector('path'),
1,
'/services/rdf/object.binary?path=%%2Fnorthwind%%2Fobjects%%2F%U&accept=%U',
vector('path', '*accept*'),
null,
null,
2,
null
);
DB.DBA.URLREWRITE_CREATE_RULELIST ( 'northwind_rule_list1', 1, vector ( 'northwind_rule1', 'northwind_rule7', 'northwind_rule5', 'northwind_rule2', 'northwind_rule4', 'northwind_rule6'));
DB.DBA.VHOST_REMOVE (lpath=>'/northwind');
DB.DBA.VHOST_DEFINE (lpath=>'/northwind', ppath=>'/', vsp_user=>'dba', is_dav=>0,
is_brws=>0, opts=>vector ('url_rewrite', 'northwind_rule_list1')
);

-- Virtual directories for ontology
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'northwind_owl_rule2',
1,
'(/[^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/schemas/northwind%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)|(text/turtle)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'northwind_owl_rule1',
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
DB.DBA.URLREWRITE_CREATE_RULELIST ( 'northwind_owl_rule_list1', 1, vector ( 'northwind_owl_rule1', 'northwind_owl_rule2'));
DB.DBA.VHOST_REMOVE (lpath=>'/schemas/northwind');
DB.DBA.VHOST_DEFINE (lpath=>'/schemas/northwind', ppath=>'/', vsp_user=>'dba', is_dav=>0,
is_brws=>0, opts=>vector ('url_rewrite', 'northwind_owl_rule_list1')
);

-- Sample Entity Names for verification lookups
-- http://demo.openlinksw.com/northwind/categories/CategoryID/1#this
-- http://demo.openlinksw.com/northwind/customers/CustomerID/ALFKI#this
-- http://demo.openlinksw.com/northwind/employees/EmployeeID/3#this
-- http://demo.openlinksw.com/northwind/objects/employees/EmployeeID/3/Photo.bin
-- http://demo.openlinksw.com/northwind/order_details/OrderID/10285/ProductID/1#this
-- http://demo.openlinksw.com/northwind/orders/OrderID/10643#this
-- http://demo.openlinksw.com/northwind/products/ProductID/1#this
-- http://demo.openlinksw.com/northwind/shippers/ShipperID/1#this
-- http://demo.openlinksw.com/northwind/suppliers/SupplierID/19#this

SPARQL
SELECT (SAMPLE(?s) AS ?Sample) 
       (?o AS ?entityType)
       (COUNT(*) AS ?Count)
FROM <http://demo.openlinksw.com/northwind#> 
WHERE {
       ?s a ?o. 
      }
GROUP BY ?o
ORDER BY DESC 3 ;

-- Cleanup GraphQL Introspection Graph
SPARQL CLEAR GRAPH <urn:northwind:intro> ;
SPARQL SELECT COUNT(*) FROM <urn:northwind:intro> WHERE {?s ?p ?o} ;

-- Cleanup Mapping Schema
SPARQL CLEAR GRAPH <http://demo.openlinksw.com/schemas/northwind/>  ;
SPARQL SELECT COUNT(*) FROM <http://demo.openlinksw.com/schemas/northwind/> WHERE {?s ?p ?o} ;

SPARQL
PREFIX owl: <http://www.w3.org/2002/07/owl#> 
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
PREFIX virtrdf: <http://www.openlinksw.com/schemas/virtrdf#>
PREFIX gql: <http://www.openlinksw.com/schemas/graphql#> 
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind/>

INSERT DATA INTO <http://demo.openlinksw.com/schemas/northwind/>
{

northwind: a owl:Ontology .

# Demo.demo.Categories

gql:Categories gql:type gql:Array;
  gql:rdfClass northwind:Categories .

gql:CategoriesObject gql:type gql:Object;
  gql:rdfClass northwind:Categories .

northwind:Categories a rdfs:Class ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:Categories ;
  rdfs:label "Demo.demo.Categories" .

northwind:categoryid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Categories ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:categoryid ;
  rdfs:label "CategoryID" .

northwind:categoryname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Categories ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:categoryname ;
  rdfs:label "CategoryName" .

northwind:description a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Categories ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:description ;
  rdfs:label "Description" .

northwind:categories_of a owl:ObjectProperty ;
  rdfs:domain northwind:Categories ;
  rdfs:range northwind:Products ;
  rdfs:label "Relation to Demo.demo.Products" ;
  gql:field gql:categories_of ;
  gql:type gql:Array ;
  rdfs:isDefinedBy northwind: .


# Demo.demo.Customers

gql:Customers gql:type gql:Array;
  gql:rdfClass northwind:Customers .

gql:CustomersObject gql:type gql:Object;
  gql:rdfClass northwind:Customers .

northwind:Customers a rdfs:Class ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:Customers ;
  rdfs:label "Demo.demo.Customers" .

northwind:customerid a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:customerid ;
  rdfs:label "CustomerID" .

northwind:companyname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:companyname ;
  rdfs:label "CompanyName" .

northwind:contactname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:contactname ;
  rdfs:label "ContactName" .

northwind:contacttitle a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:contacttitle ;
  rdfs:label "ContactTitle" .

northwind:address a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:address ;
  rdfs:label "Address" .

northwind:city a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:city ;
  rdfs:label "City" .

northwind:region a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:region ;
  rdfs:label "Region" .

northwind:postalcode a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:postalcode ;
  rdfs:label "PostalCode" .

northwind:country a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:country ;
  rdfs:label "Country" .

northwind:countrycode a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:countrycode ;
  rdfs:label "CountryCode" .

northwind:phone a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:phone ;
  rdfs:label "Phone" .

northwind:fax a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Customers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:fax ;
  rdfs:label "Fax" .

northwind:customers_of a owl:ObjectProperty ;
  rdfs:domain northwind:Customers ;
  rdfs:range northwind:Orders ;
  rdfs:label "Relation to Demo.demo.Orders" ;
  gql:field gql:customers_of ;
  gql:type gql:Array ;
  rdfs:isDefinedBy northwind: .


# Demo.demo.Employees

gql:Employees gql:type gql:Array;
  gql:rdfClass northwind:Employees .

gql:EmployeesObject gql:type gql:Object;
  gql:rdfClass northwind:Employees .

northwind:Employees a rdfs:Class ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:Employees ;
  rdfs:label "Demo.demo.Employees" .

northwind:employeeid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:employeeid ;
  rdfs:label "EmployeeID" .

northwind:lastname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:lastname ;
  rdfs:label "LastName" .

northwind:firstname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:firstname ;
  rdfs:label "FirstName" .

northwind:title a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:title ;
  rdfs:label "Title" .

northwind:titleofcourtesy a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:titleofcourtesy ;
  rdfs:label "TitleOfCourtesy" .

northwind:birthdate a owl:DatatypeProperty ;
  rdfs:range xsd:date ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:birthdate ;
  rdfs:label "BirthDate" .

northwind:hiredate a owl:DatatypeProperty ;
  rdfs:range xsd:date ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:hiredate ;
  rdfs:label "HireDate" .

northwind:address a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:address ;
  rdfs:label "Address" .

northwind:city a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:city ;
  rdfs:label "City" .

northwind:region a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:region ;
  rdfs:label "Region" .

northwind:postalcode a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:postalcode ;
  rdfs:label "PostalCode" .

northwind:country a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:country ;
  rdfs:label "Country" .

northwind:countrycode a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:countrycode ;
  rdfs:label "CountryCode" .

northwind:homephone a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:homephone ;
  rdfs:label "HomePhone" .

northwind:extension a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:extension ;
  rdfs:label "Extension" .

northwind:photo a owl:ObjectProperty ;
  rdfs:range aowl:Content ;
  gql:type gql:Object ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:photo ;
  rdfs:label "Photo" .

northwind:notes a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:notes ;
  rdfs:label "Notes" .

northwind:reportsto a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Employees ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:reportsto ;
  rdfs:label "ReportsTo" .

northwind:employees_of a owl:ObjectProperty ;
  rdfs:domain northwind:Employees ;
  rdfs:range northwind:Orders ;
  rdfs:label "Relation to Demo.demo.Orders" ;
  gql:field gql:employees_of ;
  gql:type gql:Array ;
  rdfs:isDefinedBy northwind: .


# Demo.demo.Order_Details

gql:Order_Details gql:type gql:Array;
  gql:rdfClass northwind:Order_Details .

gql:Order_DetailsObject gql:type gql:Object;
  gql:rdfClass northwind:Order_Details .

northwind:Order_Details a rdfs:Class ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:Order_Details ;
  rdfs:label "Demo.demo.Order_Details" .

northwind:orderid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Order_Details ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:orderid ;
  rdfs:label "OrderID" .

northwind:productid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Order_Details ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:productid ;
  rdfs:label "ProductID" .

northwind:unitprice a owl:DatatypeProperty ;
  rdfs:range xsd:numeric ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Order_Details ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:unitprice ;
  rdfs:label "UnitPrice" .

northwind:quantity a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Order_Details ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:quantity ;
  rdfs:label "Quantity" .

northwind:discount a owl:DatatypeProperty ;
  rdfs:range xsd:float ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Order_Details ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:discount ;
  rdfs:label "Discount" .

northwind:has_orders a owl:ObjectProperty ;
  rdfs:domain northwind:Order_Details ;
  rdfs:range northwind:Orders ;
  rdfs:label "Relation to Demo.demo.Orders" ;
  gql:field gql:has_orders ;
  gql:type gql:Object ;
  rdfs:isDefinedBy northwind: .

northwind:has_products a owl:ObjectProperty ;
  rdfs:domain northwind:Order_Details ;
  rdfs:range northwind:Products ;
  rdfs:label "Relation to Demo.demo.Products" ;
  gql:field gql:has_products ;
  gql:type gql:Object ;
  rdfs:isDefinedBy northwind: .


# Demo.demo.Orders

gql:Orders gql:type gql:Array;
  gql:rdfClass northwind:Orders .

gql:OrdersObject gql:type gql:Object;
  gql:rdfClass northwind:Orders .

northwind:Orders a rdfs:Class ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:Orders ;
  rdfs:label "Demo.demo.Orders" .

northwind:orderid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:orderid ;
  rdfs:label "OrderID" .

northwind:customerid a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:customerid ;
  rdfs:label "CustomerID" .

northwind:employeeid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:employeeid ;
  rdfs:label "EmployeeID" .

northwind:orderdate a owl:DatatypeProperty ;
  rdfs:range xsd:dateTime ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:orderdate ;
  rdfs:label "OrderDate" .

northwind:requireddate a owl:DatatypeProperty ;
  rdfs:range xsd:date ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:requireddate ;
  rdfs:label "RequiredDate" .

northwind:shippeddate a owl:DatatypeProperty ;
  rdfs:range xsd:dateTime ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shippeddate ;
  rdfs:label "ShippedDate" .

northwind:shipvia a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shipvia ;
  rdfs:label "ShipVia" .

northwind:freight a owl:DatatypeProperty ;
  rdfs:range xsd:numeric ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:freight ;
  rdfs:label "Freight" .

northwind:shipname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shipname ;
  rdfs:label "ShipName" .

northwind:shipaddress a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shipaddress ;
  rdfs:label "ShipAddress" .

northwind:shipcity a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shipcity ;
  rdfs:label "ShipCity" .

northwind:shipregion a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shipregion ;
  rdfs:label "ShipRegion" .

northwind:shippostalcode a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shippostalcode ;
  rdfs:label "ShipPostalCode" .

northwind:shipcountry a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shipcountry ;
  rdfs:label "ShipCountry" .

northwind:shipcountrycode a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shipcountrycode ;
  rdfs:label "ShipCountryCode" .

northwind:rowguid a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Orders ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:rowguid ;
  rdfs:label "ROWGUID" .

northwind:has_customers a owl:ObjectProperty ;
  rdfs:domain northwind:Orders ;
  rdfs:range northwind:Customers ;
  rdfs:label "Relation to Demo.demo.Customers" ;
  gql:field gql:has_customers ;
  gql:type gql:Object ;
  rdfs:isDefinedBy northwind: .

northwind:has_employees a owl:ObjectProperty ;
  rdfs:domain northwind:Orders ;
  rdfs:range northwind:Employees ;
  rdfs:label "Relation to Demo.demo.Employees" ;
  gql:field gql:has_employees ;
  gql:type gql:Object ;
  rdfs:isDefinedBy northwind: .

northwind:has_shippers a owl:ObjectProperty ;
  rdfs:domain northwind:Orders ;
  rdfs:range northwind:Shippers ;
  rdfs:label "Relation to Demo.demo.Shippers" ;
  gql:field gql:has_shippers ;
  gql:type gql:Object ;
  rdfs:isDefinedBy northwind: .

northwind:orders_of a owl:ObjectProperty ;
  rdfs:domain northwind:Orders ;
  rdfs:range northwind:Order_Details ;
  rdfs:label "Relation to Demo.demo.Order_Details" ;
  gql:field gql:orders_of ;
  gql:type gql:Array ;
  rdfs:isDefinedBy northwind: .


# Demo.demo.Products

gql:Products gql:type gql:Array;
  gql:rdfClass northwind:Products .

gql:ProductsObject gql:type gql:Object;
  gql:rdfClass northwind:Products .

northwind:Products a rdfs:Class ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:Products ;
  rdfs:label "Demo.demo.Products" .

northwind:productid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:productid ;
  rdfs:label "ProductID" .

northwind:productname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:productname ;
  rdfs:label "ProductName" .

northwind:supplierid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:supplierid ;
  rdfs:label "SupplierID" .

northwind:categoryid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:categoryid ;
  rdfs:label "CategoryID" .

northwind:quantityperunit a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:quantityperunit ;
  rdfs:label "QuantityPerUnit" .

northwind:unitprice a owl:DatatypeProperty ;
  rdfs:range xsd:numeric ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:unitprice ;
  rdfs:label "UnitPrice" .

northwind:unitsinstock a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:unitsinstock ;
  rdfs:label "UnitsInStock" .

northwind:unitsonorder a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:unitsonorder ;
  rdfs:label "UnitsOnOrder" .

northwind:reorderlevel a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:reorderlevel ;
  rdfs:label "ReorderLevel" .

northwind:discontinued a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Products ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:discontinued ;
  rdfs:label "Discontinued" .

northwind:has_categories a owl:ObjectProperty ;
  rdfs:domain northwind:Products ;
  rdfs:range northwind:Categories ;
  rdfs:label "Relation to Demo.demo.Categories" ;
  gql:field gql:has_categories ;
  gql:type gql:Object ;
  rdfs:isDefinedBy northwind: .

northwind:has_suppliers a owl:ObjectProperty ;
  rdfs:domain northwind:Products ;
  rdfs:range northwind:Suppliers ;
  rdfs:label "Relation to Demo.demo.Suppliers" ;
  gql:field gql:has_suppliers ;
  gql:type gql:Object ;
  rdfs:isDefinedBy northwind: .

northwind:products_of a owl:ObjectProperty ;
  rdfs:domain northwind:Products ;
  rdfs:range northwind:Order_Details ;
  rdfs:label "Relation to Demo.demo.Order_Details" ;
  gql:field gql:products_of ;
  gql:type gql:Array ;
  rdfs:isDefinedBy northwind: .


# Demo.demo.Shippers

gql:Shippers gql:type gql:Array;
  gql:rdfClass northwind:Shippers .

gql:ShippersObject gql:type gql:Object;
  gql:rdfClass northwind:Shippers .

northwind:Shippers a rdfs:Class ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:Shippers ;
  rdfs:label "Demo.demo.Shippers" .

northwind:shipperid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Shippers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:shipperid ;
  rdfs:label "ShipperID" .

northwind:companyname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Shippers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:companyname ;
  rdfs:label "CompanyName" .

northwind:phone a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Shippers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:phone ;
  rdfs:label "Phone" .

northwind:shippers_of a owl:ObjectProperty ;
  rdfs:domain northwind:Shippers ;
  rdfs:range northwind:Orders ;
  rdfs:label "Relation to Demo.demo.Orders" ;
  gql:field gql:shippers_of ;
  gql:type gql:Array ;
  rdfs:isDefinedBy northwind: .


# Demo.demo.Suppliers

gql:Suppliers gql:type gql:Array;
  gql:rdfClass northwind:Suppliers .

gql:SuppliersObject gql:type gql:Object;
  gql:rdfClass northwind:Suppliers .

northwind:Suppliers a rdfs:Class ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:Suppliers ;
  rdfs:label "Demo.demo.Suppliers" .

northwind:supplierid a owl:DatatypeProperty ;
  rdfs:range xsd:int ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:supplierid ;
  rdfs:label "SupplierID" .

northwind:companyname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:companyname ;
  rdfs:label "CompanyName" .

northwind:contactname a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:contactname ;
  rdfs:label "ContactName" .

northwind:contacttitle a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:contacttitle ;
  rdfs:label "ContactTitle" .

northwind:address a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:address ;
  rdfs:label "Address" .

northwind:city a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:city ;
  rdfs:label "City" .

northwind:region a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:region ;
  rdfs:label "Region" .

northwind:postalcode a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:postalcode ;
  rdfs:label "PostalCode" .

northwind:country a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:country ;
  rdfs:label "Country" .

northwind:countrycode a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:countrycode ;
  rdfs:label "CountryCode" .

northwind:phone a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:phone ;
  rdfs:label "Phone" .

northwind:fax a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:fax ;
  rdfs:label "Fax" .

northwind:homepage a owl:DatatypeProperty ;
  rdfs:range xsd:string ;
  gql:type gql:Scalar ;
  rdfs:domain northwind:Suppliers ;
  rdfs:isDefinedBy northwind: ;
  gql:field gql:homepage ;
  rdfs:label "HomePage" .

northwind:suppliers_of a owl:ObjectProperty ;
  rdfs:domain northwind:Suppliers ;
  rdfs:range northwind:Products ;
  rdfs:label "Relation to Demo.demo.Products" ;
  gql:field gql:suppliers_of ;
  gql:type gql:Array ;
  rdfs:isDefinedBy northwind: .


gql:Map gql:dataGraph <http://demo.openlinksw.com/northwind#> ;
  gql:schemaGraph northwind: ;
  gql:schemaObjects gql:Categories, gql:Customers, gql:Employees, gql:Order_Details, gql:Orders, gql:Products, gql:Shippers, gql:Suppliers.


} ;

GQL_INIT_TYPE_SCHEMA(); -- Initialize GQL Type Schema for modification 
GQL_INTRO_DEL ('urn:northwind:intro'); -- Add modified Instrospection Data to GQL Bridge Type System Schema
TTLP (GQL_CREATE_TYPE_SCHEMA ('http://demo.openlinksw.com/schemas/northwind/'), '', 'urn:northwind:intro');
GQL_INTRO_ADD ('urn:northwind:intro'); -- Add modified Instrospection Data to GQL Bridge Type System Schema

