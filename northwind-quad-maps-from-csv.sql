grant select on "csv"."Northwind"."categories" to SPARQL_SELECT;
grant select on "csv"."Northwind"."customers" to SPARQL_SELECT;
grant select on "csv"."Northwind"."employee_territories" to SPARQL_SELECT;
grant select on "csv"."Northwind"."employees" to SPARQL_SELECT;
grant select on "csv"."Northwind"."order_details" to SPARQL_SELECT;
grant select on "csv"."Northwind"."orders" to SPARQL_SELECT;
grant select on "csv"."Northwind"."products" to SPARQL_SELECT;
grant select on "csv"."Northwind"."regions" to SPARQL_SELECT;
grant select on "csv"."Northwind"."shippers" to SPARQL_SELECT;
grant select on "csv"."Northwind"."suppliers" to SPARQL_SELECT;
grant select on "csv"."Northwind"."territories" to SPARQL_SELECT;


SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:categories "http://^{URIQADefaultHost}^/csv_northwind/categories/categoryID/%d#this" (in _categoryID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:categories_picture "http://^{URIQADefaultHost}^/csv_northwind/objects/categories/categoryID/%d/picture.jpe" (in _categoryID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:customers "http://^{URIQADefaultHost}^/csv_northwind/customers/customerID/%U#this" (in _customerID varchar not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:employee_territories "http://^{URIQADefaultHost}^/csv_northwind/employee_territories/employeeID/%d#this" (in _employeeID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:employees "http://^{URIQADefaultHost}^/csv_northwind/employees/employeeID/%d#this" (in _employeeID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:employees_photo "http://^{URIQADefaultHost}^/csv_northwind/objects/employees/employeeID/%d/photo.jpe" (in _employeeID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:order_details "http://^{URIQADefaultHost}^/csv_northwind/order_details/orderID/%d#this" (in _orderID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:orders "http://^{URIQADefaultHost}^/csv_northwind/orders/orderID/%d#this" (in _orderID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:products "http://^{URIQADefaultHost}^/csv_northwind/products/productID/%d#this" (in _productID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:regions "http://^{URIQADefaultHost}^/csv_northwind/regions/regionID/%d#this" (in _regionID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:shippers "http://^{URIQADefaultHost}^/csv_northwind/shippers/shipperID/%d#this" (in _shipperID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:suppliers "http://^{URIQADefaultHost}^/csv_northwind/suppliers/supplierID/%d#this" (in _supplierID integer not null) . ;
SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
create iri class csv_northwind:territories "http://^{URIQADefaultHost}^/csv_northwind/territories/territoryID/%d/territoryDescription/%U#this" (in _territoryID integer not null,in _territoryDescription varchar not null) . ;


create view "csv"."Northwind"."employeesCount" as select count (*) as cnt from "csv"."Northwind"."employees"; 
grant select on "csv"."Northwind"."employeesCount" to SPARQL_SELECT; 
create view "csv"."Northwind"."order_detailsCount" as select count (*) as cnt from "csv"."Northwind"."order_details"; 
grant select on "csv"."Northwind"."order_detailsCount" to SPARQL_SELECT; 
create view "csv"."Northwind"."ordersCount" as select count (*) as cnt from "csv"."Northwind"."orders"; 
grant select on "csv"."Northwind"."ordersCount" to SPARQL_SELECT; 
create view "csv"."Northwind"."productsCount" as select count (*) as cnt from "csv"."Northwind"."products"; 
grant select on "csv"."Northwind"."productsCount" to SPARQL_SELECT; 
create view "csv"."Northwind"."regionsCount" as select count (*) as cnt from "csv"."Northwind"."regions"; 
grant select on "csv"."Northwind"."regionsCount" to SPARQL_SELECT; 
create view "csv"."Northwind"."shippersCount" as select count (*) as cnt from "csv"."Northwind"."shippers"; 
grant select on "csv"."Northwind"."shippersCount" to SPARQL_SELECT; 
create view "csv"."Northwind"."suppliersCount" as select count (*) as cnt from "csv"."Northwind"."suppliers"; 
grant select on "csv"."Northwind"."suppliersCount" to SPARQL_SELECT; 
create view "csv"."Northwind"."territoriesCount" as select count (*) as cnt from "csv"."Northwind"."territories"; 
grant select on "csv"."Northwind"."territoriesCount" to SPARQL_SELECT; 
drop view "csv"."Northwind"."csv_northwind__Total"; 
create view "csv"."Northwind"."csv_northwind__Total" as select (cnt0*cnt1)+(cnt2*cnt3)+(cnt4*cnt5)+(cnt6*cnt7)+(cnt8*cnt9)+(cnt10*cnt11)+(cnt12*cnt13)+(cnt14*cnt15)+(cnt16*cnt17)+(cnt18*cnt19)+(cnt20*cnt21) AS cnt from 
 (select count(*) cnt0 from "csv"."Northwind"."categories") tb0, 
 (select count(*)+1 as cnt1 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.categories'  and "COLUMN" <> '_IDN') tb1,
 (select count(*) cnt2 from "csv"."Northwind"."customers") tb2, 
 (select count(*)+1 as cnt3 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.customers'  and "COLUMN" <> '_IDN') tb3,
 (select count(*) cnt4 from "csv"."Northwind"."employee_territories") tb4, 
 (select count(*)+1 as cnt5 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.employee_territories'  and "COLUMN" <> '_IDN') tb5,
 (select count(*) cnt6 from "csv"."Northwind"."employees") tb6, 
 (select count(*)+1 as cnt7 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.employees'  and "COLUMN" <> '_IDN') tb7,
 (select count(*) cnt8 from "csv"."Northwind"."order_details") tb8, 
 (select count(*)+1 as cnt9 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.order_details'  and "COLUMN" <> '_IDN') tb9,
 (select count(*) cnt10 from "csv"."Northwind"."orders") tb10, 
 (select count(*)+1 as cnt11 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.orders'  and "COLUMN" <> '_IDN') tb11,
 (select count(*) cnt12 from "csv"."Northwind"."products") tb12, 
 (select count(*)+1 as cnt13 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.products'  and "COLUMN" <> '_IDN') tb13,
 (select count(*) cnt14 from "csv"."Northwind"."regions") tb14, 
 (select count(*)+1 as cnt15 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.regions'  and "COLUMN" <> '_IDN') tb15,
 (select count(*) cnt16 from "csv"."Northwind"."shippers") tb16, 
 (select count(*)+1 as cnt17 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.shippers'  and "COLUMN" <> '_IDN') tb17,
 (select count(*) cnt18 from "csv"."Northwind"."suppliers") tb18, 
 (select count(*)+1 as cnt19 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.suppliers'  and "COLUMN" <> '_IDN') tb19,
 (select count(*) cnt20 from "csv"."Northwind"."territories") tb20, 
 (select count(*)+1 as cnt21 from DB.DBA.TABLE_COLS where "TABLE" = 'csv.Northwind.territories'  and "COLUMN" <> '_IDN') tb21
; 
grant select on "csv"."Northwind"."csv_northwind__Total" to SPARQL_SELECT; 


SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."categories" as categories_s
 { 
   create csv_northwind:qm-categories as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.categories"
      csv_northwind:categories (categories_s."categoryID")  a csv_northwind:categories ;
      csv_northwind:categoryid categories_s."categoryID" as csv_northwind:northwind-categories-categoryid ;
      csv_northwind:categoryname categories_s."categoryName" as csv_northwind:northwind-categories-categoryname ;
      csv_northwind:description categories_s."description" as csv_northwind:northwind-categories-description ;
      csv_northwind:picture csv_northwind:categories_picture (categories_s."categoryID")  as csv_northwind:northwind-categories-picture .
      csv_northwind:categories_picture (categories_s."categoryID")  a aowl:Content ; aowl:body categories_s."picture" as csv_northwind:northwind-categories-picture-content ; aowl:type "image/jpeg" .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."customers" as customers_s
 { 
   create csv_northwind:qm-customers as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.customers"
      csv_northwind:customers (customers_s."customerID")  a csv_northwind:customers ;
      csv_northwind:customerid customers_s."customerID" as csv_northwind:northwind-customers-customerid ;
      csv_northwind:companyname customers_s."companyName" as csv_northwind:northwind-customers-companyname ;
      csv_northwind:contactname customers_s."contactName" as csv_northwind:northwind-customers-contactname ;
      csv_northwind:contacttitle customers_s."contactTitle" as csv_northwind:northwind-customers-contacttitle ;
      csv_northwind:address customers_s."address" as csv_northwind:northwind-customers-address ;
      csv_northwind:city customers_s."city" as csv_northwind:northwind-customers-city ;
      csv_northwind:region customers_s."region" as csv_northwind:northwind-customers-region ;
      csv_northwind:postalcode customers_s."postalCode" as csv_northwind:northwind-customers-postalcode ;
      csv_northwind:country customers_s."country" as csv_northwind:northwind-customers-country ;
      csv_northwind:phone customers_s."phone" as csv_northwind:northwind-customers-phone ;
      csv_northwind:fax customers_s."fax" as csv_northwind:northwind-customers-fax .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."employee_territories" as employee_territories_s
 { 
   create csv_northwind:qm-employee_territories as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.employee_territories"
      csv_northwind:employee_territories (employee_territories_s."employeeID")  a csv_northwind:employee_territories ;
      csv_northwind:employeeid employee_territories_s."employeeID" as csv_northwind:northwind-employee_territories-employeeid ;
      csv_northwind:territoryid employee_territories_s."territoryID" as csv_northwind:northwind-employee_territories-territoryid .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."employees" as employees_s
 { 
   create csv_northwind:qm-employees as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.employees"
      csv_northwind:employees (employees_s."employeeID")  a csv_northwind:employees ;
      csv_northwind:employeeid employees_s."employeeID" as csv_northwind:northwind-employees-employeeid ;
      csv_northwind:lastname employees_s."lastName" as csv_northwind:northwind-employees-lastname ;
      csv_northwind:firstname employees_s."firstName" as csv_northwind:northwind-employees-firstname ;
      csv_northwind:title employees_s."title" as csv_northwind:northwind-employees-title ;
      csv_northwind:titleofcourtesy employees_s."titleOfCourtesy" as csv_northwind:northwind-employees-titleofcourtesy ;
      csv_northwind:birthdate employees_s."birthDate" as csv_northwind:northwind-employees-birthdate ;
      csv_northwind:hiredate employees_s."hireDate" as csv_northwind:northwind-employees-hiredate ;
      csv_northwind:address employees_s."address" as csv_northwind:northwind-employees-address ;
      csv_northwind:city employees_s."city" as csv_northwind:northwind-employees-city ;
      csv_northwind:region employees_s."region" as csv_northwind:northwind-employees-region ;
      csv_northwind:postalcode employees_s."postalCode" as csv_northwind:northwind-employees-postalcode ;
      csv_northwind:country employees_s."country" as csv_northwind:northwind-employees-country ;
      csv_northwind:homephone employees_s."homePhone" as csv_northwind:northwind-employees-homephone ;
      csv_northwind:extension employees_s."extension" as csv_northwind:northwind-employees-extension ;
      csv_northwind:photo csv_northwind:employees_photo (employees_s."employeeID")  as csv_northwind:northwind-employees-photo ;
      csv_northwind:notes employees_s."notes" as csv_northwind:northwind-employees-notes ;
      csv_northwind:reportsto employees_s."reportsTo" as csv_northwind:northwind-employees-reportsto ;
      csv_northwind:photopath employees_s."photoPath" as csv_northwind:northwind-employees-photopath .
      csv_northwind:employees_photo (employees_s."employeeID")  a aowl:Content ; aowl:body employees_s."photo" as csv_northwind:northwind-employees-photo-content ; aowl:type "image/jpeg" .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."order_details" as order_details_s
 { 
   create csv_northwind:qm-order_details as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.order_details"
      csv_northwind:order_details (order_details_s."orderID")  a csv_northwind:order_details ;
      csv_northwind:orderid order_details_s."orderID" as csv_northwind:northwind-order_details-orderid ;
      csv_northwind:productid order_details_s."productID" as csv_northwind:northwind-order_details-productid ;
      csv_northwind:unitprice order_details_s."unitPrice" as csv_northwind:northwind-order_details-unitprice ;
      csv_northwind:quantity order_details_s."quantity" as csv_northwind:northwind-order_details-quantity ;
      csv_northwind:discount order_details_s."discount" as csv_northwind:northwind-order_details-discount .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."orders" as orders_s
 { 
   create csv_northwind:qm-orders as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.orders"
      csv_northwind:orders (orders_s."orderID")  a csv_northwind:orders ;
      csv_northwind:orderid orders_s."orderID" as csv_northwind:northwind-orders-orderid ;
      csv_northwind:customerid orders_s."customerID" as csv_northwind:northwind-orders-customerid ;
      csv_northwind:employeeid orders_s."employeeID" as csv_northwind:northwind-orders-employeeid ;
      csv_northwind:orderdate orders_s."orderDate" as csv_northwind:northwind-orders-orderdate ;
      csv_northwind:requireddate orders_s."requiredDate" as csv_northwind:northwind-orders-requireddate ;
      csv_northwind:shippeddate orders_s."shippedDate" as csv_northwind:northwind-orders-shippeddate ;
      csv_northwind:shipvia orders_s."shipVia" as csv_northwind:northwind-orders-shipvia ;
      csv_northwind:freight orders_s."freight" as csv_northwind:northwind-orders-freight ;
      csv_northwind:shipname orders_s."shipName" as csv_northwind:northwind-orders-shipname ;
      csv_northwind:shipaddress orders_s."shipAddress" as csv_northwind:northwind-orders-shipaddress ;
      csv_northwind:shipcity orders_s."shipCity" as csv_northwind:northwind-orders-shipcity ;
      csv_northwind:shipregion orders_s."shipRegion" as csv_northwind:northwind-orders-shipregion ;
      csv_northwind:shippostalcode orders_s."shipPostalCode" as csv_northwind:northwind-orders-shippostalcode ;
      csv_northwind:shipcountry orders_s."shipCountry" as csv_northwind:northwind-orders-shipcountry .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."products" as products_s
 { 
   create csv_northwind:qm-products as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.products"
      csv_northwind:products (products_s."productID")  a csv_northwind:products ;
      csv_northwind:productid products_s."productID" as csv_northwind:northwind-products-productid ;
      csv_northwind:productname products_s."productName" as csv_northwind:northwind-products-productname ;
      csv_northwind:supplierid products_s."supplierID" as csv_northwind:northwind-products-supplierid ;
      csv_northwind:categoryid products_s."categoryID" as csv_northwind:northwind-products-categoryid ;
      csv_northwind:quantityperunit products_s."quantityPerUnit" as csv_northwind:northwind-products-quantityperunit ;
      csv_northwind:unitprice products_s."unitPrice" as csv_northwind:northwind-products-unitprice ;
      csv_northwind:unitsinstock products_s."unitsInStock" as csv_northwind:northwind-products-unitsinstock ;
      csv_northwind:unitsonorder products_s."unitsOnOrder" as csv_northwind:northwind-products-unitsonorder ;
      csv_northwind:reorderlevel products_s."reorderLevel" as csv_northwind:northwind-products-reorderlevel ;
      csv_northwind:discontinued products_s."discontinued" as csv_northwind:northwind-products-discontinued .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."regions" as regions_s
 { 
   create csv_northwind:qm-regions as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.regions"
      csv_northwind:regions (regions_s."regionID")  a csv_northwind:regions ;
      csv_northwind:regionid regions_s."regionID" as csv_northwind:northwind-regions-regionid ;
      csv_northwind:regiondescription regions_s."regionDescription" as csv_northwind:northwind-regions-regiondescription .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."shippers" as shippers_s
 { 
   create csv_northwind:qm-shippers as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.shippers"
      csv_northwind:shippers (shippers_s."shipperID")  a csv_northwind:shippers ;
      csv_northwind:shipperid shippers_s."shipperID" as csv_northwind:northwind-shippers-shipperid ;
      csv_northwind:companyname shippers_s."companyName" as csv_northwind:northwind-shippers-companyname ;
      csv_northwind:phone shippers_s."phone" as csv_northwind:northwind-shippers-phone .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."suppliers" as suppliers_s
 { 
   create csv_northwind:qm-suppliers as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.suppliers"
      csv_northwind:suppliers (suppliers_s."supplierID")  a csv_northwind:suppliers ;
      csv_northwind:supplierid suppliers_s."supplierID" as csv_northwind:northwind-suppliers-supplierid ;
      csv_northwind:companyname suppliers_s."companyName" as csv_northwind:northwind-suppliers-companyname ;
      csv_northwind:contactname suppliers_s."contactName" as csv_northwind:northwind-suppliers-contactname ;
      csv_northwind:contacttitle suppliers_s."contactTitle" as csv_northwind:northwind-suppliers-contacttitle ;
      csv_northwind:address suppliers_s."address" as csv_northwind:northwind-suppliers-address ;
      csv_northwind:city suppliers_s."city" as csv_northwind:northwind-suppliers-city ;
      csv_northwind:region suppliers_s."region" as csv_northwind:northwind-suppliers-region ;
      csv_northwind:postalcode suppliers_s."postalCode" as csv_northwind:northwind-suppliers-postalcode ;
      csv_northwind:country suppliers_s."country" as csv_northwind:northwind-suppliers-country ;
      csv_northwind:phone suppliers_s."phone" as csv_northwind:northwind-suppliers-phone ;
      csv_northwind:fax suppliers_s."fax" as csv_northwind:northwind-suppliers-fax ;
      csv_northwind:homepage suppliers_s."homePage" as csv_northwind:northwind-suppliers-homepage .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."territories" as territories_s
 { 
   create csv_northwind:qm-territories as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#")  
    { 
      # Maps from columns of "csv.Northwind.territories"
      csv_northwind:territories (territories_s."territoryID",territories_s."territoryDescription")  a csv_northwind:territories ;
      csv_northwind:territoryid territories_s."territoryID" as csv_northwind:northwind-territories-territoryid ;
      csv_northwind:territorydescription territories_s."territoryDescription" as csv_northwind:northwind-territories-territorydescription ;
      csv_northwind:regionid territories_s."regionID" as csv_northwind:northwind-territories-regionid .

    }
 }

;

SPARQL
prefix csv_northwind: <http://demo.openlinksw.com/schemas/csv_northwind/> 
prefix csv_northwind-stat: <http://demo.openlinksw.com/csv_northwind/stat#> 
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix void: <http://rdfs.org/ns/void#> 
prefix scovo: <http://purl.org/NET/scovo#> 
prefix aowl: <http://bblfish.net/work/atom-owl/2006-06-06/> 
alter quad storage virtrdf:DefaultQuadStorage 
 from "csv"."Northwind"."categoriesCount" as categoriescount_s
 from "csv"."Northwind"."customersCount" as customerscount_s
 from "csv"."Northwind"."employee_territoriesCount" as employee_territoriescount_s
 from "csv"."Northwind"."employeesCount" as employeescount_s
 from "csv"."Northwind"."order_detailsCount" as order_detailscount_s
 from "csv"."Northwind"."ordersCount" as orderscount_s
 from "csv"."Northwind"."productsCount" as productscount_s
 from "csv"."Northwind"."regionsCount" as regionscount_s
 from "csv"."Northwind"."shippersCount" as shipperscount_s
 from "csv"."Northwind"."suppliersCount" as supplierscount_s
 from "csv"."Northwind"."territoriesCount" as territoriescount_s
 from "csv"."Northwind"."csv_northwind__Total" as csv_northwind__total_s
 { 
   create csv_northwind:qm-VoidStatistics as graph iri ("http://^{URIQADefaultHost}^/csv_northwind#") option (exclusive) 
    { 
      # voID Statistics 
      csv_northwind-stat: a void:Dataset as csv_northwind:dataset-csv ; 
       void:sparqlEndpoint <http://demo.openlinksw.com/sparql> as csv_northwind:dataset-sparql-csv ; 
      void:statItem csv_northwind-stat:Stat . 
      csv_northwind-stat:Stat a scovo:Item ; 
       rdf:value csv_northwind__total_s.cnt as csv_northwind:stat-decl-csv ; 
       scovo:dimension void:numOfTriples . 

      csv_northwind-stat: void:statItem csv_northwind-stat:categoriesStat as csv_northwind:statitem-csv-categories . 
      csv_northwind-stat:categoriesStat a scovo:Item as csv_northwind:statitem-decl-csv-categories ; 
      rdf:value categoriescount_s.cnt as csv_northwind:statitem-cnt-csv-categories ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-categories ; 
      scovo:dimension csv_northwind:categories as csv_northwind:statitem-type-2-csv-categories .

      csv_northwind-stat: void:statItem csv_northwind-stat:customersStat as csv_northwind:statitem-csv-customers . 
      csv_northwind-stat:customersStat a scovo:Item as csv_northwind:statitem-decl-csv-customers ; 
      rdf:value customerscount_s.cnt as csv_northwind:statitem-cnt-csv-customers ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-customers ; 
      scovo:dimension csv_northwind:customers as csv_northwind:statitem-type-2-csv-customers .

      csv_northwind-stat: void:statItem csv_northwind-stat:employee_territoriesStat as csv_northwind:statitem-csv-employee_territories . 
      csv_northwind-stat:employee_territoriesStat a scovo:Item as csv_northwind:statitem-decl-csv-employee_territories ; 
      rdf:value employee_territoriescount_s.cnt as csv_northwind:statitem-cnt-csv-employee_territories ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-employee_territories ; 
      scovo:dimension csv_northwind:employee_territories as csv_northwind:statitem-type-2-csv-employee_territories .

      csv_northwind-stat: void:statItem csv_northwind-stat:employeesStat as csv_northwind:statitem-csv-employees . 
      csv_northwind-stat:employeesStat a scovo:Item as csv_northwind:statitem-decl-csv-employees ; 
      rdf:value employeescount_s.cnt as csv_northwind:statitem-cnt-csv-employees ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-employees ; 
      scovo:dimension csv_northwind:employees as csv_northwind:statitem-type-2-csv-employees .

      csv_northwind-stat: void:statItem csv_northwind-stat:order_detailsStat as csv_northwind:statitem-csv-order_details . 
      csv_northwind-stat:order_detailsStat a scovo:Item as csv_northwind:statitem-decl-csv-order_details ; 
      rdf:value order_detailscount_s.cnt as csv_northwind:statitem-cnt-csv-order_details ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-order_details ; 
      scovo:dimension csv_northwind:order_details as csv_northwind:statitem-type-2-csv-order_details .

      csv_northwind-stat: void:statItem csv_northwind-stat:ordersStat as csv_northwind:statitem-csv-orders . 
      csv_northwind-stat:ordersStat a scovo:Item as csv_northwind:statitem-decl-csv-orders ; 
      rdf:value orderscount_s.cnt as csv_northwind:statitem-cnt-csv-orders ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-orders ; 
      scovo:dimension csv_northwind:orders as csv_northwind:statitem-type-2-csv-orders .

      csv_northwind-stat: void:statItem csv_northwind-stat:productsStat as csv_northwind:statitem-csv-products . 
      csv_northwind-stat:productsStat a scovo:Item as csv_northwind:statitem-decl-csv-products ; 
      rdf:value productscount_s.cnt as csv_northwind:statitem-cnt-csv-products ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-products ; 
      scovo:dimension csv_northwind:products as csv_northwind:statitem-type-2-csv-products .

      csv_northwind-stat: void:statItem csv_northwind-stat:regionsStat as csv_northwind:statitem-csv-regions . 
      csv_northwind-stat:regionsStat a scovo:Item as csv_northwind:statitem-decl-csv-regions ; 
      rdf:value regionscount_s.cnt as csv_northwind:statitem-cnt-csv-regions ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-regions ; 
      scovo:dimension csv_northwind:regions as csv_northwind:statitem-type-2-csv-regions .

      csv_northwind-stat: void:statItem csv_northwind-stat:shippersStat as csv_northwind:statitem-csv-shippers . 
      csv_northwind-stat:shippersStat a scovo:Item as csv_northwind:statitem-decl-csv-shippers ; 
      rdf:value shipperscount_s.cnt as csv_northwind:statitem-cnt-csv-shippers ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-shippers ; 
      scovo:dimension csv_northwind:shippers as csv_northwind:statitem-type-2-csv-shippers .

      csv_northwind-stat: void:statItem csv_northwind-stat:suppliersStat as csv_northwind:statitem-csv-suppliers . 
      csv_northwind-stat:suppliersStat a scovo:Item as csv_northwind:statitem-decl-csv-suppliers ; 
      rdf:value supplierscount_s.cnt as csv_northwind:statitem-cnt-csv-suppliers ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-suppliers ; 
      scovo:dimension csv_northwind:suppliers as csv_northwind:statitem-type-2-csv-suppliers .

      csv_northwind-stat: void:statItem csv_northwind-stat:territoriesStat as csv_northwind:statitem-csv-territories . 
      csv_northwind-stat:territoriesStat a scovo:Item as csv_northwind:statitem-decl-csv-territories ; 
      rdf:value territoriescount_s.cnt as csv_northwind:statitem-cnt-csv-territories ; 
      scovo:dimension void:numberOfResources as csv_northwind:statitem-type-1-csv-territories ; 
      scovo:dimension csv_northwind:territories as csv_northwind:statitem-type-2-csv-territories .

    }
 }
;



-- Virtual directories for instance data
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'csv_northwind_rule2',
1,
'(/[^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/csv_northwind%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'csv_northwind_rule4',
1,
'/csv_northwind/stat([^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/csv_northwind/stat%%23%%3E+%%3Fo+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/csv_northwind%%23%%3E+WHERE+{+%%3Chttp%%3A//^{URIQADefaultHost}^/csv_northwind/stat%%23%%3E+%%3Fp+%%3Fo+}&format=%U',
vector('*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'csv_northwind_rule6',
1,
'/csv_northwind/objects/([^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^/csv_northwind/objects/%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/csv_northwind%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'csv_northwind_rule1',
1,
'([^#]*)',
vector('path'),
1,
'/describe/?url=http%%3A//^{URIQADefaultHost}^%U%%23this&graph=http%%3A//^{URIQADefaultHost}^/csv_northwind%%23&distinct=0',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'csv_northwind_rule7',
1,
'/csv_northwind/stat([^#]*)',
vector('path'),
1,
'/describe/?url=http%%3A//^{URIQADefaultHost}^/csv_northwind/stat%%23&graph=http%%3A//^{URIQADefaultHost}^/csv_northwind%%23',
vector('path'),
null,
null,
2,
303
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'csv_northwind_rule5',
1,
'/csv_northwind/objects/(.*)',
vector('path'),
1,
'/services/rdf/object.binary?path=%%2Fcsv_northwind%%2Fobjects%%2F%U&accept=%U',
vector('path', '*accept*'),
null,
null,
2,
null
);
DB.DBA.URLREWRITE_CREATE_RULELIST ( 'csv_northwind_rule_list1', 1, vector ( 'csv_northwind_rule1', 'csv_northwind_rule7', 'csv_northwind_rule5', 'csv_northwind_rule2', 'csv_northwind_rule4', 'csv_northwind_rule6'));
DB.DBA.VHOST_REMOVE (lpath=>'/csv_northwind');
DB.DBA.VHOST_DEFINE (lpath=>'/csv_northwind', ppath=>'/', vsp_user=>'dba', is_dav=>0,
is_brws=>0, opts=>vector ('url_rewrite', 'csv_northwind_rule_list1')
);

-- Virtual directories for ontology
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'csv_northwind_owl_rule2',
1,
'(/[^#]*)',
vector('path'),
1,
'/sparql?query=DESCRIBE+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%3E+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/schemas/csv_northwind%%23%%3E&format=%U',
vector('path', '*accept*'),
null,
'(text/rdf.n3)|(application/rdf.xml)|(text/n3)|(application/json)',
2,
null
);
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
'csv_northwind_owl_rule1',
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
DB.DBA.URLREWRITE_CREATE_RULELIST ( 'csv_northwind_owl_rule_list1', 1, vector ( 'csv_northwind_owl_rule1', 'csv_northwind_owl_rule2'));
DB.DBA.VHOST_REMOVE (lpath=>'/schemas/csv_northwind');
DB.DBA.VHOST_DEFINE (lpath=>'/schemas/csv_northwind', ppath=>'/', vsp_user=>'dba', is_dav=>0,
is_brws=>0, opts=>vector ('url_rewrite', 'csv_northwind_owl_rule_list1')
);
