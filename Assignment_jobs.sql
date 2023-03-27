CREATE TABLE Jobs (job_id INT Primary Key, company_id INT, title VARCHAR(30), desciption VARCHAR(MAX));

INSERT INTO Jobs VALUES
	(248, 827, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'),
	(149, 845, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'),
	(945, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business''s customers and ways the data can be used to solve problems.'),
	(164, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business''s customers and ways the data can be used to solve problems.'),
	(172, 344, 'Data Engineer', 'Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.'),
	(398, 827, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.');

SELECT * FROM Jobs

SELECT COUNT(DISTINCT j1.company_id) as num_of_companies
FROM Jobs j1
INNER JOIN Jobs j2 ON j1.company_id = j2.company_id
WHERE j1.company_id = j2.company_id
AND j1.title = j2.title
AND j1.desciption = j2.desciption
AND j1.job_id < j2.job_id;