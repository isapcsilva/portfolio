PostgreSQL
-- This is the Product Revenue and Annual Report (2014) of the company 'Silva&Silva', which sales different types of a paper in the US territory. 

-- How many paper units did 'Silva&Silva' sold in 2014? 
SELECT SUM(standard_qty + gloss_qty + poster_qty) paper_sold
FROM orders 
WHERE occurred_at BETWEEN '01-01-2014' AND '01-01-2015';

-- How many orders did 'Silva&Silva' receive in 2014? 
SELECT COUNT(standard_qty + gloss_qty + poster_qty) num_orders
FROM orders 
WHERE occurred_at BETWEEN '01-01-2014' AND '01-01-2015';

-- How many different costumers had ordered from 'Silva&Silva' in 2014? 
SELECT a.name, o.account_id
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE occurred_at BETWEEN '01-01-2014' AND '01-01-2015'
GROUP BY a.name, o.account_id;

-- Which costumers ordered more paper in 2014?
SELECT a.name, SUM (o.total) order_paper
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE o.occurred_at BETWEEN '01-01-2014' AND '01-01-2015'
GROUP BY a.name
ORDER BY order_paper DESC;

-- Which costumers spent more (USD) across all orders in 2014?
SELECT a.name, SUM (o.total_amt_usd) spent_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE o.occurred_at BETWEEN '01-01-2014' AND '01-01-2015'
GROUP BY a.name
ORDER BY spent_usd DESC;

-- Total revenue (USD) in 2014 
SELECT SUM (total_amt_usd) total_revenue
FROM orders 
WHERE occurred_at BETWEEN '01-01-2014' AND '01-01-2015';

-- Average revenue (USD) by costumer/account in 2014
SELECT AVG(total_amt_usd) mean_revenue
FROM orders
WHERE occurred_at BETWEEN '01-01-2014' AND '01-01-2015';

-- Total revenue (USD) by type of paper (standard, gloss, poster)
SELECT SUM(standard_amt_usd) total_standard_usd, SUM(gloss_amt_usd) total_gloss_usd, SUM(poster_amt_usd) total_poster_usd
FROM orders
WHERE occurred_at BETWEEN '01-01-2014' AND '01-01-2015';

