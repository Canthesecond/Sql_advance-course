DECLARE @TempFilms TABLE
(
	Name VARCHAR(MAX),
	DOB DATETIME
)

INSERT INTO @TempFilms
SELECT 
	ActorName,
	ActorDOB
FROM 
	tblActor
WHERE 
	ActorDOB > '1970-01-01'

SELECT *FROM @TempFilms