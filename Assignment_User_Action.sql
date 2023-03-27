CREATE TABLE User_Action (user_id INT, event_id INT, event_type VARCHAR(15), event_date DATETIME);

INSERT INTO User_Action (user_id, event_id, event_type, event_date) VALUES
	(445, 7765, 'sign-in', '2022-05-31 12:00:00'),
	(742, 6458, 'sign-in', '2022-06-03 12:00:00'),
	(445, 3634, 'like', '2022-04-05 12:00:00'),
	(742, 1374, 'comment', '2022-06-05 12:00:00'),
	(648, 3124, 'like', '2022-05-08 12:00:00');

SELECT * FROM User_Action;

SELECT MONTH(event_date) AS month, COUNT(DISTINCT user_id) AS MAUs
FROM User_Action
WHERE event_type IN ('sign-in', 'like', 'comment')
AND YEAR(event_date) = 2022
AND MONTH(event_date) IN (4,5)
GROUP BY MONTH(event_date)
ORDER BY month ASC, MAUs DESC;