
/* Opgave 1 */
SELECT customername, concat(e.firstName,' ', e.lastName) as salesrep
FROM customers c 
INNER JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber;

/* Opgave 2 */
SELECT customername, concat(e.firstName,' ', e.lastName) as salesrep
FROM customers c 
INNER JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber WHERE c.country = 'Italy';

/* Opgave 3 */
SELECT DISTINCT c.country, concat(e.firstName,' ', e.lastName) as salesrep
FROM customers c 
INNER JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber ORDER BY country;

/* Opgave 4 */
SELECT c.customerName, o.orderDate, o.orderNumber 
FROM customers c INNER JOIN orders o
ON c.customerNumber = o.customerNumber;

/* Opgave 5 */
SELECT p.productName, pl.textDescription 
FROM products p 
JOIN productlines pl ON p.productLine = pl.productLine;

/* Opgave 6 */
SELECT e.firstName, e.lastName, o.city, o.country 
FROM employees e 
JOIN offices o ON e.officeCode = o.officeCode;

/* Opgave 7 */ 
SELECT c.customerName, COUNT(o.orderNumber) AS totalOrders 
FROM customers c 
JOIN orders o ON c.customerNumber = o.customerNumber 
GROUP BY c.customerName;

/* Opgave 8 (2 løsninger) */
SELECT c.customername
FROM customers c LEFT JOIN orders o
ON c.customernumber = o.customernumber
WHERE o.customernumber IS NULL;

SELECT customername
FROM customers
WHERE customernumber NOT IN (SELECT customerNumber FROM orders);

/* Opgave 9 */
SELECT c.customerName, o.orderNumber, e.firstName, e.lastName 
FROM customers c 
JOIN orders o ON c.customerNumber = o.customerNumber 
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

/* Opgave 10 */
SELECT o.orderNumber, c.customerName, p.productName, od.quantityOrdered
FROM orderdetails od
INNER JOIN orders o ON od.orderNumber = o.orderNumber
INNER JOIN customers c ON o.customerNumber = c.customerNumber
INNER JOIN products p ON od.productCode = p.productCode;

