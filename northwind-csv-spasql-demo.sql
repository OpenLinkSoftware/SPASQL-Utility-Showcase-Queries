-- Download the Northwind Database as a collection of CSV Documents from
-- http://bitnine.net/tutorial/import-northwind-dataset.zip
-- Goto to your /tmp directory and then execute
-- curl -O http://bitnine.net/tutorial/import-northwind-dataset.zip ;
-- unzip import-northwind-dataset.zip 
-- then cd to import-northwind-dataset folder
-- and execute: cp *.csv ~virtuoso/vad  
-- then run the rest of this script, verbatim
-- The following should exist at the end of the process, based on our demo database instance

-- Transient Views: http://demo.openlinksw.com/csv_northwind#
-- http://demo.openlinksw.com/csv_northwind/categories/categoryID/1#this
-- http://demo.openlinksw.com/csv_northwind/objects/categories/categoryID/1/picture.jpe
-- http://demo.openlinksw.com/csv_northwind/customers/customerID/ALFKI#this
-- http://demo.openlinksw.com/csv_northwind/employee_territories/employeeID/1#this
-- http://demo.openlinksw.com/csv_northwind/employees/employeeID/1#this
-- http://demo.openlinksw.com/csv_northwind/order_details/orderID/10248#this
-- http://demo.openlinksw.com/csv_northwind/orders/orderID/10248#this
-- http://demo.openlinksw.com/csv_northwind/products/productID/1#this
-- http://demo.openlinksw.com/csv_northwind/regions/regionID/1#this
-- http://demo.openlinksw.com/csv_northwind/shippers/shipperID/1#this
-- Metadata Data Document (VoiD) URI/URL: http://demo.openlinksw.com/csv_northwind/stat#
-- Linked Data Ontology URI: http://demo.openlinksw.com/schemas/csv_northwind/

-- ATTACH CATEGORIES TABLE

DROP TABLE csv.northwind.categories;
ATTACH_FROM_CSV ('csv.northwind.categories', 'file:../vad/categories.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.categories;

--ATTACH CUSTOMERS TABLE

DROP TABLE csv.northwind.customers;
ATTACH_FROM_CSV ('csv.northwind.customers', 'file:../vad/customers.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.customers;


--ATTACH EMPLOYEE TERRITORY TABLE

DROP TABLE csv.northwind.employee_territories;
ATTACH_FROM_CSV ('csv.northwind.employee_territories', 'file:../vad/employee_territories.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.employee_territories;


--ATTACH EMPLOYEES TABLE

DROP TABLE csv.northwind.employees;
ATTACH_FROM_CSV ('csv.northwind.employees', 'file:../vad/employees.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.employees;


--ATTACH ORDER DETAILS TABLE

DROP TABLE csv.northwind.order_details;
ATTACH_FROM_CSV ('csv.northwind.orders_details', 'file:../vad/orders_details.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.orders_details;


--ATTACH ORDERS TABLE

DROP TABLE csv.northwind.orders;
ATTACH_FROM_CSV ('csv.northwind.orders', 'file:../vad/orders.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.orders;

--ATTACH PRODUCTS TABLE

DROP TABLE csv.northwind.products;
ATTACH_FROM_CSV ('csv.northwind.products', 'file:../vad/products.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.products;

--ATTACH REGIONS TABLE

DROP TABLE csv.northwind.regions;
ATTACH_FROM_CSV ('csv.northwind.regions', 'file:../vad/regions.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.regions;

--ATTACH REGIONS TABLE

DROP TABLE csv.northwind.regions;
ATTACH_FROM_CSV ('csv.northwind.regions', 'file:../vad/regions.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.regions;

--ATTACH SHIPPERS TABLE

DROP TABLE csv.northwind.shippers;
ATTACH_FROM_CSV ('csv.northwind.shippers', 'file:../vad/shippers.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.shippers;

--ATTACH SUPPLIERS TABLE

DROP TABLE csv.northwind.suppliers;
ATTACH_FROM_CSV ('csv.northwind.suppliers', 'file:../vad/suppliers.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.suppliers;


--ATTACH TERRITORIES TABLE

DROP TABLE csv.northwind.territories;
ATTACH_FROM_CSV ('csv.northwind.territories', 'file:../vad/territories.csv', ',', '\n', null, 1, vector(1,2));
SELECT TOP 5 * FROM csv.northwind.territories;


--CREATE VIEW

-- Generate SPARQL of Order CSV

SPARQL 
DEFINE
get:soft "replace"
SELECT * 
FROM <file://../vad/order_details.csv>
	{
		?s ?p ?o.
	}

Limit 100;


--CREATE RDF VIEW
DROP TABLE csv.northwind.sparql_order_details;

CREATE VIEW csv.northwind.sparql_order_details AS
SPARQL 
SELECT 
		?orderID
		?productID
		?unitPrice
		?quantity
		?discount

FROM <file://../vad/order_details.csv>
WHERE
	{
		?s a <file://../vad/order_details.csv#class>;
		<file://../vad/order_details.csv#productID> ?orderID;
		<file://../vad/order_details.csv#productID> ?productID;
		<file://../vad/order_details.csv#unitPrice> ?unitPrice;
		<file://../vad/order_details.csv#productID> ?quantity;
		<file://../vad/order_details.csv#productID> ?discount.
	};

-- Modified Test Query

SELECT TOP 5 Y.orderID
FROM (
SPARQL
SELECT
       ?orderID
       ?productID
       ?unitPrice
       ?quantity
       ?discount

FROM <file://../vad/order_details.csv>
WHERE
   {
       ?s a <file://../vad/order_details.csv#class>;
       <file://../vad/order_details.csv#orderID> ?orderID; 
       <file://../vad/order_details.csv#productID> ?productID;
       <file://../vad/order_details.csv#unitPrice> ?unitPrice;
       <file://../vad/order_details.csv#quantity> ?quantity;
       <file://../vad/order_details.csv#discount> ?discount. 
   }

LIMIT 5 ) 
AS X
INNER JOIN  "csv"."Northwind"."Orders" Y
ON X.orderID = Y.orderID;
