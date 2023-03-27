CREATE TABLE Mall_Transaction (product_id INT, user_id INT,	spend MONEY, transaction_date DATETIME);

INSERT INTO Mall_Transaction(product_id, user_id, spend, transaction_date) VALUES
	(3673, 123, 68.90, '2022-07-08 12:00:00'),
	(9623, 123, 274.10, '2022-07-08 12:00:00'),
	(1467, 115, 19.90, '2022-07-08 12:00:00'),
	(2513, 159, 25.00, '2022-07-08 12:00:00'),
	(1452, 159, 74.50, '2022-07-10 12:00:00');

SELECT * FROM Mall_Transaction

SELECT t1.transaction_date, t1.user_id, COUNT(t1.product_id) AS num_products
FROM Mall_Transaction t1
JOIN (
	SELECT user_id, MAX(transaction_date) AS recent_transaction
	FROM Mall_Transaction
	GROUP BY user_id)t2 ON t1.user_id = t2.user_id AND t1.transaction_date = t2.recent_transaction
GROUP BY t1.transaction_date, t1.user_id
ORDER BY t1.transaction_date;
