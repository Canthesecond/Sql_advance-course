--Procedures creation

USE movies
GO
--ALTER PROC for modification
ALTER PROC Filmsinyear 
(
@MinLength AS INT = NULL,
@MaxLength AS INT = NULL,
@Title AS VARCHAR(MAX)
)
AS
BEGIN

	SELECT 
		FilmName,FilmReleaseDate
	FROM
		tblFilm
	 WHERE
		(@MinLength IS NULL OR FilmRunTimeMinutes>=@MinLength)
		and (@MaxLength IS NULL OR FilmRunTimeMinutes<=@MaxLength)
		and FilmName LIKE '%'	+@Title+	'%'
	 GROUP BY 
		FilmReleaseDate
	 ORDER BY FilmReleaseDate;
END;



--Executing procedure
EXECUTE movies_list 120,200,@Title='star'







