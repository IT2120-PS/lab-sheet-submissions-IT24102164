

-- Exercise 02

--(a)Create a view to display the list of movie titles, movie year, director name along with the number of theaters they have been shown in.

CREATE VIEW movieDetails01 AS
SELECT 
    m.title AS MovieTitle, 
    m.year AS MovieYear, 
    m.DirectorName, 
    COUNT(DISTINCT s.theaterName) AS NoOfTheaters
FROM Movie m
INNER JOIN Show s ON m.title = s.movieTitle AND m.year = s.movieYear
GROUP BY m.title, m.year, m.DirectorName;

SELECT * FROM movieDetails01;

--(b) Create a view that lists each theater, its city, and the total number of movies shown there.

CREATE VIEW TheaterMovieCount1 AS
SELECT 
    t.theaterName,
    t.city,
    COUNT(DISTINCT s.movieTitle) AS TotalMovies
FROM Theater t
INNER JOIN Show s ON t.theaterName = s.theaterName
GROUP BY t.theaterName, t.city;

SELECT * FROM TheaterMovieCount1;

--(c) Create a function that returns the number of movies they have acted in given a star name.
CREATE FUNCTION GetStarMovieCount(@starName varchar(25))
RETURNS INT
AS
BEGIN
    DECLARE @movieCount INT;
    SELECT @movieCount = COUNT(DISTINCT CONCAT(movieTitle, CAST(movieYear AS VARCHAR)))
    FROM StarsIn
    WHERE starname = @starName;
    RETURN ISNULL(@movieCount, 0);
END;
GO

SELECT dbo.GetStarMovieCount('Robert Downey') AS MovieCount;

--(d) Create a function that returns the total number of spectators given the theater name.

CREATE FUNCTION GetTotalSpectators(@theaterName varchar(20))
RETURNS INT
AS
BEGIN
    DECLARE @totalSpectators INT;
    SELECT @totalSpectators = SUM(spectators)
    FROM Show
    WHERE theaterName = @theaterName;
    RETURN ISNULL(@totalSpectators, 0);
END;
GO

SELECT dbo.GetTotalSpectators('Nitehawk') AS TotalSpectators;