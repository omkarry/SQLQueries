CREATE TABLE Artist (artist_id INT Primary Key, artist_name VARCHAR(20));

CREATE TABLE Songs (song_id INT Primary Key, artist_id INT references Artist(artist_id));

CREATE TABLE Global_Song_Rank (day INT, song_id INT references Songs(song_id), rank INT);

INSERT INTO Artist (artist_id,  artist_name) VALUES
	(102, 'Ed Sheeran'),
	(120, 'Drake'),
	(110, 'Taylor Swift'),
	(125, 'DJ Snake')

INSERT INTO Songs (song_id, artist_id) VALUES
	(45202, 102),
	(19960, 120),
	(12453, 110),
	(21546, 125),
	(54543, 110);

INSERT INTO Global_Song_Rank (day, song_id, rank) VALUES
	(1, 45202, 5),
	(3, 45202, 2),
	(1, 19960, 3),
	(9, 19960, 15),
	(5, 12453, 3),
	(2, 54543, 1),
	(1, 21546, 4),
	(4, 12453, 2),
	(6, 54543, 1),
	(8, 21546, 5);

SELECT * FROM Artist;

SELECT * FROM Songs;

SELECT * FROM Global_Song_Rank;

SELECT artist_name, artist_rank 
FROM (SELECT a.artist_name, ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS artist_rank
	FROM Artist a
	JOIN Songs s ON a.artist_id = s.artist_id
	JOIN Global_Song_Rank gsl ON s.song_id = gsl.song_id
	WHERE gsl.rank<=10
	GROUP BY a.artist_name) AS ranked_artist
WHERE artist_rank <= 5;