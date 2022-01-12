USE Movies
GO

DECLARE @ID INT
DECLARE @Name VARCHAR(MAX)
DECLARE @Date DATETIME

SELECT  @ID = ActorID,
		@Name = ActorName,
		@Date = ActorDOB
FROM tblActor

WHERE ActorDOB >= '1970-01-01'
ORDER BY ActorDOB

SELECT @Name,@Date

SELECT 
	f.FilmName,
	c.CastCharacterName
FROM 
	tblFilm AS f JOIN tblcast c ON f.filmID = c.CastID
	WHERE c.CastActorID = @ID