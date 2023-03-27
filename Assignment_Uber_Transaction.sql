CREATE TABLE Uber_Transaction (user_id INT, spend MONEY, transaction_date DATETIME);

INSERT INTO Uber_Transaction VALUES
	(111, 120.23, '2022-06-12 12:00:00'),
	(155, 100.00, '2022-05-30 12:00:00'),
	(155, 156.00, '2022-11-20 12:00:00'),
	(155, 98.00, '2022-01-30 12:00:00'),
	(155, 300.60, '2022-08-12 12:00:00'),
	(111, 100.50, '2022-08-01 12:00:00'),
	(111, 55.00, '2022-10-01 12:00:00'),
	(121, 36.00, '2022-01-18 12:00:00'),
	(145, 24.99, '2022-01-26 12:00:00'),
	(111, 89.60, '2022-05-02 12:00:00');

SELECT * FROM Uber_Transaction;

SELECT user_id, spend, transaction_date 
FROM (SELECT user_id, spend, transaction_date, 
		(SELECT COUNT(*) 
		FROM Uber_Transaction t2 
		WHERE t1.user_id = t2.user_id
		AND t2.transaction_date <= t1.transaction_date) AS transaction_count
	FROM Uber_Transaction t1)t
WHERE transaction_count = 3;