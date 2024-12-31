# Flipkart E-commerce SQL Project

![flipkart](https://github.com/user-attachments/assets/f700a268-a85c-46c8-bd23-fdb74ba58ed8)

Welcome to my SQL project, where I analyze real-time data from **Flipkart**! This project uses a dataset of **20,000+ sales records** and additional tables for payments, products, and shipping data to explore and analyze e-commerce transactions, product sales, and customer interactions. The project aims to solve business problems through SQL queries, helping Flipkart make informed decisions.

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Business Problems](#business-problems)
- [SQL Queries & Analysis](#sql-queries--analysis)
- [Getting Started](#getting-started)
- [Questions & Feedback](#questions--feedback)
- [Contact Me](#contact-me)

---

## Introduction

This project demonstrates essential SQL skills by analyzing e-commerce data from **Flipkart**, focusing on sales, payments, products, and customer data. Through SQL, we answer critical business questions, uncover trends, and derive actionable insights that help improve business strategies and customer experiences. The project covers different SQL techniques including **Joins**, **Group By**, **Aggregations**, and **Date Functions**.

## Project Structure

1. **SQL Scripts**: Contains code to create the database schema and write queries for analysis.
2. **Dataset**: Real-time data representing e-commerce transactions, product details, customer information, and shipping status.
3. **Analysis**: SQL queries crafted to solve business problems, each focusing on understanding e-commerce sales and performance.

---

## Database Schema

Here’s an overview of the database structure:

### 1. **Customers Table**
- **customer_id**: Unique identifier for each customer
- **customer_name**: Name of the customer
- **state**: Location (state) of the customer

### 2. **Products Table**
- **product_id**: Unique identifier for each product
- **product_name**: Name of the product
- **price**: Price of the product
- **cogs**: Cost of goods sold
- **category**: Category of the product
- **brand**: Brand name of the product

### 3. **Sales Table**
- **order_id**: Unique order identifier
- **order_date**: Date the order was placed
- **customer_id**: Linked to the `customers` table
- **order_status**: Status of the order (e.g., Completed, Cancelled)
- **product_id**: Linked to the `products` table
- **quantity**: Quantity of products sold
- **price_per_unit**: Price per unit of the product

### 4. **Payments Table**
- **payment_id**: Unique payment identifier
- **order_id**: Linked to the `sales` table
- **payment_date**: Date the payment was made
- **payment_status**: Status of the payment (e.g., Payment Successed, Payment Failed)

### 5. **Shippings Table**
- **shipping_id**: Unique shipping identifier
- **order_id**: Linked to the `sales` table
- **shipping_date**: Date the order was shipped
- **return_date**: Date the order was returned (if applicable)
- **shipping_providers**: Shipping provider (e.g., Ekart, Bluedart)
- **delivery_status**: Status of delivery (e.g., Delivered, Returned)

## Business Problems

The following queries were created to solve specific business questions. Each query is designed to provide insights based on sales, payments, products, and customer data.

### Easy 
1. `Retrieve a list of all customers with their corresponding product names they ordered?`

```sql
SELECT 
	s.customer_id,
	c.customer_name,
	p.product_name
FROM sales s
INNER JOIN customers c ON c.customer_id = s.customer_id
JOIN products p ON p.product_id = s.product_id;
```


2. `List all products and show the details of customers who have placed orders for them. Include products that have no orders`

```sql
SELECT
	s.*,
	c.customer_name,
	p.product_name
FROM sales as s
LEFT JOIN  products as p ON p.product_id = s.product_id
JOIN customers as c ON c.customer_id = s.customer_id;
```

3. `List all orders and their shipping status. Include orders that do not have any shipping records`

```sql
SELECT
	s.*,
	sh.delivery_status
FROM sales s
LEFT JOIN shippings sh ON sh.order_id = s.order_id
where order_status = 'Cancelled';
```


4. `Retrieve all products, including those with no orders, along with their price`
   
```sql
SELECT
	p.product_name,
	s.*
FROM products p
JOIN sales s ON s.product_id = p.product_id
ORDER BY s.order_status ASC;
```


5. `Get a list of all customers who have placed orders, including those with no payment records`
   
```sql
SELECT
	c.customer_name,
	p.*
FROM customers c
FULL OUTER JOIN payments p ON p.payment_id = c.customer_id;
```
   
### Medium to Hard
1. `List all customers who have placed orders where the product category is 'Accessories' and the order status is 'Completed'`

```sql
SELECT
	c.customer_name,
	p.product_name,
	p.category,
	s.order_status
FROM products as p
INNER JOIN sales as s ON s.product_id = p.product_id
INNER JOIN customers as c ON c.customer_id = s.customer_id
WHERE p.category = 'Accessories'  
	AND 
	s.order_status = 'Completed';
```
2. `Find the total quantity of each product ordered by customers from 'Delhi' and only include products with a quantity greater than 5 `

```sql
SELECT
	c.customer_name,
	c.state,
	p.product_name,
	s.quantity,
	SUM(s.quantity)
FROM products as p
INNER JOIN sales as s ON s.product_id = p.product_id
INNER JOIN customers as c ON c.customer_id = s.customer_id
GROUP BY 1, 2, 3, 4
	HAVING 
	c.state = 'Delhi'
	AND
	s.quantity > 5;
```

3. `Get the average payment amount per customer who has placed more than 3 orders`

```sql
WITH total_amt
AS
	(select 
	customer_id,
	sum(price_per_unit * quantity) as total_amt
from sales
group by 1)
SELECT
	s.customer_id,
	s.order_id,
	Avg(t.total_amt) as Average_payment

FROM sales s 
JOIN total_amt t ON t.customer_id = s.customer_id
JOIN payments p ON p.order_id = s.order_id
GROUP BY 1, 2
HAVING
	s.customer_id > 3;
```

5. `Show the total quantity sold per product in the 'Accessories' category where the total quantity sold is greater than 50 and order the results by product name`

```sql
SELECT 
	total_quantity.product_name,
	total_quantity.category,
	total_quantity.quantity_count
FROM  
		(SELECT
			p.product_id,
			p.product_name,
			p.category,
			s.quantity,
		SUM( s.quantity * p.product_id) as quantity_count
		FROM products p 
		INNER JOIN sales s ON s.product_id = p.product_id
		GROUP BY 1, 2, 3, 4) as total_quantity 
WHERE quantity_count >50
	AND
		category = 'Accessories'
ORDER BY total_quantity.product_name
```

7. `identify the best selling top 2 subcategory of each month based on the qty sold in 2023 return the sub cat name and qty sold, total rank, only for completed sales
`
```sql
with brand_sales
AS
(SELECT
	to_char(order_date,'month') as months,
	p.brand,
	SUM(s.quantity * s.price_per_unit) AS net_sale
FROM sales s
INNER JOIN  products p ON p.product_id = s.product_id
WHERE 
	EXTRACT(YEAR FROM s.order_date) = 2023
	AND
	s.order_status = 'Completed'
group by 1, 2),

brand_rank
AS
(SELECT
	*,
	DENSE_RANK() OVER(PARTITION BY months ORDER BY net_sale) as ranks
FROM brand_sales)
SELECT *
FROM brand_rank 
WHERE ranks = 2
;
```
   
---

## SQL Queries & Analysis

The `queries.sql` file contains all SQL queries developed for this project. Each query corresponds to a business problem and demonstrates skills in SQL syntax, data filtering, aggregation, grouping, and ordering.

---

## Getting Started

### Prerequisites
- PostgreSQL (or any SQL-compatible database)
- Basic understanding of SQL

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/flipkart-sql-project.git
   ```
2. **Set Up the Database**:
   - Run the `schema.sql` script to set up tables and insert sample data.

3. **Run Queries**:
   - Execute each query in `queries.sql` to explore and analyze the data.

---

## Questions & Feedback

Feel free to add your questions and code snippets below and submit them as issues for further feedback!

**Example Questions**:
1. **Question**: How can I filter orders placed in the last 6 months?
   **Code Snippet**:
   ```sql
   SELECT * FROM sales
   WHERE order_date >= CURRENT_DATE - INTERVAL '6 months';
   ```

---

## Contact Me

📄 **[Resume][Joré's Resume.docx](https://github.com/user-attachments/files/18280457/Jore.s.Resume.docx)**  
📧 **[Email](jorekusi@gmail.com)**  
📞 **Phone**: +1-313-707-1870  

---

## ERD (Entity-Relationship Diagram)

## Notice:
All customer names and data used in this project are computer-generated using AI and random
functions. They do not represent real data associated with Amazon or any other entity. This
project is solely for learning and educational purposes, and any resemblance to actual persons,
businesses, or events is purely coincidental.

![FlipKart_erd](https://github.com/user-attachments/assets/f42d911d-a997-4837-bca4-ed54f60e952d)

