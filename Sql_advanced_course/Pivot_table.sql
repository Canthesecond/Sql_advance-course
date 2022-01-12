SELECT * FROM 
	(SELECT 
		CountryName,
		FilmID
	FROM
		tblCountry AS c
		INNER JOIN tblFilm AS f 
		ON c.CountryID = f.FilmCountryID) AS BaseData

PIVOT(
	COUNT(FILMID)
	FOR CountryName
			IN([China]
		,[France]
		,[Japan]
		,[New Zealand]
		,[United Kingdom]
		,[United States]
		,[Germany]
		,[Russia])
) AS PivotTable


--Adding rows to the group
SELECT * FROM 
	(SELECT 
		CountryName,
		YEAR(FilmReleaseDate) AS [FilmYear],
		FilmID
	FROM
		tblCountry AS c
		INNER JOIN tblFilm AS f 
		ON c.CountryID = f.FilmCountryID) AS BaseData

PIVOT(
	COUNT(FILMID)
	FOR CountryName
			IN([China]
				,[France]
				,[Germany]
				,[Japan]
				,[New Zealand]
				,[Russia]
				,[United Kingdom]
				,[United States])
) AS PivotTable


--Creating Multiple Rows
SELECT * FROM 
	(SELECT 
		CountryName,
		YEAR(FilmReleaseDate) AS [FilmYear],
		DATENAME(MM,FilmReleaseDate) AS [FilmMonth],
		FilmID
	FROM
		tblCountry AS c
		INNER JOIN tblFilm AS f 
		ON c.CountryID = f.FilmCountryID) AS BaseData

PIVOT(
	COUNT(FILMID)
	FOR CountryName
			IN([China]
				,[France]
				,[Germany]
				,[Japan]
				,[New Zealand]
				,[Russia]
				,[United Kingdom]
				,[United States])
) AS PivotTable
