-- Download the Northwind Database as a collection of CSV Documents from
-- http://bitnine.net/tutorial/import-northwind-dataset.zip
-- Goto to your /tmp directory and then execute
-- curl -O http://bitnine.net/tutorial/import-northwind-dataset.zip ;
-- unzip import-northwind-dataset.zip 
-- then cd to import-northwind-dataset folder
-- and execute: cp *.csv ~virtuoso/vad  
-- then run the rest of this script, verbatim

-- ATTACH CATEGORIES TABLE

DROP TABLE csv.northwind.categories;
attach_from_csv ('csv.northwind.categories', 'file:../vad/categories.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.categories;

--ATTACH CUSTOMERS TABLE

DROP TABLE csv.northwind.customers;
attach_from_csv ('csv.northwind.customers', 'file:../vad/customers.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.customers;


--ATTACH EMPLOYEE TERRITORY TABLE

DROP TABLE csv.northwind.employee_territories;
attach_from_csv ('csv.northwind.employee_territories', 'file:../vad/employee_territories.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.employee_territories;


--ATTACH EMPLOYEES TABLE

DROP TABLE csv.northwind.employees;
attach_from_csv ('csv.northwind.employees', 'file:../vad/employees.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.employees;


--ATTACH ORDER DETAILS TABLE

DROP TABLE csv.northwind.order_details;
attach_from_csv ('csv.northwind.order_details', 'file:../vad/order_details.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.order_details;


--ATTACH ORDERS TABLE

DROP TABLE csv.northwind.orders;
attach_from_csv ('csv.northwind.orders', 'file:../vad/orders.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.orders;

--ATTACH PRODUCTS TABLE

DROP TABLE csv.northwind.products;
attach_from_csv ('csv.northwind.products', 'file:../vad/products.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.products;

--ATTACH REGIONS TABLE

DROP TABLE csv.northwind.regions;
attach_from_csv ('csv.northwind.regions', 'file:../vad/regions.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.regions;

--ATTACH REGIONS TABLE

DROP TABLE csv.northwind.regions;
attach_from_csv ('csv.northwind.regions', 'file:../vad/regions.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.regions;

--ATTACH SHIPPERS TABLE

DROP TABLE csv.northwind.shippers;
attach_from_csv ('csv.northwind.shippers', 'file:../vad/shippers.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.shippers;

--ATTACH SUPPLIERS TABLE

DROP TABLE csv.northwind.suppliers;
attach_from_csv ('csv.northwind.suppliers', 'file:../vad/suppliers.csv', ',', '\n', null, 1, vector(1));
SELECT TOP 5 * FROM csv.northwind.suppliers;


--ATTACH TERRITORIES TABLE

DROP TABLE csv.northwind.territories;
attach_from_csv ('csv.northwind.territories', 'file:../vad/territories.csv', ',', '\n', null, 1, vector(1,2));
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
