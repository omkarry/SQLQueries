CREATE TABLE Candidate (candidate_id INT, skill varchar(15));

INSERT INTO Candidate (candidate_id, skill) VALUES
	(001, 'C#'),
	(001, 'MVC'),
	(001, 'SQL'),
	(145, 'MVC'),
	(145, 'PowerBI'),
	(145, 'SQL'),
	(345, 'C#'),
	(345, 'MVC'),
	(200, 'SQL'),
	(404, 'SQL'),
	(404, 'MVC'),
	(404, 'PowerBI'),
	(404, 'C#');

SELECT * FROM Candidate;

SELECT candidate_id
FROM Candidate
Where skill = 'C#'
AND candidate_id IN (SELECT candidate_id FROM Candidate WHERE skill = 'MVC')
AND candidate_id IN (SELECT candidate_id FROM Candidate WHERE skill = 'SQL')
ORDER BY candidate_id;