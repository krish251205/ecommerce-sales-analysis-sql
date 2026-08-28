# E-Commerce Sales Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing an E-Commerce database using MySQL and SQL queries to generate meaningful business insights.

The database contains information about customers, products, categories, orders, order details, reviews, shipping, discounts, and coupons. The project demonstrates how SQL can be used to analyze sales performance, customer purchasing behavior, product performance, inventory, reviews, and pricing.

---

## 🎯 Project Objectives

- Analyze E-Commerce sales and customer data using SQL.
- Identify top and low-performing products.
- Analyze customer purchasing behavior and spending.
- Calculate product sales and quantities sold.
- Analyze product reviews and ratings.
- Evaluate product stock and inventory levels.
- Analyze product prices and discounts.
- Answer business-oriented questions using SQL queries.

---

## 🗂️ Database Schema

The project contains the following tables:

- **Categories** – Stores product category information.
- **Products** – Contains product names, prices, stock quantities, and categories.
- **Customers** – Stores customer details.
- **Orders** – Contains customer order information and order dates.
- **OrderDetails** – Stores products and quantities associated with each order.
- **Reviews** – Contains customer ratings and product reviews.
- **Shipping** – Stores shipping and delivery information.
- **Discounts** – Contains product discount information.
- **Coupons** – Stores coupon discount information.

### Table Relationships

```text
Categories
    │
    └── Products
            │
            ├── OrderDetails ── Orders ── Customers
            │
            ├── Reviews ────── Customers
            │
            └── Discounts

Orders ── Shipping
```

---

## 🛠️ Technologies Used

- **MySQL**
- **SQL**
- **MySQL Workbench**

---

## 📊 SQL Concepts Demonstrated

This project demonstrates the practical use of:

- SELECT statements
- WHERE clause
- ORDER BY
- GROUP BY
- HAVING
- LIMIT
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- UNION
- Aggregate Functions
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- CASE statements
- Subqueries
- IN / NOT IN
- Date Functions
- Primary Keys
- Foreign Keys
- Relational Database Design

---

## 🔍 Analysis Performed

### 👥 Customer Analysis

- Calculated the total number of orders placed by each customer.
- Identified customers who placed more than two orders.
- Found customers and their latest order dates.
- Identified customers who have not placed any orders.
- Calculated total spending for each customer.
- Identified the top 5 highest-spending customers.
- Identified customers with spending above ₹100,000.
- Identified the highest and lowest spending customers.

### 📦 Product Analysis

- Calculated the total quantity sold for each product.
- Identified the top 10 most-sold products.
- Identified the most and least sold products.
- Identified products that have never been ordered.
- Identified products that have never received reviews.
- Found products priced above the average product price.
- Identified the most expensive and least expensive products.
- Analyzed products with stock levels above the average.

### ⭐ Review Analysis

- Calculated average review ratings for products.
- Identified products with high ratings.
- Found customers who reviewed products with a rating of 5.
- Identified products that have never received reviews.

### 💰 Sales & Revenue Analysis

- Calculated total customer spending.
- Calculated total product quantities sold.
- Analyzed revenue based on product price and quantity sold.
- Analyzed revenue by weekday and year.
- Identified high-value customers based on spending.

### 🏷️ Pricing & Discount Analysis

- Identified products with discounts greater than ₹100.
- Classified products into:
  - High Price Products
  - Medium Price Products
  - Budget Products
- Calculated average, minimum, and maximum product prices.

### 📦 Inventory Analysis

- Calculated total inventory stock.
- Calculated average stock quantity.
- Identified products with stock above average.
- Classified products based on stock quantity using CASE statements.

---

## 💡 Sample SQL Queries

### 1. Top 5 Highest-Spending Customers

```sql
SELECT 
    c.cst_ID,
    c.cst_Name,
    SUM(od.od_Quantity * p.prd_Price) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.cst_ID = o.cst_ID
INNER JOIN OrderDetails od
    ON o.ord_ID = od.ord_ID
INNER JOIN Products p
    ON od.prd_ID = p.prd_ID
GROUP BY c.cst_ID, c.cst_Name
ORDER BY Total_Spent DESC
LIMIT 5;
```

