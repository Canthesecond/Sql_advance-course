DECLARE @ColumnNames NVARCHAR(MAX) = ''
DECLARE @SQL NVARCHAR(MAX)
	
SELECT @ColumnNames += QUOTENAME( CountryName) + ',' FROM tblCountry
ORDER BY CountryName

SET @ColumnNames = LEFT(@ColumnNames,LEN(@ColumnNames)-1)

SET @SQL = '
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
			IN(' + @ColumnNames +
			')
) AS PivotTable'

EXEC sp_executesql @SQL