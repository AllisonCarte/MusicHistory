-- 1. Query all of the entries in the Genre table
--SELECT * from Genre;

-- 2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
--SELECT * FROM Artist ORDER BY ArtistName ASC;

-- 3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
--SELECT s.Title, a.ArtistName FROM Song s LEFT JOIN Artist a ON s.ArtistId = a.id;

-- 4. Write a SELECT query that lists all the Artists that have a Pop Album
--pop = 7
--SELECT artist.ArtistName, genre.[Label] FROM Artist JOIN Album ON Artist.id = album.ArtistId JOIN Genre ON album.GenreId = Genre.Id WHERE Genre.Id = 7 ORDER BY [Label] DESC;

--5 Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
--jazz = 4
--rock = 2
--SELECT artist.ArtistName, genre.[Label] FROM Artist JOIN Album ON Artist.id = album.ArtistId JOIN Genre ON album.GenreId = Genre.Id WHERE Genre.Id = 4 OR Genre.id = 2 ORDER BY [Label] DESC;

--6 Write a SELECT statement that lists the Albums with no songs
--SELECT Title FROM Album WHERE AlbumLength = 0; <-- how I initially thought it was done
--SELECT a.Title as AlbumTitle, s.Title as SongTitle FROM Album a LEFT JOIN Song s on a.id = s.AlbumId where s.Id IS Null; <-- how it's actually done

--7 Using the INSERT statement, add one of your favorite artists to the Artist table.
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Will Wood', '2015');

--8 Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, [Label], ArtistId, GenreId) VALUES ('Everything Is a Lot', '5/20/2015', '2951', 'Say-10', '31', '16');

--9 Using the INSERT statement, add some songs that are on that album to the Song table.
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('6up 5oh Cop-Out (Pro / Con)', '222', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('White Knuckle Jerk (Where Do You Get Off?)', '229', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Front Street', '315', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Red Moon', '249', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('The First Step', '198', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Lysergide Daydream', '206', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Thermodynamic Lawyer Esq, G.F.D.', '220', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('¡Aikido! (Neurotic / Erotic)', '133', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Skeleton Appreciation Day in Vestal, NY (Bones)', '245', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Jimmy Mushrooms Last Drink: Bedtime in Wayne, NJ', '169', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Everything Is a Lot', '326', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Chemical Overreaction / Compound Fracture', '202', '5/20/2015', '16', '31', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Cover This Song (A Little Bit Mine)', '237', '5/20/2015', '16', '31', '23');

--10 Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
--SELECT s.Title, a.Title, n.ArtistName FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id LEFT JOIN Artist N ON s.ArtistId = n.Id WHERE a.Title = 'Everything is A Lot';

--11 Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--SELECT a.Title, COUNT(s.Title) AS SongCount FROM Song s RIGHT JOIN Album a ON s.AlbumId = a.Id GROUP BY a.Title ORDER BY 2 Desc;

--12 Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--SELECT a.ArtistName, COUNT(s.Title) AS SongCount FROM Song s RIGHT JOIN Artist a ON s.ArtistId = a.Id GROUP BY a.ArtistName ORDER BY 2 Desc;

--13 Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--SELECT g.[Label], COUNT(s.Title) AS SongCount FROM Song s RIGHT JOIN Genre g ON s.GenreId = g.Id GROUP BY g.[Label] ORDER BY 2 Desc;

--14 Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
--SELECT a.ArtistName, COUNT(distinct b.[Label]) as LabelCount FROM Artist a RIGHT JOIN Album b on b.ArtistId = a.Id GROUP BY a.ArtistName HAVING (COUNT(distinct b.[label])) > 1;

--15 Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
--SELECT Title as AlbumTitle, AlbumLength FROM Album WHERE AlbumLength IN (select MAX(AlbumLength) from Album);

--16 Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
--SELECT s.Title as SongTitle, s.SongLength FROM Song s where s.SongLength IN (SELECT MAX(s.SongLength) from Song s) ;

--17 Modify the previous query to also display the title of the album.
--Select s.Title as SongTitle, s.SongLength, a.Title as AlbumTitle FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id WHERE s.SongLength IN (SELECT MAX(s.SongLength) from Song s);