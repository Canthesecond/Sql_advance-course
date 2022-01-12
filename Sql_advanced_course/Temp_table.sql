USE Movies
GO

-- Temp table creation
SELECT 
	FilmName,
	FilmReleaseDate
INTO #TempFilms
FROM 
	TBLFILM

WHERE 
	FilmName LIKE '%star%'

SELECT * FROM #TempFilms


--2nd way of creating a temp table
CREATE TABLE #TempFilms
(
	Title VARCHAR(MAX),
	Releasedate DATETIME
)
INSERT INTO #TempFilms
SELECT 
	FilmName,
	FilmReleaseDate
FROM 
	TBLFILM
WHERE 
	FilmName LIKE '%star%'

SELECT *FROM #TempFilms

--Global Temporary Tables
CREATE TABLE ##TempFilms
(
	Title VARCHAR(MAX),
	Releasedate DATETIME
)
INSERT INTO ##TempFilms
SELECT 
	FilmName,
	FilmReleaseDate
FROM 
	TBLFILM
WHERE 
	FilmName LIKE '%star%'

SELECT *FROM ##TempFilms
