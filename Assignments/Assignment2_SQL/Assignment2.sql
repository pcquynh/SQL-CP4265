USE my_guitar_shop;
SELECT product_code, product_name, list_price, discount_percent
FROM products
ORDER BY list_price DESC;


SELECT concat(last_name, ',',' ', first_name) AS full_name
FROM customers
WHERE last_name REGEXP '^[M-Z]'
ORDER BY last_name;


SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 and list_price < 2000
ORDER BY date_added DESC;


SELECT product_name, list_price, discount_percent,
ROUND(list_price * discount_percent/100, 2) AS discount_amount,
ROUND(list_price - (SELECT discount_amount),2) AS discount_price
FROM products
ORDER BY discount_price DESC
LIMIT 5;


SELECT item_id, item_price, discount_amount,
quantity, item_price * quantity AS price_total, 
discount_amount * quantity AS discount_total, 
(item_price - discount_amount) * quantity AS item_total
FROM order_items
HAVING item_total > 500
ORDER BY item_total DESC;


SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS NULL;


SELECT NOW() AS today_unformatted,
DATE_FORMAT(NOW(),'%d-%b-%Y') AS today_formatted;


SELECT 100 AS price, 0.07 AS tax_rate,
(SELECT price * tax_rate) AS tax_amount,
(SELECT price + tax_amount) AS total;