This query combines multiple tables using INNER JOIN and calculates total customer spending using aggregate functions.

---

### 2. Most-Sold Products

```sql
SELECT 
    p.prd_Name,
    p.prd_Price,
    SUM(od.od_Quantity) AS Total_Sold
FROM Products p
INNER JOIN OrderDetails od
    ON p.prd_ID = od.prd_ID
GROUP BY p.prd_Name, p.prd_Price
ORDER BY Total_Sold DESC
LIMIT 10;
```

This query identifies the top 10 products based on total quantity sold.

---

### 3. Products with Above-Average Price

```sql
SELECT
    prd_ID,
    prd_Name
FROM Products p1
WHERE prd_Price > 
(
    SELECT AVG(prd_Price)
    FROM Products p2
);
```

This query uses a subquery to identify products priced above the average product price.

---

### 4. Customer Spending Above ₹100,000

```sql
SELECT 
    c.cst_ID,
    c.cst_Name,
    SUM(od.od_Quantity * p.prd_Price) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.cst_ID = o.cst_ID
INNER JOIN OrderDetails od
    ON o.ord_ID = od.ord_ID
INNER JOIN Products p
    ON od.prd_ID = p.prd_ID
GROUP BY c.cst_ID, c.cst_Name
HAVING Total_Spent > 100000;
```

This query identifies high-value customers based on their total spending.

---

### 5. Product Stock Classification

```sql
SELECT 
    prd_ID,
    prd_Name,
    prd_StockQuantity,
    CASE 
        WHEN prd_StockQuantity > 50 THEN 'Available'
        WHEN prd_StockQuantity <= 50 
             AND prd_StockQuantity > 10 THEN 'Low Stock'
        WHEN prd_StockQuantity < 10 THEN 'Out of Stock'
    END AS stock_status
FROM Products;
```

This query uses a CASE statement to classify products based on their inventory levels.

---

## 📈 Key Business Insights

The analysis helps identify:

- Which products generate the highest sales volume.
- Which customers contribute the most revenue.
- Which customers have not made any purchases.
- Which products have low or high inventory levels.
- Which products have strong customer ratings.
- Which products have never been ordered.
- Which products have never received reviews.
- How product pricing varies across the catalog.
- Which products offer discounts greater than ₹100.
- How revenue varies across different weekdays.

---

## 📁 Project Structure

```text
ecommerce-sales-analysis-sql/
│
├── README.md
│
└── sqlfinalproject.sql
```

---

## 🚀 How to Run the Project

### Step 1: Install MySQL

Install MySQL Server and MySQL Workbench.

### Step 2: Open the SQL File

Open `sqlfinalproject.sql` in MySQL Workbench.

### Step 3: Execute the Script

Run the SQL script to:

- Create the E-Commerce database.
- Create the required tables.
- Define primary and foreign key relationships.
- Insert sample data.
- Execute analytical SQL queries.

### Step 4: Explore the Analysis

Run the individual SQL queries to explore customer, product, sales, reviews, inventory, pricing, and discount analysis.

---

## 📚 Skills Demonstrated

**SQL | MySQL | Data Analysis | Relational Databases | Data Aggregation | SQL Joins | Subqueries | Business Analysis | Customer Analysis | Sales Analysis | Product Analysis**

---

## 🔮 Future Improvements

- Create an interactive **Power BI dashboard** using the E-Commerce data.
- Add advanced SQL queries using **CTEs and Window Functions**.
- Create SQL Views for frequently used analysis.
- Perform customer segmentation.
- Add monthly and yearly sales trend analysis.
- Add additional business KPIs.
- Connect the database to Power BI for interactive reporting.

---

## 👤 Author

**Your Name**

Aspiring Data Analyst | Data Science Enthusiast

**Technical Skills:**  
Python | SQL | Power BI | Excel | Pandas | NumPy | Machine Learning
