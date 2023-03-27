CREATE TABLE Instagram_Pages (page_id INT PRIMARY KEY, page_name varchar(50));

CREATE TABLE Page_Likes (user_id INT, page_id INT references Instagram_Pages(page_id), liked_date DATETIME);

INSERT INTO Instagram_Pages (page_id, page_name) VALUES
	(20001, 'SQL Solutions'),
	(20045, 'Brain Exercises'),
	(20701, 'Tips for Data Analytics'),
	(20502, 'C# Basics'),
	(20482, 'React Tutorials');

INSERT INTO Page_Likes (user_id, page_id, liked_date) VALUES
	(111, 20001, '2022-08-04 00:00:00'),
	(121, 20045, '2022-12-03 00:00:00'),
	(156, 20001, '2022-07-25 00:00:00'),
	(111, 20502, '2022-09-08 09:32:10');

SELECT * FROM Instagram_Pages;

SELECT * FROM Page_Likes;

SELECT ip.page_id
FROM Instagram_Pages ip
LEFT JOIN Page_Likes pl ON ip.page_id = pl.page_id
WHERE user_id IS NULL
ORDER BY ip.page_id;