USE Movies
GO
--Simple CTE
WITH MilleniumFilms AS	
(
SELECT
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm

WHERE
	YEAR(FilmReleaseDate) < 2000
)

SELECT
*
FROM
	MilleniumFilms
WHERE
	FilmRunTimeMinutes > 120


--Calculating Aggregates with CTEs
WITH FilmCounts AS
(
SELECT
	FilmCountryID, 
	COUNT(*) AS NumberofFilms
FROM
	tblFilm
GROUP BY 
FilmCountryID
)
SELECT 
	AVG(NumberofFilms)
FROM
	FilmCounts

--Labeling Columns in a CTE
WITH FilmCounts(Country,NumberofFilms) AS
(
SELECT
	FilmCountryID, 
	COUNT(*) 
FROM
	tblFilm
GROUP BY 
FilmCountryID
)
SELECT 
	Country,
	NumberofFilms
FROM
	FilmCounts

--Creating Multiple CTEs
WITH BeforeMilleniumFilms AS	
(
SELECT
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm

WHERE
	YEAR(FilmReleaseDate) < 2000
),
AfterMilleniumFilms AS	
(
SELECT
	FilmName,
	FilmReleaseDate,
	FilmRunTimeMinutes
FROM
	tblFilm

WHERE
	YEAR(FilmReleaseDate) > 2000
)
SELECT
	*
FROM 
	BeforeMilleniumFilms AS b
	INNER JOIN AfterMilleniumFilms AS a
	ON b.filmname=a.filmname