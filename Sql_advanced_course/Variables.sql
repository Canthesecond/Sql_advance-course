USE movies
GO

DECLARE @MyDate DATETIME
DECLARE @Numfilms INT
DECLARE @NumActors INT
DECLARE @NumDirectors INT 

SET @MyDate = '1980-01-01'
SET @Numfilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmReleaseDate>@MyDate)
SET @NumActors = (SELECT COUNT(*) FROM tblActor WHERE ActorDOB>@MyDate)
SET @NumDirectors = (SELECT COUNT(*) FROM tblDirector WHERE DirectorDOB>@MyDate)

PRINT 'Number of Films = ' +CAST(@Numfilms AS VARCHAR(MAX))
PRINT @NumActors



SELECT FilmName AS name,FilmReleaseDate AS date,'Film' AS type FROM tblFilm
WHERE FilmReleaseDate >= '1970'

UNION ALL

SELECT ActorName,ActorDOB,'Actor'
FROM tblActor
WHERE ActorDOB >= '1970'

UNION ALL

SELECT DirectorName,DirectorDOB,'Director'
FROM tblDirector
WHERE DirectorDOB >= '1970'
ORDER BY FilmReleaseDate