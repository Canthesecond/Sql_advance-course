--First example

DECLARE @NumFilms AS INT
SET	@NumFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmGenreID=3)

IF @NumFilms>0
	PRINT('There are too many romantic movies in the database')


--2ND EXAMPLE (Begin and End)
DECLARE @NumFilms1 AS INT
SET @NumFilms1 = (SELECT COUNT(*) FROM tblFilm WHERE FilmGenreID = 1)

IF @NumFilms1>4
	
		PRINT('Expectation has been met')
ELSE
	BEGIN
		PRINT'WARINING!'
		PRINT 'There is not enough action movies in the database'
	END


--3rd Example
DECLARE @NumFilms2 AS INT
DECLARE @Actionmovies AS INT

SET @NumFilms2 = (SELECT COUNT(*) FROM tblFilm WHERE FilmGenreID = 3)
SET @Actionmovies = (SELECT COUNT(*) FROM tblFilm WHERE FilmGenreID = 1)

IF @NumFilms2>4
	
		PRINT('Expectation has been met')
		IF @Actionmovies >	3
			BEGIN
				PRINT 'You are luck today!! Enough action movies in the database saved your ass'
			END
ELSE
	BEGIN
		PRINT'WARINING!'
		PRINT 'There is not enough action movies in the database'
	END



CREATE PROC spvariable
(
	@infotype VARCHAR (9) 
)

AS 
BEGIN
	IF @infotype = 'ALL'
		(SELECT * FROM tblFilm)
		RETURN

	IF @infotype = 'AWARD'
		(SELECT FilmName,FilmOscarNominations,FilmOscarWins FROM tblFilm)
		RETURN
END



--The last example
ALTER PROC prFilmList1 
(
	@infotype VARCHAR (9)
)

AS
BEGIN	
	IF @infotype = 'ALL'
		BEGIN
			SELECT * FROM tblFilm
			RETURN
		END

	IF @infotype = 'AWARD'
		BEGIN
			SELECT FilmName,FilmOscarNominations,FilmOscarWins FROM tblFilm
			RETURN
		END

	IF @infotype = 'FINANCIAL'
		BEGIN
			SELECT FilmName,FilmBudgetDollars,FilmBoxOfficeDollars FROM tblFilm
			RETURN
		END
	SELECT 'PLEASE SELECT ALL, AWARD OR FINANCIAL'
END

