USE Movies

SELECT
	FilmName,
	FilmReleaseDate
FROM 
	tblfilm
WHERE 
	FilmOscarWins=
		(SELECT 
			MAX(filmoscarwins)
		FROM
			tblfilm)


SELECT
	FilmName,
	FilmRuntimeMinutes
FROM
	tblfilm
WHERE
	FilmRuntimeMinutes >=
		(SELECT 
			AVG(FilmRunTimeMinutes)
		FROM	
			tblFilm)

SELECT
	filmname,
	filmreleasedate,
	FilmBoxOfficeDollars
FROM
tblfilm
WHERE
	FilmBoxOfficeDollars>
		(SELECT
		AVG(CONVERT(BIGINT,FilmBoxOfficeDollars))
		FROM
			tblFilm
		WHERE
			YEAR(FilmReleaseDate)>2000)

SELECT
	filmname,
	filmreleasedate,
	FilmBoxOfficeDollars
FROM
tblfilm
WHERE
	FilmBudgetDollars>
		(SELECT
		MAX(FilmBudgetDollars)
		FROM
			tblFilm
		WHERE
			YEAR(FilmReleaseDate)<2000)


SELECT
	FilmName,
	FilmDirectorID,
	FilmOscarWins
FROM 
	tblfilm
WHERE 
	FilmDirectorID in
(SELECT
	DirectorID
FROM
	tblDirector
WHERE 
 DirectorDOB BETWEEN '1970-01-01' AND '1970-12-31')


SELECT
	c.CountryName,
	f.FilmName,
	f.FilmCountryID
FROM
	tblfilm f
	JOIN tblcountry c ON f.FilmCountryID = c.CountryID
WHERE
	FilmRunTimeMinutes=
		(SELECT 
			MAX(FilmRunTimeMinutes)
		FROM
			tblFilm x
			WHERE x.FilmCountryID=f.FilmCountryID)


SELECT
	FilmName,
	FilmRunTimeMinutes,
	YEAR(FilmReleaseDate) AS x
FROM
	tblFilm f
WHERE
	FilmRunTimeMinutes>
		(SELECT
			AVG(FilmRunTimeMinutes)
		FROM
			tblFilm g
		WHERE
			YEAR(f.FilmReleaseDate)=YEAR(g.FilmReleaseDate)
)
ORDER BY x