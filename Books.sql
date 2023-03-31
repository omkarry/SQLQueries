--Create Table Authors
CREATE TABLE Authors (Id INT PRIMARY KEY, First_Name VARCHAR(20), Last_Name VARCHAR(20));

--Insert Values to Authors table
INSERT INTO Authors (Id, First_Name, Last_Name) VALUES
	(11, 'Ellen', 'Writer'),
	(12, 'Olga', 'Brain'),
	(13, 'Jack', 'Smart'),
	(14, 'Donald', 'Brain'),
	(15, 'Yao', 'Dou');


--Create table Editor
CREATE TABLE Editors (Id INT PRIMARY KEY, First_Name VARCHAR(20), Last_Name VARCHAR(20));

--Insert Values to Editor Table
INSERT INTO Editors (Id, First_Name, Last_Name) VALUES
	(21, 'Daniel', 'Brown'),
	(22, 'Mark', 'Johnson'),
	(23, 'Maria', 'Jones'),
	(24, 'Cathrine', 'Roberts'),
	(25, 'Sebastian', 'Wright'),
	(26, 'Barbara', 'Jones'),
	(27, 'Mathew', 'Smith');

--Create Table Translator
CREATE TABLE Translators (Id INT PRIMARY KEY, First_Name VARCHAR(20), Last_Name VARCHAR(20));

--Insert Values to Translator table
INSERT INTO Translators (Id, First_Name, Last_Name) VALUES
	(31, 'Ira', 'Davies'),
	(32, 'Ling', 'Weng'),
	(33, 'Kristian', 'Green'),
	(34, 'Roman', 'Edwards');

--Create Table Books
CREATE TABLE Books (Id INT PRIMARY KEY, Title VARCHAR(50), Type VARCHAR(10) CHECK (Type IN ('Original', 'Translated')), 
	Author_Id INT REFERENCES Authors(Id), Editor_Id INT REFERENCES Editors(Id), Translator_Id INT REFERENCES Translators(Id));

--Insert Values to Books Table
INSERT INTO Books (Id, Title, Type, Author_Id, Editor_Id, Translator_Id) VALUES
	(1, 'Time to Grow Up!', 'original', 11, 21,NULL),
	(2, 'Your Trip', 'translated', 15, 22, 32),
	(3, 'Lovely Love', 'original', 14, 24, NULL),	
	(4,	'Dream Your Life', 'original', 11, 24, NULL),
	(5,	'Oranges', 'translated', 12, 25, 31),
	(6,	'Your Happy Life',	'translated', 15, 22, 33),
	(7,	'Applied AI',	'translated', 13, 23, 34),
	(8, 'My Last Book', 'original', 11, 27,NULL);

--1.  let’s say that we want to display information about each book’s author and translator (i.e., their last names). 
--We also want to keep the basic information about each book (i.e., id, title, and type).

SELECT b.Id, b.Title, b.Type, a.Last_Name as Author_Last_Name, t.Last_Name as Translator_Last_Name
FROM Books b
JOIN Authors a ON b.Author_Id = a.Id
LEFT JOIN Translators t ON b.Translator_Id = t.Id;


--2. We want to show the basic book information (i.e., ID and title) along with the last names of the corresponding editors
SELECT b.Id, b.Title, e.Last_Name as Editor_Last_Name
FROM Books b
JOIN Editors e ON b.Editor_Id= e.Id;


--3. List all the Editors with their book titles by their last names
SELECT  e.Id, e.First_Name, e.Last_Name, b.Title
FROM Editors e 
JOIN Books b ON e.Id = b.Editor_Id
ORDER BY e.Last_Name;

--4. List of books their Authors, Editors, Translators by book type
SELECT b.Id, b.Title, b.Type,
CONCAT(a.First_Name, ' ', a.Last_Name) as Author_Name, 
CONCAT(e.First_Name, ' ', e.Last_Name) as Editor_Name,
CONCAT(t.First_Name, ' ', t.Last_Name) as Translator_Name
FROM Books b
JOIN Authors a ON b.Author_Id = a.Id
JOIN Editors e ON b.Editor_Id = e.Id
LEFT JOIN Translators t ON b.Translator_Id = t.Id
ORDER BY b.Type;