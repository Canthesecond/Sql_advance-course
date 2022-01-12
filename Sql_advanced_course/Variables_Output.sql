USE Movies
GO


ALTER PROC Filminyear ( 
	@Year INT,
	@FilmList VARCHAR(MAX) OUTPUT,
	@Filmcount INT OUTPUT

)

AS
BEGIN

DECLARE @Films VARCHAR(MAX) 
SET @Films = ' '


SELECT 
	@Films = @Films + FilmName + ', '
FROM 
	tblFilm	
WHERE
	YEAR(FilmReleaseDate) = @Year
ORDER BY 
	FilmName

	SET @Filmcount = @@ROWCOUNT
	SET @FilmList = @Films
END

