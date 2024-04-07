CREATE TABLE orders (
    order_id VARCHAR(10),
    customer_id VARCHAR(10),
    order_date DATE,
    product_id VARCHAR(10),
    quantity INT
);

CREATE TABLE returns (
    return_id VARCHAR(10),
    order_id VARCHAR(10)
    );
	
	
INSERT INTO orders (order_id, customer_id, order_date, product_id, quantity)
VALUES
    ('1001', 'C001', '2023-01-15', 'P001', 4),
    ('1002', 'C001', '2023-02-20', 'P002', 3),
    ('1003', 'C002', '2023-03-10', 'P003', 8),
    ('1004', 'C003', '2023-04-05', 'P004', 2),
    ('1005', 'C004', '2023-05-20', 'P005', 3),
    ('1006', 'C002', '2023-06-15', 'P001', 6),
    ('1007', 'C003', '2023-07-20', 'P002', 1),
    ('1008', 'C004', '2023-08-10', 'P003', 2),
    ('1009', 'C005', '2023-09-05', 'P002', 3),
    ('1010', 'C001', '2023-10-20', 'P002', 1);


INSERT INTO returns (return_id, order_id)
VALUES
    ('R001', '1001'),
    ('R002', '1002'),
    ('R003', '1005'),
    ('R004', '1008'),
    ('R005', '1007');
	
	
---Identify returning customers based on their order history. 
--Categorize customers as "Returning" if they have placed more than one return, 
--and as "New" otherwise. 

-- no of return for each cx
-- orders and return
-- CASE cnt > 1 then Returning else new


SELECT * FROM ORDERS
SELECT * FROM RETURNS


SELECT o.CUSTOMER_ID,
	   COUNT(o.ORDER_ID) AS NO_of_Orders,
	   COUNT(r.RETURN_ID) AS No_of_Returns,
	   CASE
	   		WHEN COUNT(r.RETURN_ID)> 1 THEN 'Returning Customer'
			ELSE 'New_Customer'
		END AS Type_of_Customer
FROM ORDERS o
LEFT JOIN RETURNS r on o.order_id=r.order_id
GROUP BY o.customer_id




--Task:
--Categorize products based on their quantity sold into three categories:
--"Low Demand": Quantity sold less than or equal to 5.
--"Medium Demand": Quantity sold between 6 and 10 (inclusive).
--"High Demand": Quantity sold greater than 10.
--Expected Output: 
--Product ID
--Product Name
--Quantity Sold
--Demand Category


SELECT 
	   product_id,SUM(quantity) AS Total_Quantity,
	   CASE
	   		WHEN SUM(quantity) <= 5 THEN 'Low Demand'
			WHEN SUM(quantity) BETWEEN 6 AND 10 THEN 'Medium Demand'
			ELSE 'High Demand'
		END AS Demand_Category
FROM ORDERS 
GROUP BY product_id
ORDER BY product_id