USE Movies
GO

-- Concatenating the numbers
DECLARE @Number INT
DECLARE @Castnumber NVARCHAR(4)
DECLARE @SQLString NVARCHAR(MAX)

SET @Number = 10
SET @Castnumber = CAST(@Number AS nvarchar(4))

SET @SQLString = N'SELECT TOP ' + @Castnumber + '* FROM TBLFILM ORDER BY FILMRELEASEDATE'

EXEC sp_executesql @SQLString


--Creating Stored Procedures
CREATE PROC spVariableTable
(
	@TableName NVARCHAR(128)
)
AS 
BEGIN
	DECLARE @String NVARCHAR(MAX)
	SET @String = N'SELECT * FROM ' + @TableName
	EXEC sp_executesql @String
END

--Adding Multiple Variables to the Stored Procedures
ALTER PROC spVariableTable
(
	@TableName NVARCHAR(128),
	@Number INT
)
AS 
BEGIN
	DECLARE @String NVARCHAR(MAX)
	DECLARE @NumberString NVARCHAR(4)
	
	SET @String = N'SELECT TOP ' + @NumberString + ' * FROM ' + @TableName
	SET @NumberString = CAST(@Number AS NVARCHAR(4))
	EXEC sp_executesql @String
END


--Dynamic SQL and the IN operator
CREATE PROC	spFilmYears
(
	@YearList NVARCHAR(MAX)
)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)
	SET @SQLString =
	'SELECT * FROM tblFilm
	WHERE YEAR(FilmReleaseDate) IN (' +@YearList + N')
	ORDER BY FilmReleaseDate'

	EXEC sp_executesql @SQLString
END


--Parameters of sp_executesql

EXEC sp_executesql
	N'SELECT FilmName, FilmReleaseDate, FilmRunTimeMinutes
	FROM tblFilm
	WHERE FilmRunTimeMinutes > @Length
	AND FilmReleaseDate > @StartDate'
	,N'@Length INT, @StartDate DATETIME'
	,@Length = 180
	,@StartDate = '2000-01-01'


--SQL injection (The possible danger)
