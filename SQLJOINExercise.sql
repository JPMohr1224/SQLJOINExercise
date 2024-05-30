/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name
 FROM products
 INNER JOIN categories ON categories.CategoryID = products.CategoryID;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products AS p
INNER JOIN reviews AS r
WHERE r.Rating = 5; 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(s.Quantity), e.EmployeeID
FROM employees AS e
INNER JOIN sales AS s 
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name, d.Name
FROM categories AS c
INNER JOIN departments AS d ON c.DepartmentID = d.DepartmentID;
	
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity) AS TotalSold, SUM(sales.PricePerUnit * sales.Quantity) As TotalPrice
From products
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name LIKE 'EAGLES%'
GROUP BY products.Name;

 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Rating, reviews.Reviewer, reviews.Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name = 'Visio TV' LIMIT 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sales.Quantity
FROM employees
LEFT JOIN sales ON employees.EmployeeID = sales.EmployeeID
JOIN products ON sales.ProductID = products.ProductID;