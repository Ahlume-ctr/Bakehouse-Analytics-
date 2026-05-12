-- Databricks notebook source
-- 1. TOP & BOTTOM PERFORMING FRANCHISES BY REVENUE
SELECT
franchiseID,
SUM(totalPrice) AS total_revenue,
COUNT(*) AS transaction_count
FROM samples.bakehouse.sales_transactions
GROUP BY franchiseID
ORDER BY franchiseID ASC;


-- 2. PRODUCTS DRIVING MOST REVENUE
SELECT
product,
SUM(totalPrice) AS total_revenue,
SUM(quantity) AS total_units_sold
FROM samples.bakehouse.sales_transactions
GROUP BY product
ORDER BY total_revenue DESC;


-- 3. PEAK SALES IN DAYS
SELECT
DATE_FORMAT(dateTime, 'EEEE') AS day_of_week,
COUNT(*) AS transaction_count,
SUM(totalPrice) AS total_revenue
FROM samples.bakehouse.sales_transactions
GROUP BY DATE_FORMAT(dateTime, 'EEEE')
ORDER BY day_of_week ASC;


-- 4. MOST POPULAR PAYMENT METHODS
SELECT
paymentMethod,
COUNT(*) AS transaction_count,
SUM(totalPrice) AS total_revenue,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_of_transactions
FROM samples.bakehouse.sales_transactions
GROUP BY paymentMethod
ORDER BY transaction_count DESC;

